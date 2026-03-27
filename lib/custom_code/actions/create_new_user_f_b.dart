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

import 'package:firebase_auth/firebase_auth.dart' as fbAuth;

Future<String> createNewUserFB(
  String newEmail,
  String newPassword,
) async {
  try {
    final fbAuth.UserCredential userCredential =
        await fbAuth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: newEmail.trim(),
      password: newPassword,
    );

    final fbAuth.User? user = userCredential.user;
    if (user == null) {
      throw Exception('User creation failed: User is null');
    }

    return user.uid;
  } on fbAuth.FirebaseAuthException catch (e) {
    print(
        'FirebaseAuthException while creating user: ${e.code} - ${e.message}');
    throw Exception('User creation failed: ${e.code}');
  } catch (e) {
    print('Error creating new user: $e');
    throw Exception('User creation failed: $e');
  }
}
