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

class JsonViewerWidget extends StatefulWidget {
  const JsonViewerWidget({
    super.key,
    this.width,
    this.height,
    required this.jsonData,
    this.fontSize,
    this.initiallyExpanded,
    this.showHeader,
    this.headerText,
  });

  final double? width;
  final double? height;
  final dynamic jsonData;
  final double? fontSize;
  final bool? initiallyExpanded;
  final bool? showHeader;
  final String? headerText;

  @override
  State<JsonViewerWidget> createState() => _JsonViewerWidgetState();
}

class _JsonViewerWidgetState extends State<JsonViewerWidget> {
  late double _fontSize;
  late bool _initiallyExpanded;

  // GitHub dark theme colours
  static const _bgColor = Color(0xFF0d1117);
  static const _borderColor = Color(0xFF30363d);
  static const _headerBgColor = Color(0xFF161b22);
  static const _headerTextColor = Color(0xFF8b949e);

  @override
  void initState() {
    super.initState();
    _fontSize = widget.fontSize ?? 13.0;
    _initiallyExpanded = widget.initiallyExpanded ?? true;
  }

  dynamic _parseJson(dynamic data) {
    if (data is String) {
      try {
        return jsonDecode(data);
      } catch (_) {
        return data;
      }
    }
    return data;
  }

  String _getDefaultSummary(dynamic data) {
    if (data is Map) {
      return '${data.length} ${data.length == 1 ? 'key' : 'keys'}';
    } else if (data is List) {
      return '${data.length} ${data.length == 1 ? 'item' : 'items'}';
    }
    return 'JSON';
  }

  @override
  Widget build(BuildContext context) {
    final parsed = _parseJson(widget.jsonData);
    final showHeader = widget.showHeader ?? true;

    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: _bgColor,
        border: Border.all(color: _borderColor, width: 1),
        borderRadius: BorderRadius.circular(6),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // ── Header bar (optional) ──
          if (showHeader)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: const BoxDecoration(
                color: _headerBgColor,
                border: Border(
                  bottom: BorderSide(color: _borderColor, width: 1),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.code, size: 16, color: _headerTextColor),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      (widget.headerText != null &&
                              widget.headerText!.isNotEmpty)
                          ? widget.headerText!
                          : _getDefaultSummary(parsed),
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: _headerTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          // ── JSON content ──
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: constraints.maxWidth,
                      ),
                      child: IntrinsicWidth(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: _JsonNode(
                            data: parsed,
                            indent: 0,
                            fontSize: _fontSize,
                            isLast: true,
                            isRoot: true,
                            initiallyExpanded: _initiallyExpanded,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Recursive JSON node
// ─────────────────────────────────────────────────────────────────────────────

class _JsonNode extends StatefulWidget {
  const _JsonNode({
    required this.data,
    required this.indent,
    required this.fontSize,
    required this.isLast,
    this.keyName,
    this.isRoot = false,
    this.initiallyExpanded = true,
  });

  final dynamic data;
  final int indent;
  final double fontSize;
  final bool isLast;
  final String? keyName;
  final bool isRoot;
  final bool initiallyExpanded;

  @override
  State<_JsonNode> createState() => _JsonNodeState();
}

class _JsonNodeState extends State<_JsonNode>
    with SingleTickerProviderStateMixin {
  late bool _expanded;
  late AnimationController _animController;
  late Animation<double> _rotateAnim;

  // GitHub dark palette
  static const _keyColor = Color(0xFF79c0ff);
  static const _stringColor = Color(0xFFa5d6ff);
  static const _numberColor = Color(0xFF79c0ff);
  static const _boolColor = Color(0xFFff7b72);
  static const _nullColor = Color(0xFFff7b72);
  static const _bracketColor = Color(0xFF8b949e);
  static const _commaColor = Color(0xFF8b949e);
  static const _chevronColor = Color(0xFF8b949e);
  static const _collapsedBadgeBg = Color(0xFF1f2937);
  static const _collapsedBadgeText = Color(0xFF8b949e);
  static const _hoverColor = Color(0xFF161b22);

  double get _indentPx => 24.0;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
    _animController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
      value: _expanded ? 1.0 : 0.0,
    );
    _rotateAnim = Tween<double>(begin: 0.0, end: 0.25).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
      _expanded ? _animController.forward() : _animController.reverse();
    });
  }

  TextStyle _mono({Color? color, FontWeight? weight}) => TextStyle(
        fontFamily: 'monospace',
        fontSize: widget.fontSize,
        color: color ?? _bracketColor,
        fontWeight: weight,
        height: 1.6,
      );

  String get _comma => widget.isLast ? '' : ',';

  List<InlineSpan> _keyPrefix() {
    if (widget.keyName == null) return [];
    return [
      TextSpan(text: '"', style: _mono(color: _keyColor)),
      TextSpan(
          text: widget.keyName!,
          style: _mono(color: _keyColor, weight: FontWeight.w500)),
      TextSpan(text: '": ', style: _mono(color: _keyColor)),
    ];
  }

  List<InlineSpan> _valueSpans(dynamic value) {
    if (value == null) {
      return [TextSpan(text: 'null', style: _mono(color: _nullColor))];
    } else if (value is bool) {
      return [
        TextSpan(text: value.toString(), style: _mono(color: _boolColor))
      ];
    } else if (value is num) {
      return [
        TextSpan(text: value.toString(), style: _mono(color: _numberColor))
      ];
    } else if (value is String) {
      final escaped = value
          .replaceAll('\\', '\\\\')
          .replaceAll('"', '\\"')
          .replaceAll('\n', '\\n')
          .replaceAll('\r', '\\r')
          .replaceAll('\t', '\\t');
      return [
        TextSpan(text: '"', style: _mono(color: _stringColor)),
        TextSpan(text: escaped, style: _mono(color: _stringColor)),
        TextSpan(text: '"', style: _mono(color: _stringColor)),
      ];
    }
    return [TextSpan(text: value.toString(), style: _mono())];
  }

  WidgetSpan _collapsedBadge(String label) => WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          decoration: BoxDecoration(
            color: _collapsedBadgeBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: _collapsedBadgeText.withOpacity(0.3)),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: widget.fontSize - 2,
              color: _collapsedBadgeText,
            ),
          ),
        ),
      );

  Widget _buildLine({
    required List<InlineSpan> spans,
    VoidCallback? onTap,
    bool showChevron = false,
  }) {
    return _HoverLine(
      hoverColor: _hoverColor,
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: widget.indent * _indentPx + 16),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showChevron)
              RotationTransition(
                turns: _rotateAnim,
                child: const Padding(
                  padding: EdgeInsets.only(right: 4),
                  child:
                      Icon(Icons.arrow_right, size: 16, color: _chevronColor),
                ),
              )
            else
              const SizedBox(width: 20),
            Flexible(
              child: RichText(
                text: TextSpan(children: spans),
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data is Map) return _buildMap(widget.data as Map);
    if (widget.data is List) return _buildList(widget.data as List);
    return _buildPrimitive();
  }

  Widget _buildPrimitive() {
    return _buildLine(spans: [
      ..._keyPrefix(),
      ..._valueSpans(widget.data),
      TextSpan(text: _comma, style: _mono(color: _commaColor)),
    ]);
  }

  Widget _buildMap(Map data) {
    if (data.isEmpty) {
      return _buildLine(spans: [
        ..._keyPrefix(),
        TextSpan(text: '{}$_comma', style: _mono()),
      ]);
    }

    if (!_expanded) {
      final c = data.length;
      return _buildLine(
        onTap: _toggle,
        showChevron: true,
        spans: [
          ..._keyPrefix(),
          TextSpan(text: '{ ', style: _mono()),
          _collapsedBadge('$c ${c == 1 ? 'key' : 'keys'}'),
          TextSpan(text: ' }$_comma', style: _mono()),
        ],
      );
    }

    final keys = data.keys.toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLine(
          onTap: _toggle,
          showChevron: true,
          spans: [..._keyPrefix(), TextSpan(text: '{', style: _mono())],
        ),
        for (int i = 0; i < keys.length; i++)
          _JsonNode(
            data: data[keys[i]],
            indent: widget.indent + 1,
            fontSize: widget.fontSize,
            isLast: i == keys.length - 1,
            keyName: keys[i].toString(),
            initiallyExpanded: widget.initiallyExpanded,
          ),
        _buildLine(spans: [TextSpan(text: '}$_comma', style: _mono())]),
      ],
    );
  }

  Widget _buildList(List data) {
    if (data.isEmpty) {
      return _buildLine(spans: [
        ..._keyPrefix(),
        TextSpan(text: '[]$_comma', style: _mono()),
      ]);
    }

    if (!_expanded) {
      final c = data.length;
      return _buildLine(
        onTap: _toggle,
        showChevron: true,
        spans: [
          ..._keyPrefix(),
          TextSpan(text: '[ ', style: _mono()),
          _collapsedBadge('$c ${c == 1 ? 'item' : 'items'}'),
          TextSpan(text: ' ]$_comma', style: _mono()),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildLine(
          onTap: _toggle,
          showChevron: true,
          spans: [..._keyPrefix(), TextSpan(text: '[', style: _mono())],
        ),
        for (int i = 0; i < data.length; i++)
          _JsonNode(
            data: data[i],
            indent: widget.indent + 1,
            fontSize: widget.fontSize,
            isLast: i == data.length - 1,
            initiallyExpanded: widget.initiallyExpanded,
          ),
        _buildLine(spans: [TextSpan(text: ']$_comma', style: _mono())]),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Hover highlight wrapper
// ─────────────────────────────────────────────────────────────────────────────

class _HoverLine extends StatefulWidget {
  const _HoverLine({
    required this.child,
    required this.hoverColor,
    this.onTap,
  });

  final Widget child;
  final Color hoverColor;
  final VoidCallback? onTap;

  @override
  State<_HoverLine> createState() => _HoverLineState();
}

class _HoverLineState extends State<_HoverLine> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap != null
          ? SystemMouseCursors.click
          : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          color: _hovering ? widget.hoverColor : Colors.transparent,
          child: widget.child,
        ),
      ),
    );
  }
}
