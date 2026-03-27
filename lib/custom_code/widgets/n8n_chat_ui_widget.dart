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
import 'package:flutter_n8n_chat_ui/flutter_n8n_chat_ui.dart';

class N8nChatUiWidget extends StatefulWidget {
  const N8nChatUiWidget({
    super.key,
    this.width,
    this.height,
    required this.webhookUrl,
    this.cacheUrl,
    this.userName,
    this.userEmail,
    this.chatName,
    this.profileImageUrl,
    this.title,
    this.subtitle,
    this.hintText,
    this.language,
    this.enableAudio,
    this.enableImage,
    this.waitForResponse,
    this.showHeader,
    this.backgroundColor,
    this.headerBackgroundColor,
    this.footerBackgroundColor,
    this.backgroundChatUser,
    this.backgroundChatAssistant,
    this.textColor,
    this.textColorAssistant,
    this.headerTextColor,
    this.sendButtonColor,
    this.audioButtonColor,
    this.imageButtonColor,
    this.buttonBackgroundColor,
    this.buttonTextColor,
    this.buttonBorderColor,
    this.themePrimaryColor,
    this.themeSecondaryColor,
    this.themeTertiaryColor,
    this.buttonBorderRadius,
    this.customDataJson,
    this.sessionId,
    this.tenantId,
  });

  final double? width;
  final double? height;
  final String webhookUrl;
  final String? cacheUrl;
  final String? userName;
  final String? userEmail;
  final String? chatName;
  final String? profileImageUrl;
  final String? title;
  final String? subtitle;
  final String? hintText;
  final String? language;
  final bool? enableAudio;
  final bool? enableImage;
  final bool? waitForResponse;
  final bool? showHeader;
  final String? backgroundColor;
  final String? headerBackgroundColor;
  final String? footerBackgroundColor;
  final String? backgroundChatUser;
  final String? backgroundChatAssistant;
  final String? textColor;
  final String? textColorAssistant;
  final String? headerTextColor;
  final String? sendButtonColor;
  final String? audioButtonColor;
  final String? imageButtonColor;
  final String? buttonBackgroundColor;
  final String? buttonTextColor;
  final String? buttonBorderColor;
  final String? themePrimaryColor;
  final String? themeSecondaryColor;
  final String? themeTertiaryColor;
  final double? buttonBorderRadius;
  final String? customDataJson;
  final String? sessionId;
  final int? tenantId;

  @override
  State<N8nChatUiWidget> createState() => _N8nChatUiWidgetState();
}

class _N8nChatUiWidgetState extends State<N8nChatUiWidget> {
  Map<String, dynamic>? _parseCustomData(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;

    try {
      final decoded = jsonDecode(trimmed);
      if (decoded is Map<String, dynamic>) return decoded;
      // If they passed something else, ignore.
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build config from widget params (matches package docs)

    final effectiveCacheUrl =
        widget.sessionId != null && widget.cacheUrl != null
            ? '${widget.cacheUrl}/${widget.sessionId}'
            : widget.cacheUrl ?? '';

    final parsedCustomData = _parseCustomData(widget.customDataJson);
    final mergedCustomData = {
      if (parsedCustomData != null) ...parsedCustomData,
      if (widget.sessionId != null) 'sessionId': widget.sessionId,
      if (widget.tenantId != null) 'tenantId': widget.tenantId,
    };

    final config = ChatConfig(
      webhookUrl: widget.webhookUrl,
      cacheUrl: effectiveCacheUrl,
      userName: widget.userName ?? '',
      userEmail: widget.userEmail ?? '',
      chatName: widget.chatName ?? 'N8N Chat',
      profileImageUrl: widget.profileImageUrl ?? '',
      title: widget.title ?? 'Hello!',
      subtitle: widget.subtitle ?? 'How can I help you today?',
      hintText: widget.hintText ?? 'Type a message...',
      language: widget.language ?? 'en',

      // enableAudio: widget.enableAudio,
      // enableImage: widget.enableImage,
      // waitForResponse: widget.waitForResponse,
      // showHeader: widget.showHeader,

      enableAudio: widget.enableAudio ?? false,
      enableImage: widget.enableImage ?? false,
      waitForResponse: widget.waitForResponse ?? true,
      // showHeader: widget.showHeader ?? true,

      backgroundColor: widget.backgroundColor,
      headerBackgroundColor: widget.headerBackgroundColor,
      footerBackgroundColor: widget.footerBackgroundColor,
      backgroundChatUser: widget.backgroundChatUser ?? '#5B9BD5',
      backgroundChatAssistant: widget.backgroundChatAssistant ?? '#F0F0F0',
      textColor: widget.textColor,
      textColorAssistant: widget.textColorAssistant,
      headerTextColor: widget.headerTextColor,
      sendButtonColor: widget.sendButtonColor,
      audioButtonColor: widget.audioButtonColor,
      imageButtonColor: widget.imageButtonColor,
      buttonBackgroundColor: widget.buttonBackgroundColor,
      buttonTextColor: widget.buttonTextColor,
      buttonBorderColor: widget.buttonBorderColor,
      themePrimaryColor: widget.themePrimaryColor,
      themeSecondaryColor: widget.themeSecondaryColor,
      themeTertiaryColor: widget.themeTertiaryColor,
      buttonBorderRadius: widget.buttonBorderRadius ?? 8.0,
      customData: mergedCustomData, // _parseCustomData(widget.customDataJson),
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: N8NChatWidget(
        config: config,

        // Optional: add lightweight logging hooks (safe in FlutterFlow)
        onMessageSent: (msg) => debugPrint('n8n sent: ${msg.content}'),
        onMessageReceived: (msg) => debugPrint('n8n recv: ${msg.content}'),
      ),
    );
  }
}
