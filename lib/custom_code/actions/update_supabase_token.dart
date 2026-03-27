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

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:cloud_functions/cloud_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
// We'll store the subscription at a global or static level
// so it persists beyond this function call.
StreamSubscription<firebase_auth.User?>? _authWatcher;

Future<void> updateSupabaseToken() async {
  try {
    // 1) If we haven't already set up the listener, do it now.
    if (_authWatcher == null) {
      _authWatcher = firebase_auth.FirebaseAuth.instance
          .userChanges()
          .listen((firebase_auth.User? user) async {
        if (user == null) {
          // User signed out
          // Optionally sign out from Supabase
          await Supabase.instance.client.auth.signOut();
          debugPrint('Signed out of Supabase because Firebase user is null.');
        } else {
          // Update the token whenever the user logs in or refreshes
          await _fetchAndSetSupabaseToken(user);
        }
      });
      debugPrint('Auth watcher set up successfully.');
    } else {
      debugPrint('Auth watcher already set up.');
    }

    // 2) If a user is currently signed in, do an immediate token update.
    final user = firebase_auth.FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _fetchAndSetSupabaseToken(user);
    } else {
      // If user == null, optionally sign out from Supabase right now
      // in case you want a truly "no user" state.
      await Supabase.instance.client.auth.signOut();
      debugPrint('No user currently signed in; signed out from Supabase.');
    }
  } catch (e, st) {
    debugPrint('Error in updateSupabaseTokenAction: $e\n$st');
  }
}

// Helper to fetch the token and update Supabase
Future<void> _fetchAndSetSupabaseToken(firebase_auth.User user) async {
  try {
    final firebaseToken = await user.getIdToken();
    final callable =
        FirebaseFunctions.instance.httpsCallable('mintSupabaseToken');
    final response = await callable.call({
      'token': firebaseToken,
      'userId': user.uid,
      'tenantId': FFAppState().session.tenantID,
      // pass any extra fields needed by your CF
    });

    final data = response.data;
    if (data == null || data['access_token'] == null) {
      debugPrint('No supaToken in Cloud Function response!');
      return;
    }

    final supaToken = data['access_token'];
    Supabase.instance.client.headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $supaToken',
    };
    Supabase.instance.client.rest.setAuth(supaToken);
    FFAppState().supabaseAuthToken = supaToken;

    debugPrint('Supabase token updated successfully for user ${user.uid}.');
  } catch (e, st) {
    debugPrint('Error fetching/setting Supabase token: $e\n$st');
  }
}
