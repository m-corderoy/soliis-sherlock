import '/components/account_update/account_update_widget.dart';
import '/components/debug/debug_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'supportmenu_model.dart';
export 'supportmenu_model.dart';

class SupportmenuWidget extends StatefulWidget {
  const SupportmenuWidget({super.key});

  @override
  State<SupportmenuWidget> createState() => _SupportmenuWidgetState();
}

class _SupportmenuWidgetState extends State<SupportmenuWidget> {
  late SupportmenuModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportmenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Visibility(
            visible: FFAppState().session.accessControl == 0,
            child: Builder(
              builder: (context) => FlutterFlowIconButton(
                borderRadius: 8.0,
                buttonSize: 32.0,
                fillColor: FlutterFlowTheme.of(context).secondaryText,
                icon: Icon(
                  Icons.bug_report_outlined,
                  color: FlutterFlowTheme.of(context).alternate,
                  size: 16.0,
                ),
                onPressed: () async {
                  await showAlignedDialog(
                    barrierDismissible: false,
                    context: context,
                    isGlobal: false,
                    avoidOverflow: false,
                    targetAnchor: AlignmentDirectional(-1.0, 1.0)
                        .resolve(Directionality.of(context)),
                    followerAnchor: AlignmentDirectional(1.0, -1.0)
                        .resolve(Directionality.of(context)),
                    builder: (dialogContext) {
                      return Material(
                        color: Colors.transparent,
                        child: DebugWidget(),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered1 = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered1 = false);
          }),
        ),
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: Builder(
            builder: (context) => FlutterFlowIconButton(
              borderRadius: 8.0,
              buttonSize: 32.0,
              fillColor: FlutterFlowTheme.of(context).secondaryText,
              icon: Icon(
                Icons.person,
                color: FlutterFlowTheme.of(context).alternate,
                size: 16.0,
              ),
              onPressed: () async {
                await showAlignedDialog(
                  barrierDismissible: false,
                  context: context,
                  isGlobal: false,
                  avoidOverflow: false,
                  targetAnchor: AlignmentDirectional(-1.0, 1.0)
                      .resolve(Directionality.of(context)),
                  followerAnchor: AlignmentDirectional(1.0, -1.0)
                      .resolve(Directionality.of(context)),
                  builder: (dialogContext) {
                    return Material(
                      color: Colors.transparent,
                      child: AccountUpdateWidget(),
                    );
                  },
                );
              },
            ),
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered2 = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered2 = false);
          }),
        ),
        MouseRegion(
          opaque: false,
          cursor: MouseCursor.defer ?? MouseCursor.defer,
          child: FlutterFlowIconButton(
            borderRadius: 8.0,
            buttonSize: 32.0,
            fillColor: FlutterFlowTheme.of(context).secondaryText,
            icon: Icon(
              Icons.help,
              color: FlutterFlowTheme.of(context).alternate,
              size: 16.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          onEnter: ((event) async {
            safeSetState(() => _model.mouseRegionHovered3 = true);
          }),
          onExit: ((event) async {
            safeSetState(() => _model.mouseRegionHovered3 = false);
          }),
        ),
      ].divide(SizedBox(width: 10.0)).around(SizedBox(width: 10.0)),
    );
  }
}
