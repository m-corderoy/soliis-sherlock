// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';

StreamSubscription<fb_auth.User?>? _authWatcher;

Future<void> updateSupabaseTokenWithTenantID() async {
  debugPrint('🔔 [Sherlock] Starting updateSupabaseTokenWithTenantID');

  _authWatcher ??= fb_auth.FirebaseAuth.instance
      .authStateChanges()
      .listen((u) => u == null ? _signOut() : _sync(u!));

  final user = fb_auth.FirebaseAuth.instance.currentUser;
  if (user != null) {
    debugPrint('🔔 [Sherlock] User is logged in, syncing...');
    await _sync(user);
  } else {
    debugPrint('❌ [Sherlock] No user is logged in');
  }
}

Future<void> _sync(fb_auth.User user) async {
  try {
    debugPrint('🔔 [Sherlock] Starting sync process');

    // Get tenant ID from app state
    //
    //
    //final int tenantId = FFAppState().session.tenantID;
    //debugPrint('🔔 [Sherlock] Current tenant ID: $tenantId');

    // Skip token generation if tenant ID is not set (0 or negative)
    //if (tenantId <= 0) {
    //debugPrint(
    //  '⚠️ [Sherlock] Skipping token generation - valid tenant ID not set yet ($tenantId)');
    //return;
    //}

// NEW
    final session =
        FFAppState().session; // this might itself be non-null default

    int? tenantId;
    try {
      tenantId = session.tenantID; // will still throw if getter uses !
    } catch (e) {
      debugPrint('⚠️ [Sherlock] session.tenantID is not initialised yet: $e');
      return;
    }

    debugPrint('🔔 [Sherlock] Current tenant ID: $tenantId');

// If tenantId can legitimately be null, treat that as "not ready"
    if (tenantId == null || tenantId <= 0) {
      debugPrint(
        '⚠️ [Sherlock] Skipping token generation - valid tenant ID not set yet ($tenantId)',
      );
      return;
    }

    final supa = Supabase.instance.client;

    // 1) Handle nullable ID token - Force refresh to ensure we get the latest claims
    debugPrint('🔔 [Sherlock] Getting fresh ID token...');
    await user.getIdToken(true); // Force refresh first
    final String? idTokenNullable = await user.getIdToken(true);
    if (idTokenNullable == null) {
      debugPrint('❌ [Sherlock] Failed to get ID token');
      return;
    }
    final String idToken = idTokenNullable;
    debugPrint('✅ [Sherlock] ID token ready, length=${idToken.length}');

    // 2) Hit your Cloud Function with detailed logging
    debugPrint('🔔 [Sherlock] Preparing to call cloud function...');
    final uri = Uri.parse(
      'https://us-central1-holmes-xws01o.cloudfunctions.net/'
      'mintWebSupabaseTokenWithTenantId',
    );
    debugPrint('🔔 [Sherlock] Cloud function URL: ${uri.toString()}');

    // Create request payload with modified format for callable functions
    final Map<String, dynamic> requestPayload = {
      'data': {
        'token': idToken,
        'tenantId': tenantId.toString() // Convert to string
      }
    };

    debugPrint('🔔 [Sherlock] Request payload: ${jsonEncode(requestPayload)}');

    // Make HTTP request with detailed error handling
    http.Response? resp;
    try {
      debugPrint('🔔 [Sherlock] Sending HTTP request...');
      resp = await http
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer $idToken',
            },
            body: jsonEncode(requestPayload),
          )
          .timeout(const Duration(seconds: 30));

      debugPrint('✅ [Sherlock] HTTP request completed');
      debugPrint('🔔 [Sherlock] Response status: ${resp.statusCode}');
      debugPrint('🔔 [Sherlock] Response body: ${resp.body}');
    } catch (e, st) {
      debugPrint('❌ [Sherlock] HTTP request failed: $e');
      debugPrint('❌ [Sherlock] Stack trace: $st');
      return;
    }

    // Check for HTTP success
    if (resp.statusCode != 200) {
      debugPrint(
          '❌ [Sherlock] HTTP request failed with status ${resp.statusCode}');
      debugPrint('❌ [Sherlock] Response body: ${resp.body}');
      return;
    }

    // 3) Parse response JSON
    Map<String, dynamic>? envelope;
    try {
      debugPrint('🔔 [Sherlock] Parsing response JSON...');
      envelope = jsonDecode(resp.body) as Map<String, dynamic>;
      debugPrint('✅ [Sherlock] Response parsed: ${envelope.keys.join(', ')}');
    } catch (e) {
      debugPrint('❌ [Sherlock] JSON parse error: $e');
      return;
    }

    // 4) Extract token - adjusted for possible callable function response format
    String? supaJwt;
    if (envelope.containsKey('result') &&
        envelope['result'] is Map &&
        (envelope['result'] as Map).containsKey('access_token')) {
      supaJwt = (envelope['result'] as Map)['access_token'] as String;
      debugPrint('✅ [Sherlock] Found access_token in result object');
    } else if (envelope.containsKey('access_token')) {
      supaJwt = envelope['access_token'] as String;
      debugPrint('✅ [Sherlock] Found access_token at root level');
    } else if (envelope.containsKey('data') &&
        envelope['data'] is Map &&
        (envelope['data'] as Map).containsKey('access_token')) {
      supaJwt = (envelope['data'] as Map)['access_token'] as String;
      debugPrint('✅ [Sherlock] Found access_token in data object');
    } else {
      debugPrint('❌ [Sherlock] access_token missing in response');
      debugPrint('❌ [Sherlock] Response keys: ${envelope.keys.join(', ')}');
      return;
    }

    // 5) Try to decode JWT to check tenant_id
    try {
      final parts = supaJwt.split('.');
      if (parts.length == 3) {
        final payload = parts[1];
        final normalized = base64Url.normalize(payload);
        final decodedPayload = utf8.decode(base64Url.decode(normalized));

        final payloadJson = jsonDecode(decodedPayload) as Map<String, dynamic>;
        debugPrint(
            '🔔 [Sherlock] JWT payload: tenant_id=${payloadJson['tenant_id']}');

        // Verify tenant ID in token matches requested tenant ID
        if (payloadJson['tenant_id'].toString() != tenantId.toString()) {
          debugPrint(
              '⚠️ [Sherlock] Warning: JWT tenant_id (${payloadJson['tenant_id']}) does not match requested tenant ID ($tenantId)');
        }
      }
    } catch (e) {
      debugPrint('⚠️ [Sherlock] Could not decode JWT: $e');
    }

    // 6) Inject token
    debugPrint('🔔 [Sherlock] Injecting token into Supabase client...');
    supa.rest.setAuth(supaJwt);
    FFAppState().supabaseAuthToken = supaJwt;
    debugPrint('✅ [Sherlock] JWT injected successfully');
  } catch (e, st) {
    debugPrint('❌ [Sherlock] Unhandled error in sync: $e');
    debugPrint('❌ [Sherlock] Stack trace: $st');
  }
}

Future<void> _signOut() async {
  try {
    await Supabase.instance.client.auth.signOut();
    FFAppState().supabaseAuthToken = '';
    debugPrint('✅ [Sherlock] Signed out successfully');
  } catch (e) {
    debugPrint('❌ [Sherlock] Error during sign out: $e');
  }
}
