import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'menu_setup_model.dart';
export 'menu_setup_model.dart';

class MenuSetupWidget extends StatefulWidget {
  const MenuSetupWidget({
    super.key,
    int? selectNav,
    this.contentWarning,
    int? opsBoards,
  })  : this.selectNav = selectNav ?? 1,
        this.opsBoards = opsBoards ?? 0;

  final int selectNav;
  final bool? contentWarning;
  final int opsBoards;

  @override
  State<MenuSetupWidget> createState() => _MenuSetupWidgetState();
}

class _MenuSetupWidgetState extends State<MenuSetupWidget> {
  late MenuSetupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuSetupModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 220.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).alternate,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(6.0),
          bottomRight: Radius.circular(6.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 44.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).accent1,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
              child: InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if ((widget.selectNav == 70) && widget.contentWarning!) {
                    var confirmDialogResponse = await showDialog<bool>(
                          context: context,
                          builder: (alertDialogContext) {
                            return AlertDialog(
                              title: Text('Save changes'),
                              content: Text(
                                  'Changes have been made, do you want to Save?'),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, false),
                                  child: Text('Ignore'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(alertDialogContext, true),
                                  child: Text('Save'),
                                ),
                              ],
                            );
                          },
                        ) ??
                        false;
                    if (!confirmDialogResponse) {
                      context.pushNamed(
                        SetupWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  } else {
                    context.pushNamed(
                      SetupWidget.routeName,
                      extra: <String, dynamic>{
                        '__transition_info__': TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                      child: Icon(
                        Icons.settings_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Text(
                      'Setup',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            letterSpacing: 0.0,
                            fontWeight: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontWeight,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: Container(
              width: double.infinity,
              height: 28.0,
              decoration: BoxDecoration(
                color: _model.mouseRegionHovered1
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Color(0x00000000),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((widget.selectNav == 70) && widget.contentWarning!) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Save changes'),
                                content: Text(
                                    'Changes have been made, do you want to Save?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Ignore'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Save'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (!confirmDialogResponse) {
                        context.pushNamed(
                          PromptWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    } else {
                      context.pushNamed(
                        PromptWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                        child: Icon(
                          Icons.lightbulb_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Prompt',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
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
            child: Container(
              width: double.infinity,
              height: 28.0,
              decoration: BoxDecoration(
                color: _model.mouseRegionHovered2
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Color(0x00000000),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((widget.selectNav == 70) && widget.contentWarning!) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Save changes'),
                                content: Text(
                                    'Changes have been made, do you want to Save?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Ignore'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Save'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (!confirmDialogResponse) {
                        context.pushNamed(
                          LocationWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    } else {
                      context.pushNamed(
                        LocationWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                        child: Icon(
                          Icons.map_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Locations',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
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
            child: Container(
              width: double.infinity,
              height: 28.0,
              decoration: BoxDecoration(
                color: _model.mouseRegionHovered3
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Color(0x00000000),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if ((widget.selectNav == 70) && widget.contentWarning!) {
                      var confirmDialogResponse = await showDialog<bool>(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Save changes'),
                                content: Text(
                                    'Changes have been made, do you want to Save?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(
                                        alertDialogContext, false),
                                    child: Text('Ignore'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext, true),
                                    child: Text('Save'),
                                  ),
                                ],
                              );
                            },
                          ) ??
                          false;
                      if (!confirmDialogResponse) {
                        context.pushNamed(
                          TeamsWidget.routeName,
                          extra: <String, dynamic>{
                            '__transition_info__': TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      }
                    } else {
                      context.pushNamed(
                        TeamsWidget.routeName,
                        extra: <String, dynamic>{
                          '__transition_info__': TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                        child: Icon(
                          Icons.people_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Teams',
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onEnter: ((event) async {
              safeSetState(() => _model.mouseRegionHovered3 = true);
            }),
            onExit: ((event) async {
              safeSetState(() => _model.mouseRegionHovered3 = false);
            }),
          ),
          MouseRegion(
            opaque: false,
            cursor: MouseCursor.defer ?? MouseCursor.defer,
            child: Container(
              width: double.infinity,
              height: 28.0,
              decoration: BoxDecoration(
                color: _model.mouseRegionHovered4
                    ? FlutterFlowTheme.of(context).secondaryBackground
                    : Color(0x00000000),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 18.0, 0.0),
                      child: Icon(
                        Icons.imagesearch_roller_outlined,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 24.0,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Roles',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              font: GoogleFonts.inter(
                                fontWeight: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontWeight,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onEnter: ((event) async {
              safeSetState(() => _model.mouseRegionHovered4 = true);
            }),
            onExit: ((event) async {
              safeSetState(() => _model.mouseRegionHovered4 = false);
            }),
          ),
        ].divide(SizedBox(height: 10.0)),
      ),
    );
  }
}
