import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tree_location_model.dart';
export 'tree_location_model.dart';

class TreeLocationWidget extends StatefulWidget {
  const TreeLocationWidget({
    super.key,
    required this.rowid,
    this.rowdata,
  });

  final int? rowid;
  final dynamic rowdata;

  @override
  State<TreeLocationWidget> createState() => _TreeLocationWidgetState();
}

class _TreeLocationWidgetState extends State<TreeLocationWidget> {
  late TreeLocationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TreeLocationModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.viewchildren = false;
      safeSetState(() {});
      _model.apiGetChildren = await GetTreeCall.call(
        parentid: widget.rowid,
        apikey: FFDevEnvironmentValues().supabaseAnonKey,
        jwt: FFAppState().supabaseAuthToken,
      );

      if ((_model.apiGetChildren?.succeeded ?? true)) {
        _model.treedatalocation =
            (_model.apiGetChildren?.jsonBody ?? '').toList().cast<dynamic>();
        safeSetState(() {});
      } else {
        _model.treedatalocation =
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (alertDialogContext) {
                              return AlertDialog(
                                title: Text('Selected node...'),
                                content: Text(getJsonField(
                                  widget.rowdata,
                                  r'''$.name''',
                                ).toString()),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
                                    child: Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 12.0,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                getJsonField(
                                  widget.rowdata,
                                  r'''$.name''',
                                ).toString(),
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
                      if (getJsonField(
                            widget.rowdata,
                            r'''$.long_term''',
                          ) !=
                          null)
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              26.0, 0.0, 0.0, 0.0),
                          child: Text(
                            getJsonField(
                              widget.rowdata,
                              r'''$.long_term''',
                            ).toString(),
                            style:
                                FlutterFlowTheme.of(context).bodySmall.override(
                                      font: GoogleFonts.inter(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodySmall
                                            .fontStyle,
                                      ),
                                      fontSize: 10.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .fontStyle,
                                    ),
                          ),
                        ),
                      Builder(
                        builder: (context) {
                          if (getJsonField(
                                widget.rowdata,
                                r'''$.has_links''',
                              ) !=
                              null) {
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  40.0, 0.0, 0.0, 0.0),
                              child: FutureBuilder<List<LocationLinkRow>>(
                                future: LocationLinkTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'node_id',
                                    widget.rowid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 40.0,
                                        height: 40.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<LocationLinkRow>
                                      subNodesLocationLinkRowList =
                                      snapshot.data!;

                                  return ListView.separated(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 2.0),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        subNodesLocationLinkRowList.length,
                                    separatorBuilder: (_, __) =>
                                        SizedBox(height: 2.0),
                                    itemBuilder: (context, subNodesIndex) {
                                      final subNodesLocationLinkRow =
                                          subNodesLocationLinkRowList[
                                              subNodesIndex];
                                      return Row(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.map_outlined,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 20.0,
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  subNodesLocationLinkRow.name,
                                                  ' link',
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmall
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontWeight,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                          ),
                                                          fontSize: 12.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .fontStyle,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return Container(
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
                  onEnter: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = true);
                  }),
                  onExit: ((event) async {
                    safeSetState(() => _model.mouseRegionHovered = false);
                  }),
                ),
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
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
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 18.0,
                            ),
                          ),
                      ],
                    );
                  } else {
                    return Container(
                      width: 32.0,
                      height: 0.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    );
                  }
                },
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
                    final subtreeLocation = _model.treedatalocation.toList();

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
                      itemCount: subtreeLocation.length,
                      separatorBuilder: (_, __) => SizedBox(height: 1.0),
                      itemBuilder: (context, subtreeLocationIndex) {
                        final subtreeLocationItem =
                            subtreeLocation[subtreeLocationIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: TreeLocationWidget(
                              key: Key(
                                  'Keyska_${subtreeLocationIndex}_of_${subtreeLocation.length}'),
                              rowid: getJsonField(
                                _model.treedatalocation
                                    .elementAtOrNull(subtreeLocationIndex),
                                r'''$.id''',
                              ),
                              rowdata: subtreeLocationItem,
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
                width: double.infinity,
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
