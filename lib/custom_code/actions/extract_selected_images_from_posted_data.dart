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

Future<dynamic> extractSelectedImagesFromPostedData(
    dynamic selectedPostedData) async {
  /// Returns:
  /// {
  ///   "count": <int>,
  ///   "items": [ ...only items with non-null urls... ]
  /// }

  if (selectedPostedData == null) {
    return {"count": 0, "items": []};
  }

  try {
    final content = selectedPostedData["content"];
    if (content == null) return {"count": 0, "items": []};

    final items = content["items"];
    if (items == null || items is! List) return {"count": 0, "items": []};

    final filtered = <dynamic>[];

    for (final item in items) {
      if (item is Map) {
        final url = item["url"];
        if (url != null && url.toString().trim().isNotEmpty) {
          filtered.add(item);
        }
      }
    }

    return {
      "count": filtered.length,
      "items": filtered,
    };
  } catch (e) {
    return {"count": 0, "items": []};
  }
}
