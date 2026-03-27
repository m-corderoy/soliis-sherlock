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

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomMarkdown extends StatefulWidget {
  const CustomMarkdown({
    super.key,
    this.width,
    this.height,
    required this.markdownData,
    this.h1Color,
    this.h2Color,
    this.h3Color,
    this.bodyTextColor,
    this.linkColor,
    this.backgroundColor,
    this.h1Size,
    this.h2Size,
    this.h3Size,
    this.bodyTextSize,
    this.lineHeight,
    this.blockquoteColor,
    this.codeBackgroundColor,
    this.codeTextColor,
    this.tableBorderColor,
    this.tableHeaderColor,
    this.enableScrolling,
    this.padding,
  });

  final double? width;
  final double? height;
  final String markdownData;

  // Text Colors
  final Color? h1Color;
  final Color? h2Color;
  final Color? h3Color;
  final Color? bodyTextColor;
  final Color? linkColor;
  final Color? backgroundColor;

  // Font Sizes
  final double? h1Size;
  final double? h2Size;
  final double? h3Size;
  final double? bodyTextSize;
  final double? lineHeight;

  // Special Element Colors
  final Color? blockquoteColor;
  final Color? codeBackgroundColor;
  final Color? codeTextColor;
  final Color? tableBorderColor;
  final Color? tableHeaderColor;

  // Layout Options
  final bool? enableScrolling;
  final double? padding;

  @override
  State<CustomMarkdown> createState() => _CustomMarkdownState();
}

class _CustomMarkdownState extends State<CustomMarkdown> {
  // Handle link taps
  Future<void> _onTapLink(String text, String? href, String title) async {
    if (href != null) {
      final Uri url = Uri.parse(href);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get theme colors as fallbacks
    final theme = FlutterFlowTheme.of(context);

    final markdownStyleSheet = MarkdownStyleSheet(
      // Headers
      h1: TextStyle(
        fontSize: widget.h1Size ?? 32,
        fontWeight: FontWeight.bold,
        color: widget.h1Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.2,
      ),
      h2: TextStyle(
        fontSize: widget.h2Size ?? 24,
        fontWeight: FontWeight.bold,
        color: widget.h2Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.3,
      ),
      h3: TextStyle(
        fontSize: widget.h3Size ?? 20,
        fontWeight: FontWeight.w600,
        color: widget.h3Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.3,
      ),
      h4: TextStyle(
        fontSize: (widget.h3Size ?? 20) - 2,
        fontWeight: FontWeight.w600,
        color: widget.h3Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.3,
      ),
      h5: TextStyle(
        fontSize: (widget.h3Size ?? 20) - 4,
        fontWeight: FontWeight.w500,
        color: widget.h3Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.3,
      ),
      h6: TextStyle(
        fontSize: (widget.h3Size ?? 20) - 6,
        fontWeight: FontWeight.w500,
        color: widget.h3Color ?? theme.primaryText,
        height: widget.lineHeight ?? 1.3,
      ),

      // Body text
      p: TextStyle(
        fontSize: widget.bodyTextSize ?? 16,
        color: widget.bodyTextColor ?? theme.primaryText,
        height: widget.lineHeight ?? 1.6,
      ),

      // Links
      a: TextStyle(
        color: widget.linkColor ?? theme.primary,
        decoration: TextDecoration.underline,
      ),

      // Lists
      listBullet: TextStyle(
        fontSize: widget.bodyTextSize ?? 16,
        color: widget.bodyTextColor ?? theme.primaryText,
      ),

      // Code
      code: TextStyle(
        fontSize: (widget.bodyTextSize ?? 16) - 2,
        fontFamily: 'monospace',
        backgroundColor:
            widget.codeBackgroundColor ?? theme.secondaryBackground,
        color: widget.codeTextColor ?? theme.primaryText,
      ),
      codeblockDecoration: BoxDecoration(
        color: widget.codeBackgroundColor ?? theme.secondaryBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: theme.alternate),
      ),
      codeblockPadding: const EdgeInsets.all(16),

      // Blockquotes
      blockquote: TextStyle(
        fontSize: widget.bodyTextSize ?? 16,
        color: widget.blockquoteColor ?? theme.secondaryText,
        fontStyle: FontStyle.italic,
        height: widget.lineHeight ?? 1.6,
      ),
      blockquoteDecoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: widget.linkColor ?? theme.primary,
            width: 4,
          ),
        ),
      ),
      blockquotePadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),

      // Tables
      tableHead: TextStyle(
        fontSize: widget.bodyTextSize ?? 16,
        fontWeight: FontWeight.bold,
        color: widget.bodyTextColor ?? theme.primaryText,
      ),
      tableBody: TextStyle(
        fontSize: widget.bodyTextSize ?? 16,
        color: widget.bodyTextColor ?? theme.primaryText,
      ),
      tableBorder: TableBorder.all(
        color: widget.tableBorderColor ?? theme.alternate,
        width: 1,
      ),
      tableHeadAlign: TextAlign.left,
      tableCellsPadding: const EdgeInsets.all(12),

      // Horizontal rules
      horizontalRuleDecoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: theme.alternate,
            width: 1,
          ),
        ),
      ),

      // Spacing
      h1Padding: const EdgeInsets.only(bottom: 16),
      h2Padding: const EdgeInsets.only(bottom: 12, top: 24),
      h3Padding: const EdgeInsets.only(bottom: 8, top: 20),
      h4Padding: const EdgeInsets.only(bottom: 8, top: 16),
      h5Padding: const EdgeInsets.only(bottom: 8, top: 16),
      h6Padding: const EdgeInsets.only(bottom: 8, top: 16),
      pPadding: const EdgeInsets.only(bottom: 16),
      listIndent: 24,
    );

    Widget markdownWidget = Markdown(
      data: widget.markdownData,
      styleSheet: markdownStyleSheet,
      onTapLink: _onTapLink,
      selectable: true,
      shrinkWrap: widget.enableScrolling != true,
      physics: widget.enableScrolling == true
          ? const AlwaysScrollableScrollPhysics()
          : const NeverScrollableScrollPhysics(),
    );

    // Add padding if specified
    if (widget.padding != null && widget.padding! > 0) {
      markdownWidget = Padding(
        padding: EdgeInsets.all(widget.padding!),
        child: markdownWidget,
      );
    }

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: markdownWidget,
    );
  }
}
