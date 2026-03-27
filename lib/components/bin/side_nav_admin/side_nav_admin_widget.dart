import '/auth/firebase_auth/auth_util.dart';
import '/components/account_update/account_update_widget.dart';
import '/components/popupmenus/menu_setup/menu_setup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_nav_admin_model.dart';
export 'side_nav_admin_model.dart';

class SideNavAdminWidget extends StatefulWidget {
  const SideNavAdminWidget({
    super.key,
    int? selectedNav,
    this.contentWarning,
    int? opsBoard,
  })  : this.selectedNav = selectedNav ?? 1,
        this.opsBoard = opsBoard ?? 0;

  final int selectedNav;
  final bool? contentWarning;
  final int opsBoard;

  @override
  State<SideNavAdminWidget> createState() => _SideNavAdminWidgetState();
}

class _SideNavAdminWidgetState extends State<SideNavAdminWidget> {
  late SideNavAdminModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavAdminModel());

    _model.expandableExpandableController =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (FFAppState().menuOpen)
          Container(
            width: 220.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(0.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 16.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              8.0, 0.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              FFAppState().menuOpen =
                                  !(FFAppState().menuOpen ?? true);
                              safeSetState(() {});
                            },
                            child: Icon(
                              Icons.menu_open,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 12.0,
                    thickness: 0.5,
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().session.adminRole == 0)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                TenantManagementWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              TenantManagementWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionTenantHovered) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  20) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 6.0, 0.0),
                                                  child: Icon(
                                                    Icons
                                                        .playlist_add_circle_outlined,
                                                    color: widget
                                                                .selectedNav ==
                                                            20
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                if (FFAppState().menuOpen)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      'Tenants',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            font: GoogleFonts
                                                                .inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
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
                                        safeSetState(() => _model
                                            .mouseRegionTenantHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionTenantHovered = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: Container(
                                        width: 220.0,
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (_model.mouseRegionOrdHovered) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.selectedNav ==
                                                30) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .accent1;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .alternate;
                                            }
                                          }(),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 0.0, 0.0),
                                          child: Container(
                                            width: double.infinity,
                                            color: Color(0x00000000),
                                            child: ExpandableNotifier(
                                              controller: _model
                                                  .expandableExpandableController,
                                              child: ExpandablePanel(
                                                header: Container(
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        if ((widget.selectedNav ==
                                                                70) &&
                                                            widget
                                                                .contentWarning!) {
                                                          var confirmDialogResponse =
                                                              await showDialog<
                                                                      bool>(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (alertDialogContext) {
                                                                      return AlertDialog(
                                                                        title: Text(
                                                                            'Save changes'),
                                                                        content:
                                                                            Text('Changes have been made, do you want to Save?'),
                                                                        actions: [
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, false),
                                                                            child:
                                                                                Text('Ignore'),
                                                                          ),
                                                                          TextButton(
                                                                            onPressed: () =>
                                                                                Navigator.pop(alertDialogContext, true),
                                                                            child:
                                                                                Text('Save'),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ) ??
                                                                  false;
                                                          if (!confirmDialogResponse) {
                                                            context.pushNamed(
                                                                SetupWidget
                                                                    .routeName);
                                                          }
                                                        } else {
                                                          context.pushNamed(
                                                              SetupWidget
                                                                  .routeName);
                                                        }
                                                      },
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        6.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .settings_sharp,
                                                              color: widget
                                                                          .selectedNav ==
                                                                      30
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              'Setup',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleLarge
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        14.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                collapsed: Container(),
                                                expanded: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 6.0, 0.0, 20.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              PromptWidget
                                                                  .routeName);
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .lightbulb_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Prompt',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0x8A000000),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 6.0)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              LocationWidget
                                                                  .routeName);
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .map_outlined,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 17.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Locations',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0x8A000000),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 6.0)),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              TeamsWidget
                                                                  .routeName);
                                                        },
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          18.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Icon(
                                                                Icons
                                                                    .people_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                size: 18.0,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Teams',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .inter(
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: Color(
                                                                        0x8A000000),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 6.0)),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        18.0,
                                                                        0.0,
                                                                        12.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons
                                                                  .format_paint_outlined,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 18.0,
                                                            ),
                                                          ),
                                                          Text(
                                                            'Roles',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  color: Color(
                                                                      0x8A000000),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 6.0)),
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 10.0)),
                                                  ),
                                                ),
                                                theme: ExpandableThemeData(
                                                  tapHeaderToExpand: false,
                                                  tapBodyToExpand: false,
                                                  tapBodyToCollapse: false,
                                                  headerAlignment:
                                                      ExpandablePanelHeaderAlignment
                                                          .center,
                                                  hasIcon: true,
                                                  expandIcon: Icons
                                                      .arrow_drop_down_sharp,
                                                  collapseIcon:
                                                      Icons.arrow_drop_up_sharp,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionOrdHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionOrdHovered = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                  AppBuilderWidget.routeName);
                                            }
                                          } else {
                                            context.pushNamed(
                                              AppBuilderWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionAIHovered1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  35) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 6.0, 0.0),
                                                  child: Icon(
                                                    Icons.auto_awesome,
                                                    color: widget
                                                                .selectedNav ==
                                                            30
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'App Builder',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                        safeSetState(() => _model
                                            .mouseRegionAIHovered1 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionAIHovered1 = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 30)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                DispatchesWidget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              DispatchesWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionDispatchHovered1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  70) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 6.0, 0.0),
                                                  child: Icon(
                                                    Icons.phone_iphone,
                                                    color: widget
                                                                .selectedNav ==
                                                            70
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Dispatch Cards',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                        safeSetState(() =>
                                            _model.mouseRegionDispatchHovered1 =
                                                true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionDispatchHovered1 =
                                                false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                UserManagement2Widget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              UserMgmtWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionUserHovered1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  50) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8.0, 0.0, 6.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 6.0, 0.0),
                                                  child: Icon(
                                                    Icons.person_sharp,
                                                    color: widget
                                                                .selectedNav ==
                                                            50
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .primary
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    size: 24.0,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Users',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font:
                                                              GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
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
                                        safeSetState(() => _model
                                            .mouseRegionUserHovered1 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionUserHovered1 = false);
                                      }),
                                    ),
                                  if (false)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        CmsSetup80Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      CmsSetup80Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionActionsHovered1) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .robot,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    60
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Agents',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionActionsHovered1 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionActionsHovered1 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        TemplateWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      TemplateWidget.routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionDataHovered1) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          55) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .text_snippet_outlined,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    55
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Templates',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionDataHovered1 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionDataHovered1 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        OrgSetup40Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      OrgSetup40Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionFineTuningHovered1) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          40) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .model_training_sharp,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    30
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Training',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionFineTuningHovered1 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionFineTuningHovered1 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        OrgSetup40Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      OrgSetup40Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionKBHovered1) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          40) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .local_library_outlined,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    30
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'CMS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() =>
                                                  _model.mouseRegionKBHovered1 =
                                                      true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() =>
                                                  _model.mouseRegionKBHovered1 =
                                                      false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        ReportSetup60Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      ReportSetup60Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionAPIHovered1) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.api,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    60
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'API connections',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionAPIHovered1 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionAPIHovered1 =
                                                  false);
                                            }),
                                          ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Divider(
                                  height: 12.0,
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).secondary,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                MouseRegion(
                                  opaque: false,
                                  cursor:
                                      MouseCursor.defer ?? MouseCursor.defer,
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if ((widget.selectedNav == 70) &&
                                          widget.contentWarning!) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Save changes'),
                                                      content: Text(
                                                          'Changes have been made, do you want to Save?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Ignore'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Save'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          context.pushNamed(
                                            HomeWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      } else {
                                        context.pushNamed(
                                          HomeWidget.routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 350),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (_model.mouseRegionHovered1) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.selectedNav ==
                                              20) {
                                            return FlutterFlowTheme.of(context)
                                                .accent1;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 6.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 6.0, 0.0),
                                              child: FaIcon(
                                                FontAwesomeIcons
                                                    .chalkboardTeacher,
                                                color: widget.selectedNav == 20
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primary
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                size: 24.0,
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 0.0, 0.0),
                                                child: Text(
                                                  'Operations',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onEnter: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered1 = true);
                                  }),
                                  onExit: ((event) async {
                                    safeSetState(() =>
                                        _model.mouseRegionHovered1 = false);
                                  }),
                                ),
                              ].divide(SizedBox(height: 10.0)),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                  if (FFAppState().menuOpen)
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Divider(
                                height: 12.0,
                                thickness: 1.0,
                                color: FlutterFlowTheme.of(context).secondary,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 8.0, 12.0, 16.0),
                            child: Container(
                              width: 250.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setDarkModeSetting(
                                            context, ThemeMode.light);
                                      },
                                      child: Container(
                                        width: 115.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              Theme.of(context).brightness ==
                                                      Brightness.light
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                            ),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.wb_sunny_rounded,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.light
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Light',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.light
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                  Expanded(
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        setDarkModeSetting(
                                            context, ThemeMode.dark);
                                      },
                                      child: Container(
                                        width: 115.0,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              Theme.of(context).brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .alternate
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.nightlight_round,
                                              color: Theme.of(context)
                                                          .brightness ==
                                                      Brightness.dark
                                                  ? FlutterFlowTheme.of(context)
                                                      .primaryText
                                                  : FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 16.0,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(4.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                'Dark',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: Theme.of(context)
                                                                  .brightness ==
                                                              Brightness.dark
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              12.0, 0.0, 12.0, 12.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12.0, 0.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            GoRouter.of(context)
                                                .prepareAuthEvent();
                                            await authManager.signOut();
                                            GoRouter.of(context)
                                                .clearRedirectLocation();

                                            context.goNamedAuth(
                                                LoginMainWidget.routeName,
                                                context.mounted);
                                          },
                                          child: Text(
                                            'Log Out',
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium
                                                .override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontWeight,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelMedium
                                                            .fontStyle,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .labelMedium
                                                          .fontStyle,
                                                ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 4.0, 0.0, 0.0),
                                        child: Text(
                                          FFAppConstants.AppVersion,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.inter(
                                                  fontWeight:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontWeight,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 10.0,
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
                                    ].divide(SizedBox(height: 2.0)),
                                  ),
                                ),
                              ),
                              Builder(
                                builder: (context) => FlutterFlowIconButton(
                                  borderRadius: 8.0,
                                  buttonSize: 32.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).alternate,
                                  icon: Icon(
                                    Icons.person,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 16.0,
                                  ),
                                  onPressed: () async {
                                    await showAlignedDialog(
                                      barrierDismissible: false,
                                      context: context,
                                      isGlobal: false,
                                      avoidOverflow: false,
                                      targetAnchor: AlignmentDirectional(
                                              1.0, -1.0)
                                          .resolve(Directionality.of(context)),
                                      followerAnchor: AlignmentDirectional(
                                              -1.0, 1.0)
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
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        if (!FFAppState().menuOpen)
          Container(
            width: 44.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).alternate,
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 2.0, 0.0, 4.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            FFAppState().menuOpen =
                                !(FFAppState().menuOpen ?? true);
                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.menu,
                            color: FlutterFlowTheme.of(context).primaryText,
                            size: 24.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 12.0,
                    thickness: 0.5,
                    color: FlutterFlowTheme.of(context).secondary,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (FFAppState().session.adminRole == 0)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                TenantManagementWidget
                                                    .routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              TenantManagementWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionTenantsHovered) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  20) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Icon(
                                              Icons
                                                  .playlist_add_circle_outlined,
                                              color: widget.selectedNav == 20
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionTenantsHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionTenantsHovered = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 350),
                                        curve: Curves.easeInOut,
                                        width: double.infinity,
                                        height: 44.0,
                                        decoration: BoxDecoration(
                                          color: () {
                                            if (_model
                                                .mouseRegionOrdcolHovered) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .secondaryBackground;
                                            } else if (widget.selectedNav ==
                                                30) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .accent1;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .alternate;
                                            }
                                          }(),
                                          borderRadius:
                                              BorderRadius.circular(0.0),
                                          shape: BoxShape.rectangle,
                                        ),
                                        child: Builder(
                                          builder: (context) => InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              await showAlignedDialog(
                                                context: context,
                                                isGlobal: false,
                                                avoidOverflow: false,
                                                targetAnchor:
                                                    AlignmentDirectional(
                                                            1.0, -1.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                followerAnchor:
                                                    AlignmentDirectional(
                                                            -1.0, -1.0)
                                                        .resolve(
                                                            Directionality.of(
                                                                context)),
                                                builder: (dialogContext) {
                                                  return Material(
                                                    color: Colors.transparent,
                                                    child: Container(
                                                      height: 220.0,
                                                      width: 200.0,
                                                      child: MenuSetupWidget(
                                                        selectNav:
                                                            widget.selectedNav,
                                                        contentWarning: widget
                                                            .contentWarning,
                                                        opsBoards: 0,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                            child: Icon(
                                              Icons.settings_sharp,
                                              color: widget.selectedNav == 30
                                                  ? FlutterFlowTheme.of(context)
                                                      .primary
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionOrdcolHovered = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionOrdcolHovered = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                  AppBuilderWidget.routeName);
                                            }
                                          } else {
                                            context.pushNamed(
                                              AppBuilderWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionAIHovered2) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  35) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Icon(
                                            Icons.auto_awesome,
                                            color: widget.selectedNav == 30
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionAIHovered2 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionAIHovered2 = false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 30)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                DispatchesWidget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              DispatchesWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionDispatchHovered2) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  70) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Icon(
                                            Icons.phone_iphone,
                                            color: widget.selectedNav == 70
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionDispatchHovered2 =
                                                true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() =>
                                            _model.mouseRegionDispatchHovered2 =
                                                false);
                                      }),
                                    ),
                                  if (FFAppState().session.adminRole <= 20)
                                    MouseRegion(
                                      opaque: false,
                                      cursor: MouseCursor.defer ??
                                          MouseCursor.defer,
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if ((widget.selectedNav == 70) &&
                                              widget.contentWarning!) {
                                            var confirmDialogResponse =
                                                await showDialog<bool>(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return AlertDialog(
                                                          title: Text(
                                                              'Save changes'),
                                                          content: Text(
                                                              'Changes have been made, do you want to Save?'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      false),
                                                              child: Text(
                                                                  'Ignore'),
                                                            ),
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext,
                                                                      true),
                                                              child:
                                                                  Text('Save'),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                    ) ??
                                                    false;
                                            if (!confirmDialogResponse) {
                                              context.pushNamed(
                                                UserManagement2Widget.routeName,
                                                extra: <String, dynamic>{
                                                  '__transition_info__':
                                                      TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                        milliseconds: 0),
                                                  ),
                                                },
                                              );
                                            }
                                          } else {
                                            context.pushNamed(
                                              UserMgmtWidget.routeName,
                                              extra: <String, dynamic>{
                                                '__transition_info__':
                                                    TransitionInfo(
                                                  hasTransition: true,
                                                  transitionType:
                                                      PageTransitionType.fade,
                                                  duration:
                                                      Duration(milliseconds: 0),
                                                ),
                                              },
                                            );
                                          }
                                        },
                                        child: AnimatedContainer(
                                          duration: Duration(milliseconds: 350),
                                          curve: Curves.easeInOut,
                                          width: double.infinity,
                                          height: 44.0,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (_model
                                                  .mouseRegionUserHovered2) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondaryBackground;
                                              } else if (widget.selectedNav ==
                                                  50) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .accent1;
                                              } else {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .alternate;
                                              }
                                            }(),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                            shape: BoxShape.rectangle,
                                          ),
                                          child: Icon(
                                            Icons.person_sharp,
                                            color: widget.selectedNav == 50
                                                ? FlutterFlowTheme.of(context)
                                                    .primary
                                                : FlutterFlowTheme.of(context)
                                                    .primaryText,
                                            size: 24.0,
                                          ),
                                        ),
                                      ),
                                      onEnter: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionUserHovered2 = true);
                                      }),
                                      onExit: ((event) async {
                                        safeSetState(() => _model
                                            .mouseRegionUserHovered2 = false);
                                      }),
                                    ),
                                  if (false)
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        CmsSetup80Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      CmsSetup80Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionActionsHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: FaIcon(
                                                            FontAwesomeIcons
                                                                .robot,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    60
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Agents',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionActionsHovered2 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionActionsHovered2 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        TemplateWidget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      TemplateWidget.routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionDataHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          55) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .text_snippet_outlined,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    55
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Templates',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionDataHovered2 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionDataHovered2 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        OrgSetup40Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      OrgSetup40Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionFineTuningHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          40) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .model_training_sharp,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    30
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Training',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionFineTuningHovered2 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionFineTuningHovered2 =
                                                  false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        OrgSetup40Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      OrgSetup40Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionKBHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          40) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons
                                                                .local_library_outlined,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    30
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'CMS',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() =>
                                                  _model.mouseRegionKBHovered2 =
                                                      true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() =>
                                                  _model.mouseRegionKBHovered2 =
                                                      false);
                                            }),
                                          ),
                                        if (FFAppState().session.adminRole <=
                                            30)
                                          MouseRegion(
                                            opaque: false,
                                            cursor: MouseCursor.defer ??
                                                MouseCursor.defer,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 0.0, 16.0, 0.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  if ((widget.selectedNav ==
                                                          70) &&
                                                      widget.contentWarning!) {
                                                    var confirmDialogResponse =
                                                        await showDialog<bool>(
                                                              context: context,
                                                              builder:
                                                                  (alertDialogContext) {
                                                                return AlertDialog(
                                                                  title: Text(
                                                                      'Save changes'),
                                                                  content: Text(
                                                                      'Changes have been made, do you want to Save?'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          false),
                                                                      child: Text(
                                                                          'Ignore'),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed: () => Navigator.pop(
                                                                          alertDialogContext,
                                                                          true),
                                                                      child: Text(
                                                                          'Save'),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            ) ??
                                                            false;
                                                    if (!confirmDialogResponse) {
                                                      context.pushNamed(
                                                        ReportSetup60Widget
                                                            .routeName,
                                                        extra: <String,
                                                            dynamic>{
                                                          '__transition_info__':
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    }
                                                  } else {
                                                    context.pushNamed(
                                                      ReportSetup60Widget
                                                          .routeName,
                                                      extra: <String, dynamic>{
                                                        '__transition_info__':
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                          duration: Duration(
                                                              milliseconds: 0),
                                                        ),
                                                      },
                                                    );
                                                  }
                                                },
                                                child: AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 350),
                                                  curve: Curves.easeInOut,
                                                  width: double.infinity,
                                                  height: 44.0,
                                                  decoration: BoxDecoration(
                                                    color: () {
                                                      if (_model
                                                          .mouseRegionAPIHovered2) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground;
                                                      } else if (widget
                                                              .selectedNav ==
                                                          5) {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .accent1;
                                                      } else {
                                                        return FlutterFlowTheme
                                                                .of(context)
                                                            .alternate;
                                                      }
                                                    }(),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    shape: BoxShape.rectangle,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                6.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      6.0,
                                                                      0.0),
                                                          child: Icon(
                                                            Icons.api,
                                                            color: widget
                                                                        .selectedNav ==
                                                                    60
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            size: 24.0,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      8.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'API connections',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
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
                                            ),
                                            onEnter: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionAPIHovered2 =
                                                  true);
                                            }),
                                            onExit: ((event) async {
                                              safeSetState(() => _model
                                                      .mouseRegionAPIHovered2 =
                                                  false);
                                            }),
                                          ),
                                      ].divide(SizedBox(height: 10.0)),
                                    ),
                                ].divide(SizedBox(height: 6.0)),
                              ),
                            ),
                          ),
                          Divider(
                            height: 12.0,
                            thickness: 1.0,
                            color: FlutterFlowTheme.of(context).secondary,
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: MouseRegion(
                                opaque: false,
                                cursor: MouseCursor.defer ?? MouseCursor.defer,
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      if ((widget.selectedNav == 70) &&
                                          widget.contentWarning!) {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title:
                                                          Text('Save changes'),
                                                      content: Text(
                                                          'Changes have been made, do you want to Save?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('Ignore'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('Save'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (!confirmDialogResponse) {
                                          context.pushNamed(
                                            HomeWidget.routeName,
                                            extra: <String, dynamic>{
                                              '__transition_info__':
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                                duration:
                                                    Duration(milliseconds: 0),
                                              ),
                                            },
                                          );
                                        }
                                      } else {
                                        context.pushNamed(
                                          HomeWidget.routeName,
                                          extra: <String, dynamic>{
                                            '__transition_info__':
                                                TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 350),
                                      curve: Curves.easeInOut,
                                      width: double.infinity,
                                      height: 44.0,
                                      decoration: BoxDecoration(
                                        color: () {
                                          if (_model.mouseRegionHovered2) {
                                            return FlutterFlowTheme.of(context)
                                                .secondaryBackground;
                                          } else if (widget.selectedNav ==
                                              20) {
                                            return FlutterFlowTheme.of(context)
                                                .accent1;
                                          } else {
                                            return FlutterFlowTheme.of(context)
                                                .alternate;
                                          }
                                        }(),
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        shape: BoxShape.rectangle,
                                      ),
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: FaIcon(
                                        FontAwesomeIcons.chalkboardTeacher,
                                        color: widget.selectedNav == 20
                                            ? FlutterFlowTheme.of(context)
                                                .primary
                                            : FlutterFlowTheme.of(context)
                                                .primaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                onEnter: ((event) async {
                                  safeSetState(
                                      () => _model.mouseRegionHovered2 = true);
                                }),
                                onExit: ((event) async {
                                  safeSetState(
                                      () => _model.mouseRegionHovered2 = false);
                                }),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(height: 10.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
