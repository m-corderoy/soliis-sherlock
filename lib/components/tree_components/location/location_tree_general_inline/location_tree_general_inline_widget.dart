import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'location_tree_general_inline_model.dart';
export 'location_tree_general_inline_model.dart';

class LocationTreeGeneralInlineWidget extends StatefulWidget {
  const LocationTreeGeneralInlineWidget({
    super.key,
    required this.rowid,
    this.rowdata,
  });

  final int? rowid;
  final dynamic rowdata;

  @override
  State<LocationTreeGeneralInlineWidget> createState() =>
      _LocationTreeGeneralInlineWidgetState();
}

class _LocationTreeGeneralInlineWidgetState
    extends State<LocationTreeGeneralInlineWidget> {
  late LocationTreeGeneralInlineModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LocationTreeGeneralInlineModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.viewchildren = false;
      safeSetState(() {});
      _model.apiGetLocationChildren = await GetTreeCall.call(
        parentid: widget.rowid,
        apikey: FFDevEnvironmentValues().supabaseAnonKey,
        jwt: FFAppState().supabaseAuthToken,
      );

      if ((_model.apiGetLocationChildren?.succeeded ?? true)) {
        _model.treedatateam = (_model.apiGetLocationChildren?.jsonBody ?? '')
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: () {
                              if (functions.ltreeMatchState(
                                      getJsonField(
                                        widget.rowdata,
                                        r'''$.path''',
                                      ).toString(),
                                      FFAppState()
                                          .dispatchUIcontrol
                                          .selectedLtreeLocation) ==
                                  'exact') {
                                return FlutterFlowTheme.of(context).accent1;
                              } else if (functions.ltreeMatchState(
                                      getJsonField(
                                        widget.rowdata,
                                        r'''$.path''',
                                      ).toString(),
                                      FFAppState()
                                          .dispatchUIcontrol
                                          .selectedLtreeLocation) ==
                                  'ancestor') {
                                return FlutterFlowTheme.of(context).accent2;
                              } else {
                                return Color(0x00000000);
                              }
                            }(),
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
                                      FFAppState()
                                          .updateDispatchUIcontrolStruct(
                                        (e) => e
                                          ..selectedLocation = getJsonField(
                                            widget.rowdata,
                                            r'''$.id''',
                                          )
                                          ..selectedLtreeLocation =
                                              getJsonField(
                                            widget.rowdata,
                                            r'''$.path''',
                                          ).toString(),
                                      );
                                      FFAppState().selectedLocation =
                                          widget.rowid!;
                                      FFAppState().update(() {});
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
                      Icon(
                        Icons.add,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
                      ),
                      Icon(
                        Icons.delete,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 20.0,
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
                    final subtreeLocation =
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
                            child: LocationTreeGeneralInlineWidget(
                              key: Key(
                                  'Keyfe4_${subtreeLocationIndex}_of_${subtreeLocation.length}'),
                              rowid: getJsonField(
                                _model.treedatateam
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
