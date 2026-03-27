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

import 'package:supabase_flutter/supabase_flutter.dart';

/// Subscribes to a specified table in Supabase to receive real-time updates.

Future<void> subscribe(
  String table,
  Future Function() callbackAction,
  int tenantId,
  String customJWT,
) async {
  try {
    // Set custom JWT for Realtime auth
    Supabase.instance.client.realtime.setAuth(customJWT);

    final channel = SupaFlow.client.channel('public:$table');

    channel.onPostgresChanges(
      event: PostgresChangeEvent.insert,
      schema: 'public',
      table: table,
      filter: PostgresChangeFilter(
        type: PostgresChangeFilterType.eq,
        column: "tenant_id",
        value: tenantId,
      ),
      callback: (payload) async {
        await callbackAction();
      },
    );

    channel.subscribe();

    print('Subscribed to $table for tenant_id=$tenantId');
  } catch (e) {
    print('Error subscribing to $table: $e');
  }
}
