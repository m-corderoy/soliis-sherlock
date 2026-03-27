import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/auth/firebase_auth/auth_util.dart';

String? codeGenerate(int num) {
  if (num <= 3) return '';

  final random = math.Random();

  final letters = 'abcdefghijklmnopqrstuvwxyz';
  final digits = '0123456789';
  final capital = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final specialChars = '@#&*%';

  // Ensuring at least one of each required character type
  final selectedSpecialChar = specialChars[random.nextInt(specialChars.length)];
  final selectedDigit = digits[random.nextInt(digits.length)];
  final selectedCapital = capital[random.nextInt(capital.length)];

  // Generate the rest of the code using letters and digits
  final otherChars = List.generate((num - 3), (index) {
    final allChars = letters + digits;
    return allChars[random.nextInt(allChars.length)];
  });

  // Add the required characters in random positions
  final codeChars = [
    ...otherChars,
    selectedSpecialChar,
    selectedDigit,
    selectedCapital
  ];
  codeChars.shuffle(random);

  return codeChars.join();
}

DateTime? formatDate(String? expirydate) {
  // take the date argument and format it 'd/M/y'
  if (expirydate == null) {
    return null;
  }
  final dateFormat = DateFormat('d/M/y');
  final parsedDate = DateTime.tryParse(expirydate);
  if (parsedDate == null) {
    return null;
  }
  return DateTime(parsedDate.year, parsedDate.month, parsedDate.day);
}

String? intToString(int? numberInt) {
  return numberInt.toString();
}

String? urlDecode(String? firestoreurl) {
  // I have an image location from firectore (firestoreurl) and I want to convert it to a url an image widget can use
  if (firestoreurl == null) return null;
  // Assuming firestoreurl is a base64 encoded string
  final decodedBytes = base64.decode(firestoreurl);
  return String.fromCharCodes(decodedBytes);
}

String? extractMessageContent(dynamic jsonContent) {
  if (jsonContent is List && jsonContent.isNotEmpty) {
    final message = jsonContent[0]['message'];
    if (message != null && message['content'] != null) {
      return message['content'] as String;
    }
  }
  return null;
}

String? formatJsonDate(
  String jsonDateString,
  String style,
) {
  try {
    DateTime dateTime = DateTime.parse(jsonDateString);
    DateTime now = DateTime.now();

    switch (style.toLowerCase()) {
      case 'relative':
        return getRelativeTime(dateTime, now);

      case 'short':
        return DateFormat('M/d/y').format(dateTime);

      case 'medium':
        return DateFormat('MMM d, y').format(dateTime);

      case 'long':
        return DateFormat('MMMM d, y').format(dateTime);

      case 'datetime':
        return DateFormat('MMM d, y \'at\' h:mm a').format(dateTime);

      case 'time':
        return DateFormat('h:mm a').format(dateTime);

      case 'iso':
        return dateTime.toIso8601String();

      default:
        return DateFormat('MMM d, y').format(dateTime);
    }
  } catch (e) {
    return jsonDateString; // Return original if parsing fails
  }
}

String getRelativeTime(DateTime dateTime, DateTime now) {
  Duration difference = now.difference(dateTime);

  if (difference.inDays > 365) {
    int years = (difference.inDays / 365).floor();
    return '${years} year${years > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 30) {
    int months = (difference.inDays / 30).floor();
    return '${months} month${months > 1 ? 's' : ''} ago';
  } else if (difference.inDays > 0) {
    return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
  } else {
    return 'Just now';
  }
}

String ltreeMatchState(
  String currentLtree,
  String selectedLtree,
) {
  if (currentLtree == selectedLtree) {
    return 'exact';
  } else if (selectedLtree.startsWith('$currentLtree.')) {
    return 'ancestor';
  } else {
    return 'none';
  }
}

int? colorToInt8(Color colorValue) {
  if (colorValue == null) return null; // allow nullable input

  // ignore: deprecated_member_use
  return colorValue.value; // ARGB as int (0xAARRGGBB)
}

Color? int8ToColor(int? value) {
  if (value == null) return null;
  return Color(value);
}

String? imageToBase64(FFUploadedFile? file) {
  if (file == null || file.bytes == null) {
    return null;
  }

  String base64String = base64Encode(file.bytes!);

  return base64String;
}

FFUploadedFile? base64ToImage(String? base64Image) {
  // convert the base64 image "base64Image" to an UploadedFile
  if (base64Image == null || base64Image.isEmpty) {
    return null;
  }

  try {
    // Handle common base64 image prefixes (data:image/jpeg;base64,...)
    String cleanBase64 = base64Image;
    if (base64Image.contains(',')) {
      cleanBase64 = base64Image.split(',').last;
    }

    // Remove any whitespace that might cause issues
    cleanBase64 = cleanBase64.replaceAll(RegExp(r'\s'), '');

    final bytes = base64.decode(cleanBase64);
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

    return FFUploadedFile(bytes: bytes, name: fileName);
  } catch (e) {
    print('Error in base64ToImage: $e');
    return null;
  }
}

String? createSlug(String? input) {
// 0. Handle null or empty/whitespace-only values
  if (input == null || input.trim().isEmpty) {
    return '';
  }

  // Promote to non-nullable local variable
  final value = input;

  // 1. Lowercase & trim
  String slug = value.toLowerCase().trim();

  // 2. Replace whitespace with hyphens
  slug = slug.replaceAll(RegExp(r'\s+'), '-');

  // 3. Remove invalid characters (keep letters, numbers, hyphens)
  slug = slug.replaceAll(RegExp(r'[^a-z0-9-]'), '');

  // 4. Collapse multiple hyphens
  slug = slug.replaceAll(RegExp(r'-+'), '-');

  // 5. Remove leading/trailing hyphens
  slug = slug.replaceAll(RegExp(r'^-+|-+$'), '');

  return slug;
}

String? getRecommendedActions(dynamic postData) {
  try {
    final map = postData is String ? jsonDecode(postData) : postData;
    final list = map['routing']?['recommended_actions'];
    if (list is List && list.isNotEmpty) {
      return list.map((item) => '• ${item.toString()}').join('\n');
    }
  } catch (e) {
    return 'Error reading actions';
  }
  return 'No recommended actions';
}

String getJsonText(
  dynamic postData,
  String jsonPath,
) {
  try {
    final map = postData is String ? jsonDecode(postData) : postData;

    // Parse the path: remove leading "$." and split by "."
    final parts = jsonPath.replaceFirst(RegExp(r'^\$\.?'), '').split('.');

    // Navigate the JSON tree
    dynamic current = map;
    for (final part in parts) {
      if (current is Map) {
        current = current[part];
      } else {
        return '';
      }
      if (current == null) return '';
    }

    // Handle result type
    if (current is List) {
      if (current.isEmpty) return '';
      return current.map((item) => '• ${item.toString()}').join('\n');
    }

    return current.toString();
  } catch (e) {
    return '';
  }
}

String? createUuid() {
  final random = math.Random();
  final bytes = List<int>.generate(16, (_) => random.nextInt(256));
  bytes[6] = (bytes[6] & 0x0f) | 0x40;
  bytes[8] = (bytes[8] & 0x3f) | 0x80;
  final hex = bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  return '${hex.substring(0, 8)}-${hex.substring(8, 12)}-${hex.substring(12, 16)}-${hex.substring(16, 20)}-${hex.substring(20, 32)}';
}

String buildCustomDataJson(
  int? reportType,
  String? cardTypeName,
  String? cardPrompt,
  String? cardUiName,
  String? boardUiName,
  String? boardPrompt,
) {
  final Map<String, dynamic> data = {};
  if (reportType != null) data['report_type'] = reportType;
  if (cardTypeName != null) data['card_type_name'] = cardTypeName;
  if (cardPrompt != null) data['card_prompt'] = cardPrompt;
  if (cardUiName != null) data['card_ui_name'] = cardUiName;
  if (boardUiName != null) data['board_ui_name'] = boardUiName;
  if (boardPrompt != null) data['board_prompt'] = boardPrompt;
  return jsonEncode(data);
}

bool checkIsPublished(dynamic webhookResponse) {
//
//
  try {
    if (webhookResponse == null) return false;
    final metadata = webhookResponse['metadata'];
    if (metadata == null) return false;
    return metadata['is_published'] == 1;
  } catch (e) {
    return false;
  }
}
