import '/backend/api_requests/api_calls.dart';
import '/components/tree_components/team/team_tree_general/team_tree_general_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'team_tree_dropdown_model.dart';
export 'team_tree_dropdown_model.dart';

class TeamTreeDropdownWidget extends StatefulWidget {
  const TeamTreeDropdownWidget({
    super.key,
    required this.topID,
    required this.currentPath,
    required this.selectedTitle,
    this.showLongName,
    int? opMode,
  }) : this.opMode = opMode ?? 0;

  /// id of top of tree
  final int? topID;

  /// the current selected ID
  final String? currentPath;

  final String? selectedTitle;
  final bool? showLongName;
  final int opMode;

  @override
  State<TeamTreeDropdownWidget> createState() => _TeamTreeDropdownWidgetState();
}

class _TeamTreeDropdownWidgetState extends State<TeamTreeDropdownWidget> {
  late TeamTreeDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TeamTreeDropdownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.treeData = [];
      safeSetState(() {});
      _model.loadTeam = await GetTeamCall.call(
        parentid: widget.topID,
        apikey: FFDevEnvironmentValues().supabaseAnonKey,
        jwt: FFAppState().supabaseAuthToken,
      );

      if ((_model.loadTeam?.succeeded ?? true)) {
        _model.treeData =
            (_model.loadTeam?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        Navigator.pop(context);
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

    return Container(
      width: 320.0,
      height: 360.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: FlutterFlowTheme.of(context).secondaryText,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 2.42,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 0.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Text(
                            valueOrDefault<String>(
                              widget.selectedTitle,
                              'title',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
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
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 2.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 32.0,
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 10.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (widget.opMode == 0) {
                                          FFAppState()
                                              .updateDispatchUIcontrolStruct(
                                            (e) => e
                                              ..selectedTeam = FFAppState()
                                                  .session
                                                  .teamTreeIDStart
                                              ..selectedLtreeTeam = null,
                                          );
                                          safeSetState(() {});
                                        } else if (widget.opMode == 1) {
                                          FFAppState()
                                              .updateDispatchUIeditStruct(
                                            (e) => e
                                              ..selectedTeam = FFAppState()
                                                  .session
                                                  .teamTreeIDStart
                                              ..selectedLtreeTeam = null,
                                          );
                                          safeSetState(() {});
                                        }

                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.undo_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Icon(
                                      Icons.arrow_drop_up,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 12.0, 6.0),
                child: Builder(
                  builder: (context) {
                    final treeListViewChildData =
                        _model.treeData.map((e) => e).toList();

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: treeListViewChildData.length,
                      itemBuilder: (context, treeListViewChildDataIndex) {
                        final treeListViewChildDataItem =
                            treeListViewChildData[treeListViewChildDataIndex];
                        return Container(
                          child: TeamTreeGeneralWidget(
                            key: Key(
                                'Keyor9_${treeListViewChildDataIndex}_of_${treeListViewChildData.length}'),
                            rowid: getJsonField(
                              treeListViewChildDataItem,
                              r'''$.id''',
                            ),
                            rowdata: treeListViewChildDataItem,
                            opMode: widget.opMode,
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
