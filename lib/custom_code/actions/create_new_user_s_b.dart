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

Future<String> createNewUserSB(
  String newEmail,
  String newPassword,
) async {
  try {
    final supabase = SupaFlow.client;

    // Create new user
    final AuthResponse res = await supabase.auth.signUp(
      email: newEmail,
      password: newPassword,
    );

    final User? user = res.user;

    if (user == null) {
      throw Exception('User creation failed: User is null');
    }

    final newUserId = user.id;
    return newUserId;
  } catch (e) {
    // Handle any errors that occur during the process
    print('Error creating new user: $e');
    throw Exception('User creation failed: $e');
  }
}
