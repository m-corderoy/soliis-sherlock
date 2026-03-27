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

Future<String?> newStorageBucket(String? tenantFolder) async {
  // Add your function code here!
  try {
    final supabase = SupaFlow.client;

    await supabase.storage.from(tenantFolder!).uploadBinary(
          'testtest/',
          Uint8List(0), // Empty Uint8List to represent an empty file
          fileOptions: const FileOptions(contentType: 'application/x-empty'),
        );

    //return bucketId;
  } catch (e) {
    // Handle any errors that occur during the process
    print('Error creating new bucket: $e');
    throw Exception('User creation failed: $e');
  }
}
