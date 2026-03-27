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

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'package:flutter_n8n_chat_ui/flutter_n8n_chat_ui.dart';

// ---------------------------------------------------------------------------
// Claude/GPT-style message bubble
// ---------------------------------------------------------------------------
class _ModernMessageBubble extends StatelessWidget {
  final ChatMessage message;
  final String assistantName;
  final String? profileImageUrl;
  final Color backgroundColor;
  final Color userBubbleColor;
  final Color assistantTextColor;
  final Color userTextColor;
  final Function(String)? onButtonPressed;
  final double buttonBorderRadius;
  final String? buttonBorderColor;
  final String? buttonTextColor;
  final String? buttonBackgroundColor;

  const _ModernMessageBubble({
    required this.message,
    required this.assistantName,
    this.profileImageUrl,
    required this.backgroundColor,
    required this.userBubbleColor,
    required this.assistantTextColor,
    required this.userTextColor,
    this.onButtonPressed,
    this.buttonBorderRadius = 8.0,
    this.buttonBorderColor,
    this.buttonTextColor,
    this.buttonBackgroundColor,
  });

  String _getInitials(String name) {
    if (name.trim().isEmpty) return 'AI';
    final words = name.trim().split(RegExp(r'\s+'));
    if (words.length == 1) {
      return words[0].length >= 2
          ? words[0].substring(0, 2).toUpperCase()
          : words[0].toUpperCase();
    }
    return words
        .take(2)
        .map((w) => w.isNotEmpty ? w[0].toUpperCase() : '')
        .join();
  }

  Color? _parseColor(String? colorString) {
    if (colorString == null || colorString.isEmpty) return null;
    try {
      String c = colorString.replaceAll('#', '');
      if (c.length == 6) c = 'FF$c';
      if (c.length == 8) return Color(int.parse(c, radix: 16));
      return null;
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isUser = message.sender == MessageSender.user;

    // ---- Buttons ----
    if (message.type == MessageType.buttons && message.buttons != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Wrap(
          spacing: 8,
          runSpacing: 8,
          children: message.buttons!.map((btn) {
            return OutlinedButton(
              onPressed: onButtonPressed != null
                  ? () => onButtonPressed!(btn.action.value)
                  : null,
              style: OutlinedButton.styleFrom(
                foregroundColor:
                    _parseColor(buttonTextColor) ?? assistantTextColor,
                backgroundColor:
                    _parseColor(buttonBackgroundColor)?.withValues(alpha: 0.08),
                side: BorderSide(
                  color: _parseColor(buttonBorderColor) ??
                      assistantTextColor.withValues(alpha: 0.25),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              ),
              child: Text(btn.title, style: const TextStyle(fontSize: 14)),
            );
          }).toList(),
        ),
      );
    }

    // ---- Links ----
    if (message.type == MessageType.links && message.links != null) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: message.links!.map((link) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () async {
                  final uri = Uri.parse(link.url);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.link,
                        size: 16,
                        color: assistantTextColor.withValues(alpha: 0.6)),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        link.title,
                        style: TextStyle(
                          color: assistantTextColor,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }

    // ---- User message (right-aligned, bubble) ----
    if (isUser) {
      return Padding(
        padding: const EdgeInsets.only(left: 60, right: 20, top: 6, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: userBubbleColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: _buildContent(isUser: true),
              ),
            ),
          ],
        ),
      );
    }

    // ---- Assistant message (full-width, no bubble — Claude/GPT style) ----
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 60, top: 10, bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: assistantTextColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                _getInitials(assistantName),
                style: TextStyle(
                  color: assistantTextColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Message content — no background, just text
          Expanded(
            child: _buildContent(isUser: false),
          ),
        ],
      ),
    );
  }

  Widget _buildContent({required bool isUser}) {
    final color = isUser ? userTextColor : assistantTextColor;

    if (message.type == MessageType.audio) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.mic, size: 18, color: color.withValues(alpha: 0.7)),
          const SizedBox(width: 8),
          Text('Voice message',
              style: TextStyle(
                  color: color.withValues(alpha: 0.7),
                  fontSize: 14,
                  fontStyle: FontStyle.italic)),
        ],
      );
    }

    if (message.type == MessageType.image) {
      if (message.filePath != null || message.fileUrl != null) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            message.fileUrl ?? message.filePath ?? '',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.image,
                    size: 18, color: color.withValues(alpha: 0.7)),
                const SizedBox(width: 8),
                Text('Image',
                    style: TextStyle(
                        color: color.withValues(alpha: 0.7), fontSize: 14)),
              ],
            ),
          ),
        );
      }
    }

    // Text content
    return SelectableText(
      message.content,
      style: TextStyle(
        color: color,
        fontSize: 15,
        height: 1.55,
      ),
    );
  }
}

/// ---------------------------------------------------------------------------
/// Main FlutterFlow custom widget
/// ---------------------------------------------------------------------------
class N8nChatUiWidget2 extends StatefulWidget {
  const N8nChatUiWidget2({
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
    this.onMessageSentAction,
    this.onMessageReceivedAction,
    this.boardId,
    this.cardId,
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
  final Future<dynamic> Function(String content)? onMessageSentAction;
  final Future<dynamic> Function(String content)? onMessageReceivedAction;
  final int? boardId;
  final int? cardId;

  @override
  State<N8nChatUiWidget2> createState() => _N8nChatUiWidget2State();
}

class _N8nChatUiWidget2State extends State<N8nChatUiWidget2> {
  Map<String, dynamic>? _parseCustomData(String? raw) {
    if (raw == null) return null;
    final trimmed = raw.trim();
    if (trimmed.isEmpty) return null;
    try {
      final decoded = jsonDecode(trimmed);
      if (decoded is Map<String, dynamic>) return decoded;
      return null;
    } catch (_) {
      return null;
    }
  }

  Color _parseColorFallback(String? hex, Color fallback) {
    if (hex == null || hex.isEmpty) return fallback;
    try {
      String c = hex.replaceAll('#', '');
      if (c.length == 6) c = 'FF$c';
      if (c.length == 8) return Color(int.parse(c, radix: 16));
      return fallback;
    } catch (_) {
      return fallback;
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- Effective cache URL with session ID ---
    final effectiveCacheUrl =
        widget.sessionId != null && widget.cacheUrl != null
            ? '${widget.cacheUrl}/${widget.sessionId}'
            : widget.cacheUrl ?? '';

    // --- Merged custom data (sessionId + tenantId + any extra JSON) ---
    final parsedCustomData = _parseCustomData(widget.customDataJson);
    final mergedCustomData = {
      if (parsedCustomData != null) ...parsedCustomData,
      if (widget.sessionId != null) 'sessionId': widget.sessionId,
      if (widget.tenantId != null) 'tenantId': widget.tenantId,
      if (widget.boardId != null) 'board_ID': widget.boardId,
      if (widget.cardId != null) 'card_ID': widget.cardId,
    };

    // --- Resolve colours for the message builder ---
    final bgColor =
        _parseColorFallback(widget.backgroundColor, const Color(0xFFFFFFFF));
    final userBubble =
        _parseColorFallback(widget.backgroundChatUser, const Color(0xFF5B9BD5));
    final assistantText =
        _parseColorFallback(widget.textColorAssistant, const Color(0xFF374151));
    final userText =
        _parseColorFallback(widget.textColor, Colors.white); //Colors.black;

    // --- Chat config ---
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
      enableAudio: widget.enableAudio ?? false,
      enableImage: widget.enableImage ?? false,
      waitForResponse: widget.waitForResponse ?? true,
      backgroundColor: widget.backgroundColor,
      headerBackgroundColor: widget.headerBackgroundColor,
      footerBackgroundColor: widget.footerBackgroundColor,
      backgroundChatUser: widget.backgroundChatUser ?? '#5B9BD5',
      backgroundChatAssistant:
          widget.backgroundChatAssistant ?? '#FFFFFF', // invisible bubble
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
      customData: mergedCustomData,
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: N8NChatWidget(
        config: config,
        showHeader: widget.showHeader ?? false, // hide WhatsApp-style header

        // --- Claude/GPT-style message builder ---
        messageBuilder: (message) {
          return _ModernMessageBubble(
            message: message,
            assistantName: widget.chatName ?? 'AI',
            profileImageUrl: widget.profileImageUrl,
            backgroundColor: bgColor,
            userBubbleColor: userBubble,
            assistantTextColor: assistantText,
            userTextColor: userText,
            buttonBorderRadius: widget.buttonBorderRadius ?? 8.0,
            buttonBorderColor: widget.buttonBorderColor,
            buttonTextColor: widget.buttonTextColor,
            buttonBackgroundColor: widget.buttonBackgroundColor,
            onButtonPressed: (value) async {
              debugPrint('Button pressed: $value');

              final payload = jsonEncode({
                'type': 'text',
                'content': value,
                'source': 'button',
                'userName': widget.userName ?? '',
                'userEmail': widget.userEmail ?? '',
                'sessionId': widget.sessionId,
                'tenantId': widget.tenantId,
                if (widget.boardId != null) 'board_ID': widget.boardId,
                if (widget.cardId != null) 'card_ID': widget.cardId,
              });

              final response = await http.post(
                Uri.parse(widget.webhookUrl),
                headers: {'Content-Type': 'application/json'},
                body: payload,
              );

              debugPrint('Button webhook response: ${response.statusCode}');
            },
          );
        },

        onMessageSent: (msg) {
          debugPrint('n8n sent: ${msg.content}');
          widget.onMessageSentAction?.call(msg.content);
        },

        onMessageReceived: (msg) {
          debugPrint('n8n recv: ${msg.content}');
          widget.onMessageReceivedAction?.call(msg.content);
        },
      ),
    );
  }
}
