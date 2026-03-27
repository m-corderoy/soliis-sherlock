import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/components/new_team_node/new_team_node_widget.dart';
import '/components/ops_board_manage/ops_board_manage_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/components/tree_components/location/location_tree_general_inline/location_tree_general_inline_widget.dart';
import '/components/tree_components/team/team_tree_general_inline/team_tree_general_inline_widget.dart';
import '/components/tree_components/tree_location/tree_location_widget.dart';
import '/components/tree_components/tree_teams/tree_teams_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutterflow_colorpicker/flutterflow_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'oldadmin_model.dart';
export 'oldadmin_model.dart';

class OldadminWidget extends StatefulWidget {
  const OldadminWidget({super.key});

  static String routeName = 'oldadmin';
  static String routePath = '/oldadmin';

  @override
  State<OldadminWidget> createState() => _OldadminWidgetState();
}

class _OldadminWidgetState extends State<OldadminWidget> {
  late OldadminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OldadminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Action 1: Tree Hierarchy
      _model.getInitialLocation = await GetTreeCall.call(
        parentid: FFAppState().session.locationTreeIDStart,
        apikey: FFDevEnvironmentValues().supabaseAnonKey,
        jwt: FFAppState().supabaseAuthToken,
      );

      if ((_model.getInitialLocation?.succeeded ?? true)) {
        _model.treedata1 = (_model.getInitialLocation?.jsonBody ?? '')
            .toList()
            .cast<dynamic>();
        _model.textReadOnly = true;
        _model.tabID = 0;
        _model.treeData1b = (_model.getInitialLocation?.jsonBody ?? '')
            .toList()
            .cast<dynamic>();
        safeSetState(() {});
        _model.getInitialTeam = await GetTeamCall.call();

        if ((_model.getInitialTeam?.succeeded ?? true)) {
          _model.treedata2 =
              (_model.getInitialTeam?.jsonBody ?? '').toList().cast<dynamic>();
          safeSetState(() {});
          FFAppState().treeTeam =
              (_model.getInitialTeam?.jsonBody ?? '').toList().cast<dynamic>();
          safeSetState(() {});
        }
      }
    });

    _model.textFieldFocusNode ??= FocusNode();

    _model.tenantPromptFieldFocusNode ??= FocusNode();

    _model.opsPromptTextFieldTextController ??= TextEditingController();
    _model.opsPromptTextFieldFocusNode ??= FocusNode();

    _model.textEditlongnameFocusNode ??= FocusNode();

    _model.textFieldPromptTextController ??= TextEditingController();
    _model.textFieldPromptFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<List<TenantRow>>(
      future: TenantTable().querySingleRow(
        queryFn: (q) => q.eqOrNull(
          'id',
          FFAppState().session.tenantID,
        ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<TenantRow> oldadminTenantRowList = snapshot.data!;

        final oldadminTenantRow = oldadminTenantRowList.isNotEmpty
            ? oldadminTenantRowList.first
            : null;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Container(
                decoration: BoxDecoration(),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        wrapWithModel(
                          model: _model.sideNavAdminModel,
                          updateCallback: () => safeSetState(() {}),
                          updateOnChange: true,
                          child: SideNavAdminWidget(
                            selectedNav: 30,
                          ),
                        ),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 78.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3.0,
                                      color: Color(0x33000000),
                                      offset: Offset(
                                        0.0,
                                        1.0,
                                      ),
                                    )
                                  ],
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(8.0),
                                    bottomRight: Radius.circular(8.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(0.0),
                                  ),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 6.0, 0.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _model.tabID == 0
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 42.0,
                                                          icon: Icon(
                                                            Icons.settings,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.tabID = 0;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        'Setup',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight: 0.9,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() => _model
                                                        .mouseHomeSetupHovered =
                                                    true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() => _model
                                                        .mouseHomeSetupHovered =
                                                    false);
                                              }),
                                            ),
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _model.tabID == 1
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 42.0,
                                                          icon: Icon(
                                                            Icons
                                                                .lightbulb_outline,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.tabID = 1;
                                                            _model.tempPrompt1 =
                                                                oldadminTenantRow
                                                                    ?.prompt;
                                                            _model.tempPrompt2 =
                                                                null;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        'Prompts',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight: 0.9,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() => _model
                                                    .mousePromptHovered = true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() =>
                                                    _model.mousePromptHovered =
                                                        false);
                                              }),
                                            ),
                                            if (false)
                                              MouseRegion(
                                                opaque: false,
                                                cursor: MouseCursor.defer ??
                                                    MouseCursor.defer,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          4.0, 0.0, 4.0, 4.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: _model.tabID == 2
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .accent1
                                                          : Color(0x00000000),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4.0),
                                                    ),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child:
                                                                  FlutterFlowIconButton(
                                                                borderRadius:
                                                                    8.0,
                                                                buttonSize:
                                                                    42.0,
                                                                icon: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chalkboardTeacher,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 26.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            9.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Stack(
                                                                  children: [
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .circle,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .add_circle_outline,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            16.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          'Dashboard',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodySmall
                                                              .override(
                                                                font:
                                                                    GoogleFonts
                                                                        .inter(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                                ),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                                lineHeight: 0.9,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                onEnter: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseBoardsHovered =
                                                      true);
                                                }),
                                                onExit: ((event) async {
                                                  safeSetState(() => _model
                                                          .mouseBoardsHovered =
                                                      false);
                                                }),
                                              ),
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _model.tabID == 3
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 42.0,
                                                          icon: Icon(
                                                            Icons.map_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.tabID = 3;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        'Location',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight: 0.9,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() => _model
                                                        .mouseLocationHovered =
                                                    true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() => _model
                                                        .mouseLocationHovered =
                                                    false);
                                              }),
                                            ),
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _model.tabID == 4
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 42.0,
                                                          icon: Icon(
                                                            Icons.people,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.tabID = 4;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        'Teams',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight: 0.9,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() => _model
                                                    .mouseTeamsHovered = true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() => _model
                                                    .mouseTeamsHovered = false);
                                              }),
                                            ),
                                            MouseRegion(
                                              opaque: false,
                                              cursor: MouseCursor.defer ??
                                                  MouseCursor.defer,
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: _model.tabID == 5
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .accent1
                                                        : Color(0x00000000),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.all(4.0),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderRadius: 8.0,
                                                          buttonSize: 42.0,
                                                          icon: Icon(
                                                            Icons
                                                                .imagesearch_roller_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 26.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.tabID = 5;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ),
                                                      Text(
                                                        'Roles',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodySmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .inter(
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmall
                                                                    .fontStyle,
                                                              ),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText,
                                                              fontSize: 10.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontWeight,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodySmall
                                                                      .fontStyle,
                                                              lineHeight: 0.9,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              onEnter: ((event) async {
                                                safeSetState(() => _model
                                                    .mouseRolesHovered = true);
                                              }),
                                              onExit: ((event) async {
                                                safeSetState(() => _model
                                                    .mouseRolesHovered = false);
                                              }),
                                            ),
                                          ].divide(SizedBox(width: 20.0)),
                                        ),
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.supportmenuModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: SupportmenuWidget(),
                                    ),
                                  ]
                                      .divide(SizedBox(width: 16.0))
                                      .around(SizedBox(width: 16.0)),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: FutureBuilder<List<OpsBoardRow>>(
                                  future: OpsBoardTable().queryRows(
                                    queryFn: (q) => q
                                        .eqOrNull(
                                          'tenant_id',
                                          FFAppState().session.tenantID,
                                        )
                                        .order('id'),
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
                                    List<OpsBoardRow>
                                        opsBoardDataOpsBoardRowList =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                        ),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                if (_model.tabID == 0) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(0.0),
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.stretch,
                                                                            children:
                                                                                [
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 3.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                              children: [
                                                                                                                Icon(
                                                                                                                  Icons.corporate_fare,
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  size: 20.0,
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Organisation',
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Divider(
                                                                                                        thickness: 2.0,
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    child: TextFormField(
                                                                                                                      controller: _model.textController1 ??= TextEditingController(
                                                                                                                        text: oldadminTenantRow?.name,
                                                                                                                      ),
                                                                                                                      focusNode: _model.textFieldFocusNode,
                                                                                                                      autofocus: false,
                                                                                                                      readOnly: true,
                                                                                                                      obscureText: false,
                                                                                                                      decoration: InputDecoration(
                                                                                                                        isDense: true,
                                                                                                                        labelStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                            ),
                                                                                                                        alignLabelWithHint: false,
                                                                                                                        hintText: 'TextField',
                                                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        focusedBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: Color(0x00000000),
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        errorBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        filled: true,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      validator: _model.textController1Validator.asValidator(context),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                          if (false)
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 0.0, 0.0),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'Account Owner',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
                                                                                                                      child: FlutterFlowDropDown<String>(
                                                                                                                        controller: _model.dropDownValueController1 ??= FormFieldController<String>(null),
                                                                                                                        options: <String>[],
                                                                                                                        onChanged: (val) => safeSetState(() => _model.dropDownValue1 = val),
                                                                                                                        width: 400.0,
                                                                                                                        height: 40.0,
                                                                                                                        searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                            ),
                                                                                                                        searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                        textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                              ),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                        hintText: 'Select...',
                                                                                                                        searchHintText: 'Search...',
                                                                                                                        icon: Icon(
                                                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                          size: 24.0,
                                                                                                                        ),
                                                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        elevation: 2.0,
                                                                                                                        borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        borderWidth: 0.0,
                                                                                                                        borderRadius: 8.0,
                                                                                                                        margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                        hidesUnderline: true,
                                                                                                                        isOverButton: false,
                                                                                                                        isSearchable: true,
                                                                                                                        isMultiSelect: false,
                                                                                                                      ),
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
                                                                                                if (false)
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                                      children: [
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () {
                                                                                                            print('Button pressed ...');
                                                                                                          },
                                                                                                          text: 'Cancel',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 80.0,
                                                                                                            height: 32.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () {
                                                                                                            print('Button pressed ...');
                                                                                                          },
                                                                                                          text: 'Update',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 80.0,
                                                                                                            height: 32.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                            textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                            elevation: 0.0,
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        width: 160.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          boxShadow: [
                                                                                            BoxShadow(
                                                                                              blurRadius: 3.0,
                                                                                              color: Color(0x33000000),
                                                                                              offset: Offset(
                                                                                                0.0,
                                                                                                1.0,
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Icon(
                                                                                                      Icons.picture_in_picture,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Logo',
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                              ),
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Divider(
                                                                                                thickness: 2.0,
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                        child: Image.network(
                                                                                                          oldadminTenantRow!.logoUrl!,
                                                                                                          width: 120.0,
                                                                                                          height: 120.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 12.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          final selectedMedia = await selectMedia(
                                                                                                            storageFolderPath: opsBoardDataOpsBoardRowList.firstOrNull?.id.toString(),
                                                                                                            maxWidth: 400.00,
                                                                                                            maxHeight: 400.00,
                                                                                                            mediaSource: MediaSource.photoGallery,
                                                                                                            multiImage: false,
                                                                                                          );
                                                                                                          if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                            safeSetState(() => _model.isDataUploading_uploadDataImageSetup = true);
                                                                                                            var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                                            var downloadUrls = <String>[];
                                                                                                            try {
                                                                                                              selectedUploadedFiles = selectedMedia
                                                                                                                  .map((m) => FFUploadedFile(
                                                                                                                        name: m.storagePath.split('/').last,
                                                                                                                        bytes: m.bytes,
                                                                                                                        height: m.dimensions?.height,
                                                                                                                        width: m.dimensions?.width,
                                                                                                                        blurHash: m.blurHash,
                                                                                                                        originalFilename: m.originalFilename,
                                                                                                                      ))
                                                                                                                  .toList();

                                                                                                              downloadUrls = await uploadSupabaseStorageFiles(
                                                                                                                bucketName: 'report',
                                                                                                                selectedFiles: selectedMedia,
                                                                                                              );
                                                                                                            } finally {
                                                                                                              _model.isDataUploading_uploadDataImageSetup = false;
                                                                                                            }
                                                                                                            if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                              safeSetState(() {
                                                                                                                _model.uploadedLocalFile_uploadDataImageSetup = selectedUploadedFiles.first;
                                                                                                                _model.uploadedFileUrl_uploadDataImageSetup = downloadUrls.first;
                                                                                                              });
                                                                                                            } else {
                                                                                                              safeSetState(() {});
                                                                                                              return;
                                                                                                            }
                                                                                                          }

                                                                                                          await TenantTable().update(
                                                                                                            data: {
                                                                                                              'logo_url': _model.uploadedFileUrl_uploadDataImageSetup,
                                                                                                            },
                                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                                              'id',
                                                                                                              oldadminTenantRow.id,
                                                                                                            ),
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                        text: 'Upload',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: 80.0,
                                                                                                          height: 31.86,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                          textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                              ),
                                                                                                          elevation: 0.0,
                                                                                                          borderRadius: BorderRadius.circular(8.0),
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
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                  child: FaIcon(
                                                                                                                    FontAwesomeIcons.chalkboardTeacher,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Dashboards',
                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Builder(
                                                                                                              builder: (context) => Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                                child: FlutterFlowIconButton(
                                                                                                                  borderRadius: 8.0,
                                                                                                                  buttonSize: 40.0,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.add,
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    await showDialog(
                                                                                                                      barrierDismissible: false,
                                                                                                                      context: context,
                                                                                                                      builder: (dialogContext) {
                                                                                                                        return Dialog(
                                                                                                                          elevation: 0,
                                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                          child: GestureDetector(
                                                                                                                            onTap: () {
                                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                            },
                                                                                                                            child: OpsBoardManageWidget(
                                                                                                                              tenantid: FFAppState().session.tenantID,
                                                                                                                              opsID: -1,
                                                                                                                              newBoard: true,
                                                                                                                              tenantPrompt: FFAppState().session.tenantPrompt,
                                                                                                                              orgPrompt: oldadminTenantRow.prompt,
                                                                                                                              actionNew: (boardID) async {
                                                                                                                                safeSetState(() {});
                                                                                                                              },
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 2.0,
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 8.0),
                                                                                                            child: Builder(
                                                                                                              builder: (context) {
                                                                                                                final opsBoardChildren = opsBoardDataOpsBoardRowList.toList();

                                                                                                                return ListView.separated(
                                                                                                                  padding: EdgeInsets.symmetric(vertical: 4.0),
                                                                                                                  shrinkWrap: true,
                                                                                                                  scrollDirection: Axis.vertical,
                                                                                                                  itemCount: opsBoardChildren.length,
                                                                                                                  separatorBuilder: (_, __) => SizedBox(height: 4.0),
                                                                                                                  itemBuilder: (context, opsBoardChildrenIndex) {
                                                                                                                    final opsBoardChildrenItem = opsBoardChildren[opsBoardChildrenIndex];
                                                                                                                    return Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 1.0),
                                                                                                                      child: Container(
                                                                                                                        width: double.infinity,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Colors.white,
                                                                                                                          boxShadow: [
                                                                                                                            BoxShadow(
                                                                                                                              blurRadius: 0.0,
                                                                                                                              color: Color(0xFFE0E3E7),
                                                                                                                              offset: Offset(
                                                                                                                                0.0,
                                                                                                                                1.0,
                                                                                                                              ),
                                                                                                                            )
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Column(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Text(
                                                                                                                                            opsBoardChildrenItem.name,
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                  ),
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              opsBoardChildrenItem.description,
                                                                                                                                              'description',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                  ),
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                              Builder(
                                                                                                                                builder: (context) => FlutterFlowIconButton(
                                                                                                                                  borderRadius: 8.0,
                                                                                                                                  buttonSize: 40.0,
                                                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.more_vert,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                  onPressed: () async {
                                                                                                                                    await showDialog(
                                                                                                                                      barrierDismissible: false,
                                                                                                                                      context: context,
                                                                                                                                      builder: (dialogContext) {
                                                                                                                                        return Dialog(
                                                                                                                                          elevation: 0,
                                                                                                                                          insetPadding: EdgeInsets.zero,
                                                                                                                                          backgroundColor: Colors.transparent,
                                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                          child: GestureDetector(
                                                                                                                                            onTap: () {
                                                                                                                                              FocusScope.of(dialogContext).unfocus();
                                                                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                            },
                                                                                                                                            child: OpsBoardManageWidget(
                                                                                                                                              tenantid: FFAppState().session.tenantID,
                                                                                                                                              opsID: opsBoardChildrenItem.id,
                                                                                                                                              newBoard: false,
                                                                                                                                              tenantPrompt: '',
                                                                                                                                              orgPrompt: oldadminTenantRow.prompt,
                                                                                                                                              actionNew: (boardID) async {
                                                                                                                                                safeSetState(() {});
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Icon(
                                                                                                                    Icons.support_agent,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Assistants',
                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                              child: FlutterFlowIconButton(
                                                                                                                borderRadius: 8.0,
                                                                                                                buttonSize: 40.0,
                                                                                                                icon: Icon(
                                                                                                                  Icons.add,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                onPressed: () {
                                                                                                                  print('IconButton pressed ...');
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 2.0,
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 8.0),
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.symmetric(vertical: 4.0),
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 1.0),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 0.0,
                                                                                                                          color: Color(0xFFE0E3E7),
                                                                                                                          offset: Offset(
                                                                                                                            0.0,
                                                                                                                            1.0,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        'RAG Assistant',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        '',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderRadius: 8.0,
                                                                                                                            buttonSize: 40.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.more_vert,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                            onPressed: () {
                                                                                                                              print('IconButton pressed ...');
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(height: 4.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Icon(
                                                                                                                    Icons.lightbulb_outline,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Custom LLMs',
                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                              child: FlutterFlowIconButton(
                                                                                                                borderRadius: 8.0,
                                                                                                                buttonSize: 40.0,
                                                                                                                icon: Icon(
                                                                                                                  Icons.add,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                onPressed: () {
                                                                                                                  print('IconButton pressed ...');
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 2.0,
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.symmetric(vertical: 4.0),
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 0.0,
                                                                                                                          color: Color(0xFFE0E3E7),
                                                                                                                          offset: Offset(
                                                                                                                            0.0,
                                                                                                                            1.0,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        'Trained LLM Model ',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        '',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderRadius: 8.0,
                                                                                                                            buttonSize: 40.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.more_vert,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                            onPressed: () {
                                                                                                                              print('IconButton pressed ...');
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(height: 4.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    boxShadow: [
                                                                                                      BoxShadow(
                                                                                                        blurRadius: 3.0,
                                                                                                        color: Color(0x33000000),
                                                                                                        offset: Offset(
                                                                                                          0.0,
                                                                                                          1.0,
                                                                                                        ),
                                                                                                      )
                                                                                                    ],
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Icon(
                                                                                                                    Icons.library_books_sharp,
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 24.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Align(
                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 16.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Sessions',
                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                              child: FlutterFlowIconButton(
                                                                                                                borderRadius: 8.0,
                                                                                                                buttonSize: 40.0,
                                                                                                                icon: Icon(
                                                                                                                  Icons.add,
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                  size: 24.0,
                                                                                                                ),
                                                                                                                onPressed: () {
                                                                                                                  print('IconButton pressed ...');
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Divider(
                                                                                                          thickness: 2.0,
                                                                                                          color: FlutterFlowTheme.of(context).alternate,
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 8.0),
                                                                                                            child: ListView(
                                                                                                              padding: EdgeInsets.symmetric(vertical: 4.0),
                                                                                                              shrinkWrap: true,
                                                                                                              scrollDirection: Axis.vertical,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                  child: Container(
                                                                                                                    width: double.infinity,
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: Colors.white,
                                                                                                                      boxShadow: [
                                                                                                                        BoxShadow(
                                                                                                                          blurRadius: 0.0,
                                                                                                                          color: Color(0xFFE0E3E7),
                                                                                                                          offset: Offset(
                                                                                                                            0.0,
                                                                                                                            1.0,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Column(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        'Glossary Set',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                                Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Text(
                                                                                                                                        '',
                                                                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                              font: GoogleFonts.inter(
                                                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                              ),
                                                                                                                                              letterSpacing: 0.0,
                                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                            ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ],
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderRadius: 8.0,
                                                                                                                            buttonSize: 40.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.more_vert,
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                              size: 24.0,
                                                                                                                            ),
                                                                                                                            onPressed: () {
                                                                                                                              print('IconButton pressed ...');
                                                                                                                            },
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(height: 4.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(height: 16.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      8.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          16.0,
                                                                          8.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.map_outlined,
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Locations',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final treeLocationData = _model.treedata1.map((e) => e).toList();

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: treeLocationData.length,
                                                                                        itemBuilder: (context, treeLocationDataIndex) {
                                                                                          final treeLocationDataItem = treeLocationData[treeLocationDataIndex];
                                                                                          return Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: TreeLocationWidget(
                                                                                                key: Key('Keyv9l_${treeLocationDataIndex}_of_${treeLocationData.length}'),
                                                                                                rowid: getJsonField(
                                                                                                  treeLocationDataItem,
                                                                                                  r'''$.id''',
                                                                                                ),
                                                                                                rowdata: treeLocationDataItem,
                                                                                              ),
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
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.people_sharp,
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Teams',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final treeTeamData = _model.treedata2.map((e) => e).toList();

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: treeTeamData.length,
                                                                                        itemBuilder: (context, treeTeamDataIndex) {
                                                                                          final treeTeamDataItem = treeTeamData[treeTeamDataIndex];
                                                                                          return Container(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: TreeTeamsWidget(
                                                                                                key: Key('Keyi2o_${treeTeamDataIndex}_of_${treeTeamData.length}'),
                                                                                                rowid: getJsonField(
                                                                                                  treeTeamDataItem,
                                                                                                  r'''$.id''',
                                                                                                ),
                                                                                                rowdata: treeTeamDataItem,
                                                                                              ),
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
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            8.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.imagesearch_roller_outlined,
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        size: 24.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Roles',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              thickness: 2.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (_model.tabID == 1) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      height:
                                                                          520.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(20.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Organisation Prompt...',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                                                                                              child: Text(
                                                                                                'Enter the system prompt to define the principle purpose of this operational management tool...',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderRadius: 8.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                    icon: Icon(
                                                                                                      Icons.auto_awesome,
                                                                                                      color: Colors.white,
                                                                                                      size: 24.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: Text('Prompt Generator'),
                                                                                                            content: Text('AI Prompt generator to help organisations quickly create effect prompts for the application...'),
                                                                                                            actions: [
                                                                                                              TextButton(
                                                                                                                onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                child: Text('Ok'),
                                                                                                              ),
                                                                                                            ],
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                    child: FlutterFlowIconButton(
                                                                                                      borderRadius: 8.0,
                                                                                                      buttonSize: 40.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                      icon: Icon(
                                                                                                        Icons.clear,
                                                                                                        color: Colors.white,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  title: Text('Organisation Prompt Clear'),
                                                                                                                  content: Text('Are you sure you want to clear this prompt?'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                      child: Text('No'),
                                                                                                                    ),
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                      child: Text('Yes'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ) ??
                                                                                                            false;
                                                                                                        if (confirmDialogResponse) {
                                                                                                          safeSetState(() {
                                                                                                            _model.tenantPromptFieldTextController?.text = ' ';
                                                                                                          });
                                                                                                        }
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Form(
                                                                                      key: _model.formKey1,
                                                                                      autovalidateMode: AutovalidateMode.disabled,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(1.0, -1.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.tenantPromptFieldTextController ??= TextEditingController(
                                                                                                    text: oldadminTenantRow?.prompt,
                                                                                                  ),
                                                                                                  focusNode: _model.tenantPromptFieldFocusNode,
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintText: 'Enter you system prompt for your organisation, use the AI assistant above if you require help...',
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    enabledBorder: InputBorder.none,
                                                                                                    focusedBorder: InputBorder.none,
                                                                                                    errorBorder: InputBorder.none,
                                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    contentPadding: EdgeInsets.all(8.0),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  maxLines: null,
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.tenantPromptFieldTextControllerValidator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    safeSetState(() {
                                                                                      _model.tenantPromptFieldTextController?.text = _model.tempPrompt1!;
                                                                                    });
                                                                                  },
                                                                                  text: 'Undo',
                                                                                  options: FFButtonOptions(
                                                                                    width: 80.0,
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await TenantTable().update(
                                                                                        data: {
                                                                                          'prompt': _model.tenantPromptFieldTextController.text,
                                                                                        },
                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                          'id',
                                                                                          FFAppState().session.tenantID,
                                                                                        ),
                                                                                      );
                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: 'Save',
                                                                                    options: FFButtonOptions(
                                                                                      width: 80.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Flexible(
                                                          flex: 1,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          0.5,
                                                                      height:
                                                                          520.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(16.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(20.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Dashboard Prompt...',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 8.0, 12.0),
                                                                                              child: Text(
                                                                                                'Enter the system prompt to define the principle purpose of this operational management tool...',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                        child: FlutterFlowDropDown<int>(
                                                                                                          controller: _model.opsBoardDropDownValueController ??= FormFieldController<int>(null),
                                                                                                          options: List<int>.from(opsBoardDataOpsBoardRowList.map((e) => e.id).toList()),
                                                                                                          optionLabels: opsBoardDataOpsBoardRowList.map((e) => e.name).toList(),
                                                                                                          onChanged: (val) async {
                                                                                                            safeSetState(() => _model.opsBoardDropDownValue = val);
                                                                                                            safeSetState(() {
                                                                                                              _model.opsPromptTextFieldTextController?.text = opsBoardDataOpsBoardRowList.where((e) => e.id == _model.opsBoardDropDownValue).toList().firstOrNull!.prompt!;
                                                                                                            });
                                                                                                            _model.tempPrompt2 = _model.opsPromptTextFieldTextController.text;
                                                                                                            safeSetState(() {});
                                                                                                          },
                                                                                                          width: 320.0,
                                                                                                          height: 40.0,
                                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                          hintText: 'Select Operations Board...',
                                                                                                          icon: Icon(
                                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          elevation: 2.0,
                                                                                                          borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          borderWidth: 0.0,
                                                                                                          borderRadius: 8.0,
                                                                                                          margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                          hidesUnderline: true,
                                                                                                          isOverButton: false,
                                                                                                          isSearchable: false,
                                                                                                          isMultiSelect: false,
                                                                                                        ),
                                                                                                      ),
                                                                                                      Builder(
                                                                                                        builder: (context) => Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                          child: FlutterFlowIconButton(
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                            icon: Icon(
                                                                                                              Icons.add,
                                                                                                              color: Colors.white,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              await showDialog(
                                                                                                                barrierDismissible: false,
                                                                                                                context: context,
                                                                                                                builder: (dialogContext) {
                                                                                                                  return Dialog(
                                                                                                                    elevation: 0,
                                                                                                                    insetPadding: EdgeInsets.zero,
                                                                                                                    backgroundColor: Colors.transparent,
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                    child: GestureDetector(
                                                                                                                      onTap: () {
                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                      },
                                                                                                                      child: OpsBoardManageWidget(
                                                                                                                        tenantid: FFAppState().session.tenantID,
                                                                                                                        opsID: -1,
                                                                                                                        newBoard: true,
                                                                                                                        tenantPrompt: FFAppState().session.tenantPrompt,
                                                                                                                        actionNew: (boardID) async {
                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (alertDialogContext) {
                                                                                                                              return AlertDialog(
                                                                                                                                title: Text('board id'),
                                                                                                                                content: Text(boardID!.toString()),
                                                                                                                                actions: [
                                                                                                                                  TextButton(
                                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                                    child: Text('Ok'),
                                                                                                                                  ),
                                                                                                                                ],
                                                                                                                              );
                                                                                                                            },
                                                                                                                          );
                                                                                                                          safeSetState(() {
                                                                                                                            _model.opsBoardDropDownValueController?.value = boardID!;
                                                                                                                            _model.opsBoardDropDownValue = boardID!;
                                                                                                                          });
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderRadius: 8.0,
                                                                                                          buttonSize: 40.0,
                                                                                                          fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                          icon: Icon(
                                                                                                            Icons.auto_awesome,
                                                                                                            color: Colors.white,
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            await showDialog(
                                                                                                              context: context,
                                                                                                              builder: (alertDialogContext) {
                                                                                                                return AlertDialog(
                                                                                                                  title: Text('Prompt Generator'),
                                                                                                                  content: Text('AI Prompt generator to help organisations quickly create effect prompts for the application...'),
                                                                                                                  actions: [
                                                                                                                    TextButton(
                                                                                                                      onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                      child: Text('Ok'),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                        if (_model.opsBoardDropDownValue != null)
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                            icon: Icon(
                                                                                                              Icons.clear,
                                                                                                              color: Colors.white,
                                                                                                              size: 24.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                    context: context,
                                                                                                                    builder: (alertDialogContext) {
                                                                                                                      return AlertDialog(
                                                                                                                        title: Text('Operations Board Prompt Clear'),
                                                                                                                        content: Text('Are you sure you want to clear this prompt?'),
                                                                                                                        actions: [
                                                                                                                          TextButton(
                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                            child: Text('No'),
                                                                                                                          ),
                                                                                                                          TextButton(
                                                                                                                            onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                            child: Text('Yes'),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ) ??
                                                                                                                  false;
                                                                                                              if (confirmDialogResponse) {
                                                                                                                safeSetState(() {
                                                                                                                  _model.opsPromptTextFieldTextController?.text = ' ';
                                                                                                                });
                                                                                                              }
                                                                                                            },
                                                                                                          ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Form(
                                                                                      key: _model.formKey2,
                                                                                      autovalidateMode: AutovalidateMode.disabled,
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(1.0, -1.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                                                                                          child: Container(
                                                                                            height: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                              border: Border.all(
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 4.0),
                                                                                              child: Container(
                                                                                                width: double.infinity,
                                                                                                child: TextFormField(
                                                                                                  controller: _model.opsPromptTextFieldTextController,
                                                                                                  focusNode: _model.opsPromptTextFieldFocusNode,
                                                                                                  autofocus: false,
                                                                                                  obscureText: false,
                                                                                                  decoration: InputDecoration(
                                                                                                    isDense: true,
                                                                                                    labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                    hintText: 'Enter your system prompt for this operations board, use the AI assistant above if you require help...',
                                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 14.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                        ),
                                                                                                    enabledBorder: InputBorder.none,
                                                                                                    focusedBorder: InputBorder.none,
                                                                                                    errorBorder: InputBorder.none,
                                                                                                    focusedErrorBorder: InputBorder.none,
                                                                                                    filled: true,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    contentPadding: EdgeInsets.all(8.0),
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                  maxLines: null,
                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                  validator: _model.opsPromptTextFieldTextControllerValidator.asValidator(context),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 16.0)),
                                                                              ),
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    safeSetState(() {
                                                                                      _model.opsPromptTextFieldTextController?.text = _model.tempPrompt2!;
                                                                                    });
                                                                                  },
                                                                                  text: 'Undo',
                                                                                  options: FFButtonOptions(
                                                                                    width: 80.0,
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                        ),
                                                                                    elevation: 0.0,
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                  child: FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      await OpsBoardTable().update(
                                                                                        data: {
                                                                                          'prompt': _model.opsPromptTextFieldTextController.text,
                                                                                        },
                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                          'id',
                                                                                          _model.opsBoardDropDownValue,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    text: 'Save',
                                                                                    options: FFButtonOptions(
                                                                                      width: 80.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                            fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                          ),
                                                                                      elevation: 0.0,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
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
                                                  );
                                                } else if (_model.tabID == 2) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Operations Boards',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 8.0, 0.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final opsBoardList = opsBoardDataOpsBoardRowList.toList();

                                                                                                return ListView.separated(
                                                                                                  padding: EdgeInsets.zero,
                                                                                                  scrollDirection: Axis.vertical,
                                                                                                  itemCount: opsBoardList.length,
                                                                                                  separatorBuilder: (_, __) => SizedBox(height: 4.0),
                                                                                                  itemBuilder: (context, opsBoardListIndex) {
                                                                                                    final opsBoardListItem = opsBoardList[opsBoardListIndex];
                                                                                                    return Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                      child: Container(
                                                                                                        width: double.infinity,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxWidth: 470.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: Colors.white,
                                                                                                          boxShadow: [
                                                                                                            BoxShadow(
                                                                                                              blurRadius: 0.0,
                                                                                                              color: Color(0xFFE0E3E7),
                                                                                                              offset: Offset(
                                                                                                                0.0,
                                                                                                                1.0,
                                                                                                              ),
                                                                                                            )
                                                                                                          ],
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(4.0, 8.0, 0.0, 8.0),
                                                                                                                child: Container(
                                                                                                                  width: 4.0,
                                                                                                                  height: 80.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: Color(0xFF4B39EF),
                                                                                                                    borderRadius: BorderRadius.circular(4.0),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 8.0),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                        children: [
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                                            child: Text(
                                                                                                                              opsBoardListItem.name,
                                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                                    ),
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            'Hello World',
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                                  ),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            child: Text(
                                                                                                                              'Task Description here this one is really long and it goes over maybe? And goes to two lines.',
                                                                                                                              style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    font: GoogleFonts.plusJakartaSans(
                                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    color: Color(0xFF57636C),
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                'Due',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                'Today, 5:30pm',
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
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
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  FlutterFlowIconButton(
                                                                                                                    borderRadius: 8.0,
                                                                                                                    buttonSize: 40.0,
                                                                                                                    hoverColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.edit_note,
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      size: 24.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      final _colorPickedColor = await showFFColorPicker(
                                                                                                                        context,
                                                                                                                        currentColor: _model.colorPicked ?? FlutterFlowTheme.of(context).primary,
                                                                                                                        showRecentColors: true,
                                                                                                                        allowOpacity: true,
                                                                                                                        textColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                        secondaryTextColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                        primaryButtonBackgroundColor: FlutterFlowTheme.of(context).primary,
                                                                                                                        primaryButtonTextColor: Colors.white,
                                                                                                                        primaryButtonBorderColor: Colors.transparent,
                                                                                                                        displayAsBottomSheet: isMobileWidth(context),
                                                                                                                      );

                                                                                                                      if (_colorPickedColor != null) {
                                                                                                                        safeSetState(() => _model.colorPicked = _colorPickedColor);
                                                                                                                      }
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'New',
                                                                                              options: FFButtonOptions(
                                                                                                width: 80.0,
                                                                                                height: 32.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Hello World',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.map_outlined,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Locations',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Enable',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValue1 ??= true,
                                                                                                    onChanged: (newValue) async {
                                                                                                      safeSetState(() => _model.checkboxValue1 = newValue!);
                                                                                                    },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Divider(
                                                                                      thickness: 2.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Hello World',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (_model.tabID == 3) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.map_outlined,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Locations',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          height: 360.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 10.0, 6.0),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        final setlocation = _model.treeData1b.map((e) => e).toList();

                                                                                                        return ListView.builder(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          primary: false,
                                                                                                          shrinkWrap: true,
                                                                                                          scrollDirection: Axis.vertical,
                                                                                                          itemCount: setlocation.length,
                                                                                                          itemBuilder: (context, setlocationIndex) {
                                                                                                            final setlocationItem = setlocation[setlocationIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                              child: Container(
                                                                                                                child: LocationTreeGeneralInlineWidget(
                                                                                                                  key: Key('Key9zg_${setlocationIndex}_of_${setlocation.length}'),
                                                                                                                  rowid: getJsonField(
                                                                                                                    setlocationItem,
                                                                                                                    r'''$.id''',
                                                                                                                  ),
                                                                                                                  rowdata: setlocationItem,
                                                                                                                ),
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
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Container(
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.pin_drop,
                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                        size: 20.0,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Location Node',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Divider(
                                                                                    thickness: 2.0,
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            if (FFAppState().selectedLocation !=
                                                                                0)
                                                                              Expanded(
                                                                                child: FutureBuilder<List<LocationRow>>(
                                                                                  future: LocationTable().querySingleRow(
                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                      'id',
                                                                                      FFAppState().selectedLocation,
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
                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                              FlutterFlowTheme.of(context).primary,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    }
                                                                                    List<LocationRow> containerLocationRowList = snapshot.data!;

                                                                                    final containerLocationRow = containerLocationRowList.isNotEmpty ? containerLocationRowList.first : null;

                                                                                    return Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 20.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Location ID',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerLocationRow?.path,
                                                                                                            'path',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Node',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            containerLocationRow?.name,
                                                                                                            'name',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Long Name',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerLocationRow?.longTerm,
                                                                                                              'long name',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Flexible(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Description',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 2,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              containerLocationRow?.description,
                                                                                                              'long name',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 20.0)),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (_model.tabID == 4) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        flex: 2,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 1.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              12.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.people,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Teams',
                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          height: 360.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Container(
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(20.0, 12.0, 10.0, 6.0),
                                                                                                    child: Builder(
                                                                                                      builder: (context) {
                                                                                                        final setteam = FFAppState().treeTeam.map((e) => e).toList();

                                                                                                        return ListView.builder(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          primary: false,
                                                                                                          shrinkWrap: true,
                                                                                                          scrollDirection: Axis.vertical,
                                                                                                          itemCount: setteam.length,
                                                                                                          itemBuilder: (context, setteamIndex) {
                                                                                                            final setteamItem = setteam[setteamIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                              child: Container(
                                                                                                                child: Column(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Builder(
                                                                                                                      builder: (context) => TeamTreeGeneralInlineWidget(
                                                                                                                        key: Key('Keyciu_${setteamIndex}_of_${setteam.length}'),
                                                                                                                        rowid: getJsonField(
                                                                                                                          setteamItem,
                                                                                                                          r'''$.id''',
                                                                                                                        ),
                                                                                                                        rowdata: setteamItem,
                                                                                                                        updateCall: (nodeID, updateNeeded, operation) async {
                                                                                                                          FFAppState().selectedTeam = nodeID!;
                                                                                                                          _model.teamEdit = false;
                                                                                                                          safeSetState(() {});
                                                                                                                          if (operation == 0) {
                                                                                                                          } else if (operation == 1) {
                                                                                                                            await showDialog(
                                                                                                                              context: context,
                                                                                                                              builder: (dialogContext) {
                                                                                                                                return Dialog(
                                                                                                                                  elevation: 0,
                                                                                                                                  insetPadding: EdgeInsets.zero,
                                                                                                                                  backgroundColor: Colors.transparent,
                                                                                                                                  alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                  child: GestureDetector(
                                                                                                                                    onTap: () {
                                                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                    },
                                                                                                                                    child: NewTeamNodeWidget(
                                                                                                                                      newNodeID: nodeID,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                );
                                                                                                                              },
                                                                                                                            );
                                                                                                                          } else if (operation == 2) {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return AlertDialog(
                                                                                                                                      title: Text('Delete Node!'),
                                                                                                                                      content: Text('node. This is irreversible.'),
                                                                                                                                      actions: [
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                                          child: Text('Cancel'),
                                                                                                                                        ),
                                                                                                                                        TextButton(
                                                                                                                                          onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                                          child: Text('Confirm'),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ) ??
                                                                                                                                false;
                                                                                                                            if (confirmDialogResponse) {
                                                                                                                              await TeamTable().delete(
                                                                                                                                matchingRows: (rows) => rows.eqOrNull(
                                                                                                                                  'id',
                                                                                                                                  nodeID,
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }
                                                                                                                          }

                                                                                                                          if (updateNeeded == true) {
                                                                                                                            // Action 3 Clear treeTeam App State Var
                                                                                                                            FFAppState().treeTeam = [];
                                                                                                                            await Future.delayed(
                                                                                                                              Duration(
                                                                                                                                milliseconds: 40,
                                                                                                                              ),
                                                                                                                            );
                                                                                                                            FFAppState().treeTeam = _model.treedata2.toList().cast<dynamic>();
                                                                                                                          }
                                                                                                                          safeSetState(() {});

                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
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
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 3,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            TeamRow>>(
                                                                      future: TeamTable()
                                                                          .querySingleRow(
                                                                        queryFn:
                                                                            (q) =>
                                                                                q.eqOrNull(
                                                                          'id',
                                                                          FFAppState()
                                                                              .selectedTeam,
                                                                        ),
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 40.0,
                                                                              height: 40.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<TeamRow>
                                                                            locationContainerTeamRowList =
                                                                            snapshot.data!;

                                                                        final locationContainerTeamRow = locationContainerTeamRowList.isNotEmpty
                                                                            ? locationContainerTeamRowList.first
                                                                            : null;

                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 3.0,
                                                                                color: Color(0x33000000),
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  1.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              FutureBuilder<List<UsersRow>>(
                                                                            future:
                                                                                UsersTable().querySingleRow(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'id',
                                                                                locationContainerTeamRow?.teamLead,
                                                                              ),
                                                                            ),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 40.0,
                                                                                    height: 40.0,
                                                                                    child: CircularProgressIndicator(
                                                                                      valueColor: AlwaysStoppedAnimation<Color>(
                                                                                        FlutterFlowTheme.of(context).primary,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<UsersRow> userContainerUsersRowList = snapshot.data!;

                                                                              final userContainerUsersRow = userContainerUsersRowList.isNotEmpty ? userContainerUsersRowList.first : null;

                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 24.0, 72.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Icon(
                                                                                                  Icons.person,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 20.0,
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Team Node',
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                          ),
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Divider(
                                                                                              thickness: 2.0,
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      if (!_model.teamEdit!)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 72.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Path',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                locationContainerTeamRow?.path,
                                                                                                                'path',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Long Name',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  locationContainerTeamRow?.longTerm,
                                                                                                                  'longName',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 16.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 2.0,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Team Prompt',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        font: GoogleFonts.inter(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          flex: 3,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    locationContainerTeamRow?.prompt,
                                                                                                                    'Prompt',
                                                                                                                  ),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        font: GoogleFonts.robotoMono(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        fontSize: 16.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 2.0,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Team Contact',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 400.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              userContainerUsersRow?.displayName,
                                                                                                                              'display',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Channel',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 400.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              locationContainerTeamRow?.channelType?.toString(),
                                                                                                                              'Type',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Channel Path',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            FutureBuilder<List<UsersRow>>(
                                                                                                              future: UsersTable().querySingleRow(
                                                                                                                queryFn: (q) => q.eqOrNull(
                                                                                                                  'id',
                                                                                                                  locationContainerTeamRow?.teamLead,
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
                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                List<UsersRow> containerUsersRowList = snapshot.data!;

                                                                                                                final containerUsersRow = containerUsersRowList.isNotEmpty ? containerUsersRowList.first : null;

                                                                                                                return Container(
                                                                                                                  width: 400.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Text(
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  locationContainerTeamRow?.path,
                                                                                                                                  'path',
                                                                                                                                ),
                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      fontSize: 16.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 20.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      if (_model.teamEdit ?? true)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 72.0),
                                                                                          child: Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(40.0, 40.0, 0.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Path',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                locationContainerTeamRow?.path,
                                                                                                                'path',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Long Name',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 300.0,
                                                                                                              child: TextFormField(
                                                                                                                controller: _model.textEditlongnameTextController ??= TextEditingController(
                                                                                                                  text: locationContainerTeamRow?.longTerm,
                                                                                                                ),
                                                                                                                focusNode: _model.textEditlongnameFocusNode,
                                                                                                                onChanged: (_) => EasyDebounce.debounce(
                                                                                                                  '_model.textEditlongnameTextController',
                                                                                                                  Duration(milliseconds: 2000),
                                                                                                                  () => safeSetState(() {}),
                                                                                                                ),
                                                                                                                autofocus: false,
                                                                                                                enabled: true,
                                                                                                                obscureText: false,
                                                                                                                decoration: InputDecoration(
                                                                                                                  isDense: true,
                                                                                                                  labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        font: GoogleFonts.inter(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        fontSize: 16.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                        font: GoogleFonts.inter(
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                        ),
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                      ),
                                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Color(0x00000000),
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                  ),
                                                                                                                  filled: true,
                                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  suffixIcon: _model.textEditlongnameTextController!.text.isNotEmpty
                                                                                                                      ? InkWell(
                                                                                                                          onTap: () async {
                                                                                                                            _model.textEditlongnameTextController?.clear();
                                                                                                                            safeSetState(() {});
                                                                                                                          },
                                                                                                                          child: Icon(
                                                                                                                            Icons.clear,
                                                                                                                            size: 22,
                                                                                                                          ),
                                                                                                                        )
                                                                                                                      : null,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                enableInteractiveSelection: true,
                                                                                                                validator: _model.textEditlongnameTextControllerValidator.asValidator(context),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Divider(
                                                                                                    thickness: 2.0,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Team Prompt',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Flexible(
                                                                                                          flex: 3,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                                  child: Container(
                                                                                                                    width: 400.0,
                                                                                                                    child: TextFormField(
                                                                                                                      controller: _model.textFieldPromptTextController,
                                                                                                                      focusNode: _model.textFieldPromptFocusNode,
                                                                                                                      onChanged: (_) => EasyDebounce.debounce(
                                                                                                                        '_model.textFieldPromptTextController',
                                                                                                                        Duration(milliseconds: 2000),
                                                                                                                        () => safeSetState(() {}),
                                                                                                                      ),
                                                                                                                      autofocus: false,
                                                                                                                      enabled: true,
                                                                                                                      obscureText: false,
                                                                                                                      decoration: InputDecoration(
                                                                                                                        isDense: true,
                                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        focusedBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        errorBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                                                          borderSide: BorderSide(
                                                                                                                            color: FlutterFlowTheme.of(context).error,
                                                                                                                            width: 1.0,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                        ),
                                                                                                                        filled: true,
                                                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        suffixIcon: _model.textFieldPromptTextController!.text.isNotEmpty
                                                                                                                            ? InkWell(
                                                                                                                                onTap: () async {
                                                                                                                                  _model.textFieldPromptTextController?.clear();
                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                child: Icon(
                                                                                                                                  Icons.clear,
                                                                                                                                  size: 22,
                                                                                                                                ),
                                                                                                                              )
                                                                                                                            : null,
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                          ),
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      maxLines: 12,
                                                                                                                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      enableInteractiveSelection: true,
                                                                                                                      validator: _model.textFieldPromptTextControllerValidator.asValidator(context),
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
                                                                                                  Divider(
                                                                                                    thickness: 2.0,
                                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Team Contact',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            FutureBuilder<List<UserTenantViewRow>>(
                                                                                                              future: UserTenantViewTable().queryRows(
                                                                                                                queryFn: (q) => q
                                                                                                                    .eqOrNull(
                                                                                                                      'tenant_id',
                                                                                                                      FFAppState().session.tenantID,
                                                                                                                    )
                                                                                                                    .order('compoundname', ascending: true),
                                                                                                              ),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 40.0,
                                                                                                                      height: 40.0,
                                                                                                                      child: CircularProgressIndicator(
                                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                          FlutterFlowTheme.of(context).primary,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                List<UserTenantViewRow> containerUserTenantViewRowList = snapshot.data!;

                                                                                                                return Container(
                                                                                                                  width: 400.0,
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        child: Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 1.0, 1.0),
                                                                                                                                child: FlutterFlowDropDown<String>(
                                                                                                                                  controller: _model.dropDownValueController2 ??= FormFieldController<String>(null),
                                                                                                                                  options: containerUserTenantViewRowList.map((e) => e.compoundname).withoutNulls.toList(),
                                                                                                                                  onChanged: (val) => safeSetState(() => _model.dropDownValue2 = val),
                                                                                                                                  height: 40.0,
                                                                                                                                  textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                        font: GoogleFonts.inter(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                        ),
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                  hintText: 'Select...',
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.keyboard_arrow_down_rounded,
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    size: 24.0,
                                                                                                                                  ),
                                                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  elevation: 2.0,
                                                                                                                                  borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  borderWidth: 0.0,
                                                                                                                                  borderRadius: 8.0,
                                                                                                                                  margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                                  hidesUnderline: true,
                                                                                                                                  isOverButton: false,
                                                                                                                                  isSearchable: false,
                                                                                                                                  isMultiSelect: false,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Channel',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 400.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              locationContainerTeamRow?.channelType?.toString(),
                                                                                                                              'Type',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Flexible(
                                                                                                        flex: 1,
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                'Channel Path',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Flexible(
                                                                                                        flex: 3,
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 400.0,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          Text(
                                                                                                                            valueOrDefault<String>(
                                                                                                                              locationContainerTeamRow?.path,
                                                                                                                              'path',
                                                                                                                            ),
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 20.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                                                        children: [
                                                                                          if (!_model.teamEdit!)
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                FFButtonWidget(
                                                                                                  onPressed: () async {
                                                                                                    _model.teamEdit = !(_model.teamEdit ?? true);
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  text: 'Edit',
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 40.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          if (_model.teamEdit ?? true)
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                  child: FFButtonWidget(
                                                                                                    onPressed: () async {
                                                                                                      _model.teamEdit = false;
                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                    text: 'Cancel',
                                                                                                    options: FFButtonOptions(
                                                                                                      height: 40.0,
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            font: GoogleFonts.inter(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                            ),
                                                                                                            color: Colors.white,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                          ),
                                                                                                      elevation: 0.0,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                FFButtonWidget(
                                                                                                  onPressed: () {
                                                                                                    print('Button pressed ...');
                                                                                                  },
                                                                                                  text: 'Save',
                                                                                                  options: FFButtonOptions(
                                                                                                    height: 40.0,
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                          ),
                                                                                                          color: Colors.white,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                        ),
                                                                                                    elevation: 0.0,
                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (_model.tabID == 5) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      4.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 3.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                1.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              8.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'Roles',
                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Divider(
                                                                                        thickness: 2.0,
                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'New',
                                                                                              options: FFButtonOptions(
                                                                                                width: 80.0,
                                                                                                height: 32.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                                textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelLarge.fontStyle,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 16.0)).around(SizedBox(width: 16.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Flexible(
                                                                                flex: 1,
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Hello World',
                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      10.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.map_outlined,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 20.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Locations',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Enable',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValue2 ??= true,
                                                                                                    onChanged: (newValue) async {
                                                                                                      safeSetState(() => _model.checkboxValue2 = newValue!);
                                                                                                    },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Divider(
                                                                                      thickness: 2.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Hello World',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Flexible(
                                                        flex: 1,
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      4.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          16.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Flexible(
                                                                    flex: 1,
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                3.0,
                                                                            color:
                                                                                Color(0x33000000),
                                                                            offset:
                                                                                Offset(
                                                                              0.0,
                                                                              1.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            8.0,
                                                                            12.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.people_sharp,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Teams',
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                        ),
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Enable',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                                child: Theme(
                                                                                                  data: ThemeData(
                                                                                                    checkboxTheme: CheckboxThemeData(
                                                                                                      visualDensity: VisualDensity.compact,
                                                                                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                                      shape: RoundedRectangleBorder(
                                                                                                        borderRadius: BorderRadius.circular(4.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                                                  ),
                                                                                                  child: Checkbox(
                                                                                                    value: _model.checkboxValue3 ??= true,
                                                                                                    onChanged: (newValue) async {
                                                                                                      safeSetState(() => _model.checkboxValue3 = newValue!);
                                                                                                    },
                                                                                                    side: (FlutterFlowTheme.of(context).alternate != null)
                                                                                                        ? BorderSide(
                                                                                                            width: 2,
                                                                                                            color: FlutterFlowTheme.of(context).alternate,
                                                                                                          )
                                                                                                        : null,
                                                                                                    activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                    checkColor: FlutterFlowTheme.of(context).info,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Divider(
                                                                                      thickness: 2.0,
                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Flexible(
                                                                              flex: 1,
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 24.0, 0.0, 0.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Hello World',
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              font: GoogleFonts.inter(
                                                                                                fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
                                                                                              ),
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).titleMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).titleMedium.fontStyle,
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
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        24.0)),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Unknown Error',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                        Text(
                                                          'Invalid toolbar option detected',
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
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      24.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Error code : 100001',
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
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
            ),
          ),
        );
      },
    );
  }
}
