// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';

/// PrettyJsonViewer — editor-style, safe for drawers (no copy button)
/// FF param: jsonSource (type JSON, nullable)
class PrettyJsonViewer extends StatelessWidget {
  const PrettyJsonViewer({
    super.key,
    this.width,
    this.height,
    this.jsonSource,
    this.fontSize = 14,
    this.lineHeight = 1.38,
    this.letterSpacing = 0.15,
    this.padding = 12,
    this.maxHeight,
    this.fontFamily, // e.g. 'SourceCodePro', else falls back to Courier
  });

  final double? width;
  final double? height;
  final dynamic jsonSource; // Map/List/String/null
  final double fontSize;
  final double lineHeight;
  final double letterSpacing;
  final double padding;
  final double? maxHeight;
  final String? fontFamily;

  String _normalizeToJsonString(dynamic value) {
    if (value == null) return '';
    if (value is String) return value;
    try {
      return jsonEncode(value);
    } catch (_) {
      return value.toString();
    }
  }

  String _prettyOrOriginal(String raw) {
    final txt = raw.trim();
    if (txt.isEmpty) return '/* No JSON provided */';
    try {
      final decoded = jsonDecode(txt);
      const encoder = JsonEncoder.withIndent('  ');
      return encoder.convert(decoded);
    } catch (_) {
      return raw;
    }
  }

  TextSpan _buildHighlightedSpan(String s, Brightness mode) {
    final bool isDark = mode == Brightness.dark;
    final keyColor = isDark ? const Color(0xFFFFC777) : const Color(0xFF8D6E63);
    final stringColor =
        isDark ? const Color(0xFFC3E88D) : const Color(0xFF2E7D32);
    final numberColor =
        isDark ? const Color(0xFF89DDFF) : const Color(0xFF1565C0);
    final boolNullColor =
        isDark ? const Color(0xFFC792EA) : const Color(0xFF6A1B9A);
    final punctColor =
        isDark ? const Color(0xFFB0BEC5) : const Color(0xFF606770);
    final normalColor =
        isDark ? const Color(0xFFCFD8DC) : const Color(0xFF263238);

    final token = RegExp(
      r'"(?:\\.|[^"\\])*"' // string
      r'|true|false|null' // bool/null
      r'|-?\d+(?:\.\d+)?(?:[eE][+\-]?\d+)?' // number
      r'|[{}\[\]:,]' // punctuation
      r'|\s+', // whitespace
      multiLine: true,
    );

    final spans = <TextSpan>[];
    int idx = 0;

    String nextNonWsChar(String s, int from) {
      for (int i = from; i < s.length; i++) {
        final c = s[i];
        if (c != ' ' && c != '\t' && c != '\n' && c != '\r') return c;
      }
      return '';
    }

    final baseStyle = TextStyle(
      fontFamily: fontFamily ?? 'Courier',
      fontSize: fontSize,
      height: lineHeight,
      letterSpacing: letterSpacing,
      color: normalColor,
    );

    for (final m in token.allMatches(s)) {
      if (m.start > idx) {
        spans.add(TextSpan(text: s.substring(idx, m.start), style: baseStyle));
      }
      final t = m.group(0)!;

      TextStyle styleFor(String t) {
        if (t.isEmpty || t.trim().isEmpty) return baseStyle; // whitespace
        if (t.startsWith('"')) {
          final after = nextNonWsChar(s, m.end);
          final isKey = after == ':';
          return baseStyle.copyWith(
            color: isKey ? keyColor : stringColor,
            fontWeight: isKey ? FontWeight.w600 : FontWeight.w400,
          );
        }
        if (t == 'true' || t == 'false' || t == 'null') {
          return baseStyle.copyWith(
              color: boolNullColor, fontStyle: FontStyle.italic);
        }
        if (RegExp(r'^-?\d').hasMatch(t)) {
          return baseStyle.copyWith(color: numberColor);
        }
        if (RegExp(r'^[{}\[\]:,]$').hasMatch(t)) {
          return baseStyle.copyWith(
              color: punctColor, fontWeight: FontWeight.w600);
        }
        return baseStyle;
      }

      spans.add(TextSpan(text: t, style: styleFor(t)));
      idx = m.end;
    }

    if (idx < s.length) {
      spans.add(TextSpan(text: s.substring(idx), style: baseStyle));
    }

    return TextSpan(children: spans, style: baseStyle);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final isDark = brightness == Brightness.dark;

    final bgColor = isDark ? const Color(0xFF1E1E1E) : const Color(0xFFF7F7F7);
    final borderCol =
        isDark ? const Color(0xFF3A3A3A) : const Color(0xFFE0E0E0);

    final incoming = _normalizeToJsonString(jsonSource);
    final pretty = _prettyOrOriginal(incoming);

    Widget block = Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderCol),
      ),
      padding: EdgeInsets.all(padding),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: SelectableText.rich(
            _buildHighlightedSpan(pretty, brightness),
            textWidthBasis: TextWidthBasis.longestLine,
          ),
        ),
      ),
    );

    if (maxHeight != null) {
      block = ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight!),
        child: block,
      );
    }

    return SizedBox(
      width: width,
      height: height,
      child: block,
    );
  }
}
