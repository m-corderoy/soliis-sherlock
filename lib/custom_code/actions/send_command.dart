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

import 'package:http/http.dart' as http;
import 'dart:convert';

Future sendCommand(
  String webhookUrl,
  String command,
  String sessionId,
  int tenantId,
  String userEmail,
  String userName,
  int? boardId,
  int? cardId,
) async {
  try {
    final payload = jsonEncode({
      'type': 'text',
      'content': command,
      'language': 'en',
      'userName': userName,
      'userEmail': userEmail,
      'sessionId': sessionId,
      'tenantId': tenantId,
      if (boardId != null) 'board_ID': boardId,
      if (cardId != null) 'card_ID': cardId,
    });

    final response = await http.post(
      Uri.parse(webhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: payload,
    );

    debugPrint('sendCommand [${command}] status: ${response.statusCode}');
  } catch (e) {
    debugPrint('sendCommand error: $e');
  }
}
