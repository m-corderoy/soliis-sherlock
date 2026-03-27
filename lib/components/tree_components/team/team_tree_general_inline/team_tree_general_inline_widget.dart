import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_tree_general_inline_model.dart';
export 'team_tree_general_inline_model.dart';

class TeamTreeGeneralInlineWidget extends StatefulWidget {
  const TeamTreeGeneralInlineWidget({
    super.key,
    this.rowid,
    this.rowdata,
    this.updateCall,
  });

  final int? rowid;
  final dynamic rowdata;
  final Future Function(int? nodeID, bool? updateNeeded, int? operation)?
      updateCall;

  @override
  State<TeamTreeGeneralInlineWidget> createState() =>
      _TeamTreeGeneralInlineWidgetState();
}

class _TeamTreeGeneralInlineWidgetState
    extends State<TeamTreeGeneralInlineWidget> {
  late TeamTreeGeneralInlineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamTreeGeneralInlineModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.viewchildren = false;
      safeSetState(() {});
      _model.apiGetTeamChildren = await GetTeamCall.call(
        parentid: widget.rowid,
        apikey: FFDevEnvironmentValues().supabaseAnonKey,
        jwt: FFAppState().supabaseAuthToken,
      );

      if ((_model.apiGetTeamChildren?.succeeded ?? true)) {
        _model.treedatateam = (_model.apiGetTeamChildren?.jsonBody ?? '')
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.treedatateam =
            FFAppState().blankJSONtree.toList().cast<dynamic>();
        safeSetState(() {});
      }
    });

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

    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 8.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: FFAppState().selectedTeam ==
                                    getJsonField(
                                      widget.rowdata,
                                      r'''$.id''',
                                    )
                                ? FlutterFlowTheme.of(context).accent1
                                : Color(0x00000000),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: Icon(
                                      Icons.circle_rounded,
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      size: 12.0,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      FFAppState().selectedTeam =
                                          widget.rowid!;
                                      FFAppState().selectedTreeNodeID =
                                          widget.rowid!;
                                      FFAppState().selectedTreeUpdate = false;
                                      FFAppState().selectedTreeOperation = 0;
                                      safeSetState(() {});
                                      await widget.updateCall?.call(
                                        FFAppState().selectedTreeNodeID,
                                        FFAppState().selectedTreeUpdate,
                                        FFAppState().selectedTreeOperation,
                                      );
                                    },
                                    child: Text(
                                      getJsonField(
                                        widget.rowdata,
                                        r'''$.name''',
                                      ).toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            font: GoogleFonts.inter(
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .fontStyle,
                                            ),
                                            letterSpacing: 0.0,
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = false);
                  }),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().selectedTreeNodeID = widget.rowid!;
                          FFAppState().selectedTreeUpdate = true;
                          FFAppState().selectedTreeOperation = 1;
                          safeSetState(() {});
                          await widget.updateCall?.call(
                            FFAppState().selectedTreeNodeID,
                            FFAppState().selectedTreeUpdate,
                            FFAppState().selectedTreeOperation,
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          FFAppState().selectedTreeNodeID = widget.rowid!;
                          FFAppState().selectedTreeUpdate = true;
                          FFAppState().selectedTreeOperation = 2;
                          safeSetState(() {});
                          await widget.updateCall?.call(
                            FFAppState().selectedTreeNodeID,
                            FFAppState().selectedTreeUpdate,
                            FFAppState().selectedTreeOperation,
                          );
                        },
                        child: Icon(
                          Icons.delete,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 20.0,
                        ),
                      ),
                    ].divide(SizedBox(width: 8.0)),
                  ),
                  Builder(
                    builder: (context) {
                      if (getJsonField(
                        widget.rowdata,
                        r'''$.has_children''',
                      )) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (!_model.viewchildren)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.viewchildren = true;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_right_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                            if (_model.viewchildren)
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  _model.viewchildren = false;
                                  safeSetState(() {});
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 20.0,
                                ),
                              ),
                          ],
                        );
                      } else {
                        return Container(
                          width: 20.0,
                          height: 20.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        Builder(
          builder: (context) {
            if (_model.viewchildren) {
              return Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final subtreeTeams =
                        _model.treedatateam.map((e) => e).toList();

                    return ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        0,
                        1.0,
                        0,
                        1.0,
                      ),
                      primary: false,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: subtreeTeams.length,
                      separatorBuilder: (_, __) => SizedBox(height: 1.0),
                      itemBuilder: (context, subtreeTeamsIndex) {
                        final subtreeTeamsItem =
                            subtreeTeams[subtreeTeamsIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TeamTreeGeneralInlineWidget(
                              key: Key(
                                  'Keyu3e_${subtreeTeamsIndex}_of_${subtreeTeams.length}'),
                              rowid: getJsonField(
                                _model.treedatateam
                                    .elementAtOrNull(subtreeTeamsIndex),
                                r'''$.id''',
                              ),
                              rowdata: subtreeTeamsItem,
                              updateCall:
                                  (nodeID, updateNeeded, operation) async {
                                await widget.updateCall?.call(
                                  FFAppState().selectedTreeNodeID,
                                  FFAppState().selectedTreeUpdate,
                                  FFAppState().selectedTreeOperation,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return Container(
                height: 0.0,
                decoration: BoxDecoration(),
              );
            }
          },
        ),
      ],
    );
  }
}
