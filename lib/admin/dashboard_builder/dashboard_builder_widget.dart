import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/new_dashboard/new_dashboard_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'dashboard_builder_model.dart';
export 'dashboard_builder_model.dart';

class DashboardBuilderWidget extends StatefulWidget {
  const DashboardBuilderWidget({super.key});

  static String routeName = 'dashboardBuilder';
  static String routePath = '/dashboardBuilder';

  @override
  State<DashboardBuilderWidget> createState() => _DashboardBuilderWidgetState();
}

class _DashboardBuilderWidgetState extends State<DashboardBuilderWidget>
    with TickerProviderStateMixin {
  late DashboardBuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardBuilderModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.chatSessionID = 'none';
      _model.showChat = false;
      _model.tenantID = FFAppState().session.tenantID;
      _model.configType = null;
      _model.undoAvailable = false;
      _model.redoAvailable = false;
      _model.isPublished = true;
      _model.cardUIURL =
          'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/saas-template-re3nsj/assets/y3fke4ozjagm/select.png';
      _model.aiUpdates = ' ';
      _model.animationShow = false;
      _model.cardStatus = -1;
      _model.viewUsage = false;
      _model.viewThreshold = 5;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        loop: true,
        reverse: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 52.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFB6B9BE),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 10.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    'assets/images/soliis_logo_transparent_32x32.png',
                                    width: 32.0,
                                    height: 32.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                'Admin centre: ${FFAppState().session.tenantName}',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 5.0, 0.0, 0.0),
                            child: wrapWithModel(
                              model: _model.supportmenuModel,
                              updateCallback: () => safeSetState(() {}),
                              child: SupportmenuWidget(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.sideNavModel,
                        updateCallback: () => safeSetState(() {}),
                        child: SideNavWidget(
                          selectedNav: 30,
                          contentWarning: false,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 12.0, 12.0, 6.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FutureBuilder<List<OpsBoardRow>>(
                                  future: OpsBoardTable().queryRows(
                                    queryFn: (q) => q.eqOrNull(
                                      'tenant_id',
                                      _model.tenantID,
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
                                    List<OpsBoardRow>
                                        containerHeaderOpsBoardRowList =
                                        snapshot.data!;

                                    return Container(
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 12.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 660.0,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Flexible(
                                                              flex: 1,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Dashboard: ',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleSmall
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                            ),
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Flexible(
                                                              flex: 4,
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  FlutterFlowDropDown<
                                                                      int>(
                                                                    controller: _model
                                                                            .dropDownOpsValueController ??=
                                                                        FormFieldController<
                                                                            int>(
                                                                      _model.dropDownOpsValue ??=
                                                                          null,
                                                                    ),
                                                                    options: List<int>.from(containerHeaderOpsBoardRowList
                                                                        .map((e) =>
                                                                            e.id)
                                                                        .toList()),
                                                                    optionLabels: containerHeaderOpsBoardRowList
                                                                        .map((e) =>
                                                                            e.name)
                                                                        .toList(),
                                                                    onChanged:
                                                                        (val) async {
                                                                      safeSetState(() =>
                                                                          _model.dropDownOpsValue =
                                                                              val);
                                                                      if ((_model.isPublished ==
                                                                              false) &&
                                                                          _model
                                                                              .showChat!) {
                                                                        var confirmDialogResponse = await showDialog<bool>(
                                                                              context: context,
                                                                              builder: (alertDialogContext) {
                                                                                return AlertDialog(
                                                                                  title: Text('WARNING'),
                                                                                  content: Text('You have unpublished changes. Starting a new session will lose your current work. Continue?'),
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
                                                                          _model.showChat =
                                                                              false;
                                                                          _model.blueprintSections =
                                                                              [];
                                                                          _model.isPublished =
                                                                              false;
                                                                          _model.actionCase =
                                                                              0;
                                                                          _model.configType =
                                                                              null;
                                                                          _model.chatSessionID =
                                                                              'none';
                                                                          _model.undoAvailable =
                                                                              false;
                                                                          _model.redoAvailable =
                                                                              false;
                                                                          _model.chatPrompt1 =
                                                                              null;
                                                                          _model.chatPrompt2 =
                                                                              null;
                                                                          safeSetState(
                                                                              () {});
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      }
                                                                      _model.boardID =
                                                                          _model
                                                                              .dropDownOpsValue;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    width:
                                                                        320.0,
                                                                    height:
                                                                        40.0,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.inter(
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                    hintText:
                                                                        'Select Dashboard...',
                                                                    icon: Icon(
                                                                      Icons
                                                                          .keyboard_arrow_down_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    elevation:
                                                                        2.0,
                                                                    borderColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .alternate,
                                                                    borderWidth:
                                                                        0.0,
                                                                    borderRadius:
                                                                        8.0,
                                                                    margin: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    hidesUnderline:
                                                                        true,
                                                                    isOverButton:
                                                                        false,
                                                                    isSearchable:
                                                                        false,
                                                                    isMultiSelect:
                                                                        false,
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      AlignedTooltip(
                                                                        content:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(4.0),
                                                                          child:
                                                                              Text(
                                                                            'Click to add a new dashboard...',
                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                  font: GoogleFonts.inter(
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                  ),
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        offset:
                                                                            4.0,
                                                                        preferredDirection:
                                                                            AxisDirection.down,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        elevation:
                                                                            4.0,
                                                                        tailBaseWidth:
                                                                            24.0,
                                                                        tailLength:
                                                                            12.0,
                                                                        waitDuration:
                                                                            Duration(milliseconds: 100),
                                                                        showDuration:
                                                                            Duration(milliseconds: 100),
                                                                        triggerMode:
                                                                            TooltipTriggerMode.tap,
                                                                        child:
                                                                            Builder(
                                                                          builder: (context) =>
                                                                              FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                48.0,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.add_circle_outline,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 30.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              var _shouldSetState = false;
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
                                                                                      child: Container(
                                                                                        height: 400.0,
                                                                                        width: 600.0,
                                                                                        child: NewDashboardWidget(
                                                                                          execute: (boardname, boarddesciption) async {
                                                                                            _model.boardUiName = boardname;
                                                                                            _model.boardPrompt = boarddesciption;
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ).then((value) => safeSetState(() => _model.dlgResponse = value));

                                                                              _shouldSetState = true;
                                                                              if (_model.dlgResponse!) {
                                                                                _model.configType = 'btc';
                                                                                _model.chatSessionID = functions.createUuid();
                                                                                _model.chatPrompt1 = 'You want to create a new Dashboard?';
                                                                                _model.chatPrompt2 = 'Please describe the role of the Dashboard, what sort of information will be posted to it...';
                                                                                safeSetState(() {});
                                                                                _model.chatInit1 = await InitChatSessionCall.call(
                                                                                  pConfigType: 'btc',
                                                                                  pSourceSchemaId: null,
                                                                                  pSessionId: _model.chatSessionID,
                                                                                  pTenantId: _model.tenantID,
                                                                                  token: FFAppState().supabaseAuthToken,
                                                                                  supabaseKey: FFDevEnvironmentValues().supabaseAnonKey,
                                                                                );

                                                                                _shouldSetState = true;
                                                                                if ((_model.chatInit1?.succeeded ?? true)) {
                                                                                  _model.showChat = true;
                                                                                  _model.actionCase = 1;
                                                                                  _model.isPublished = true;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  await showDialog(
                                                                                    context: context,
                                                                                    builder: (alertDialogContext) {
                                                                                      return AlertDialog(
                                                                                        title: Text('AI Error'),
                                                                                        content: Text('The initialisation of the AI system has not succeeded'),
                                                                                        actions: [
                                                                                          TextButton(
                                                                                            onPressed: () => Navigator.pop(alertDialogContext),
                                                                                            child: Text('Ok'),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                  if (_shouldSetState) safeSetState(() {});
                                                                                  return;
                                                                                }
                                                                              }
                                                                              if (_shouldSetState)
                                                                                safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      if (_model
                                                                              .dropDownOpsValue !=
                                                                          null)
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            AlignedTooltip(
                                                                              content: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Text(
                                                                                  'Edit dashboard configuration...',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              offset: 4.0,
                                                                              preferredDirection: AxisDirection.down,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 4.0,
                                                                              tailBaseWidth: 24.0,
                                                                              tailLength: 12.0,
                                                                              waitDuration: Duration(milliseconds: 100),
                                                                              showDuration: Duration(milliseconds: 100),
                                                                              triggerMode: TooltipTriggerMode.tap,
                                                                              child: FlutterFlowIconButton(
                                                                                borderRadius: 8.0,
                                                                                buttonSize: 48.0,
                                                                                icon: Icon(
                                                                                  Icons.mode_edit_outlined,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () async {
                                                                                  _model.configType = 'btc';
                                                                                  _model.chatSessionID = functions.createUuid();
                                                                                  _model.chatPrompt1 = 'You want to edit theis dashboard...';
                                                                                  _model.chatPrompt2 = 'Outline the changes you want to make, if you just want to review the dashboard, type \'review dashboard\'';
                                                                                  _model.animationShow = false;
                                                                                  _model.aiUpdates = 'Selected: edit board';
                                                                                  safeSetState(() {});
                                                                                  _model.getBTCid = await OpsBoardTable().queryRows(
                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                      'id',
                                                                                      _model.dropDownOpsValue,
                                                                                    ),
                                                                                  );
                                                                                  _model.chatInit2 = await InitChatSessionCall.call(
                                                                                    pConfigType: 'btc',
                                                                                    pSourceSchemaId: _model.getBTCid?.firstOrNull?.bTCId,
                                                                                    pSessionId: _model.chatSessionID,
                                                                                    pTenantId: _model.tenantID,
                                                                                    token: FFAppState().supabaseAuthToken,
                                                                                    supabaseKey: FFDevEnvironmentValues().supabaseAnonKey,
                                                                                  );

                                                                                  if ((_model.chatInit2?.succeeded ?? true)) {
                                                                                    _model.showChat = false;
                                                                                    _model.actionCase = 2;
                                                                                    _model.isPublished = false;
                                                                                    safeSetState(() {});
                                                                                    _model.aiUpdates = 'Extract and render human readable configuration';
                                                                                    _model.animationShow = true;
                                                                                    safeSetState(() {});
                                                                                    await actions.sendCommand(
                                                                                      'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                      '/render',
                                                                                      _model.chatSessionID!,
                                                                                      _model.tenantID!,
                                                                                      '',
                                                                                      currentUserEmail,
                                                                                      _model.boardID,
                                                                                      _model.cardID,
                                                                                    );
                                                                                    _model.aiUpdates = 'Update interface';
                                                                                    safeSetState(() {});
                                                                                    _model.renderCase2 = await BuilderUiStateTable().queryRows(
                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                        'session_id',
                                                                                        _model.chatSessionID,
                                                                                      ),
                                                                                    );
                                                                                    _model.blueprintSections = _model.renderCase2!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                    _model.progressSummary = _model.renderCase2?.firstOrNull?.progressSummary;
                                                                                    _model.undoAvailable = _model.renderCase2?.firstOrNull?.undoAvailable;
                                                                                    _model.redoAvailable = _model.renderCase2?.firstOrNull?.redoAvailable;
                                                                                    _model.showChat = true;
                                                                                    _model.aiUpdates = 'Ready';
                                                                                    safeSetState(() {});
                                                                                    await Future.delayed(
                                                                                      Duration(
                                                                                        milliseconds: 500,
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    await showDialog(
                                                                                      context: context,
                                                                                      builder: (alertDialogContext) {
                                                                                        return AlertDialog(
                                                                                          title: Text('AI Error'),
                                                                                          content: Text('The initialisation of the AI system has not succeeded'),
                                                                                          actions: [
                                                                                            TextButton(
                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                              child: Text('Ok'),
                                                                                            ),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  }

                                                                                  safeSetState(() {});
                                                                                },
                                                                              ),
                                                                            ),
                                                                            AlignedTooltip(
                                                                              content: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Text(
                                                                                  'Delete dashboard...',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              offset: 4.0,
                                                                              preferredDirection: AxisDirection.down,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 4.0,
                                                                              tailBaseWidth: 24.0,
                                                                              tailLength: 12.0,
                                                                              waitDuration: Duration(milliseconds: 100),
                                                                              showDuration: Duration(milliseconds: 100),
                                                                              triggerMode: TooltipTriggerMode.tap,
                                                                              child: FlutterFlowIconButton(
                                                                                borderRadius: 8.0,
                                                                                buttonSize: 48.0,
                                                                                icon: Icon(
                                                                                  Icons.delete_outline,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () {
                                                                                  print('IconButton pressed ...');
                                                                                },
                                                                              ),
                                                                            ),
                                                                            AlignedTooltip(
                                                                              content: Padding(
                                                                                padding: EdgeInsets.all(4.0),
                                                                                child: Text(
                                                                                  ' Click for dashboard setup information...',
                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                        font: GoogleFonts.inter(
                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                        ),
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              offset: 4.0,
                                                                              preferredDirection: AxisDirection.down,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 4.0,
                                                                              tailBaseWidth: 24.0,
                                                                              tailLength: 12.0,
                                                                              waitDuration: Duration(milliseconds: 100),
                                                                              showDuration: Duration(milliseconds: 100),
                                                                              triggerMode: TooltipTriggerMode.tap,
                                                                              child: FlutterFlowIconButton(
                                                                                borderRadius: 8.0,
                                                                                buttonSize: 48.0,
                                                                                icon: Icon(
                                                                                  Icons.info_outline,
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  size: 30.0,
                                                                                ),
                                                                                onPressed: () {
                                                                                  print('IconButton pressed ...');
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        6.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  thickness: 1.0,
                                  color: FlutterFlowTheme.of(context).alternate,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        if (_model.showChat ?? true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 10.0, 0.0, 10.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Container(
                                                            height: 100.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                if (_model
                                                                        .chatSessionID !=
                                                                    'none')
                                                                  Expanded(
                                                                    child:
                                                                        AuthUserStreamWidget(
                                                                      builder:
                                                                          (context) =>
                                                                              Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        child: custom_widgets
                                                                            .N8nChatUiWidget2(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              double.infinity,
                                                                          webhookUrl:
                                                                              'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                          cacheUrl:
                                                                              'https://soliis.app.n8n.cloud/webhook/1c677817-273d-4fc0-ab24-5df9c7082316/cacheUrl/v1',
                                                                          userName:
                                                                              currentUserDisplayName,
                                                                          userEmail:
                                                                              currentUserEmail,
                                                                          chatName:
                                                                              'Soliis App Builder',
                                                                          profileImageUrl:
                                                                              'www.test,png',
                                                                          title:
                                                                              _model.chatPrompt1,
                                                                          subtitle:
                                                                              _model.chatPrompt2,
                                                                          enableAudio:
                                                                              false,
                                                                          enableImage:
                                                                              false,
                                                                          waitForResponse:
                                                                              true,
                                                                          showHeader:
                                                                              false,
                                                                          backgroundChatUser:
                                                                              '#E8DDD3',
                                                                          textColor:
                                                                              '#374151',
                                                                          customDataJson: functions.buildCustomDataJson(
                                                                              _model.reportType,
                                                                              _model.cardTypeName,
                                                                              _model.cardPrompt,
                                                                              _model.cardUiName,
                                                                              _model.boardUiName,
                                                                              _model.boardPrompt),
                                                                          sessionId:
                                                                              _model.chatSessionID,
                                                                          tenantId:
                                                                              _model.tenantID,
                                                                          boardId:
                                                                              _model.boardID,
                                                                          cardId:
                                                                              _model.cardID,
                                                                          onMessageSentAction:
                                                                              (content) async {},
                                                                          onMessageReceivedAction:
                                                                              (content) async {
                                                                            _model.blueprintState =
                                                                                await BuilderUiStateTable().queryRows(
                                                                              queryFn: (q) => q.eqOrNull(
                                                                                'session_id',
                                                                                _model.chatSessionID,
                                                                              ),
                                                                            );
                                                                            _model.blueprintSections =
                                                                                _model.blueprintState!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                            _model.progressSummary =
                                                                                _model.blueprintState?.firstOrNull?.progressSummary;
                                                                            _model.undoAvailable =
                                                                                _model.blueprintState?.firstOrNull?.undoAvailable;
                                                                            _model.redoAvailable =
                                                                                _model.blueprintState?.firstOrNull?.redoAvailable;
                                                                            _model.cardUiName =
                                                                                getJsonField(
                                                                              _model.blueprintState?.firstOrNull?.blueprint,
                                                                              r'''$[0].items[0].value''',
                                                                            ).toString();
                                                                            _model.cardUIDescrition =
                                                                                getJsonField(
                                                                              _model.blueprintState?.firstOrNull?.blueprint,
                                                                              r'''$[0].items[1].value''',
                                                                            ).toString();
                                                                            safeSetState(() {});
                                                                            if (functions.checkIsPublished(getJsonField(
                                                                                  _model.blueprintState!.firstOrNull!.blueprint,
                                                                                  r'''$.metadata.is_published''',
                                                                                )) ==
                                                                                true) {
                                                                              _model.isPublished = true;
                                                                              safeSetState(() {});
                                                                            }

                                                                            safeSetState(() {});
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
                                                VerticalDivider(
                                                  thickness: 2.0,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                                Flexible(
                                                  flex: 1,
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.5,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  6.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        8.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  'Summary',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .fontStyle,
                                                                        ),
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .fontStyle,
                                                                      ),
                                                                ),
                                                                if (false)
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        'View: ',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              font: GoogleFonts.inter(
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                      ),
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              6.0,
                                                                              8.0,
                                                                              12.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                width: 1.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: [
                                                                                Container(
                                                                                  width: 48.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    border: Border.all(
                                                                                      color: Color(0xFFE0E3E7),
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                        child: Icon(
                                                                                          Icons.remove_red_eye_outlined,
                                                                                          size: 24.0,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 48.0,
                                                                                    height: 40.0,
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        width: 0.0,
                                                                                      ),
                                                                                    ),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Text(
                                                                                            '</>',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
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
                                                                    ],
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Progress:',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          _model
                                                                              .progressSummary,
                                                                          '<begin>',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
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
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                24.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    AlignedTooltip(
                                                                                      content: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Text(
                                                                                          'Undo..',
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      offset: 4.0,
                                                                                      preferredDirection: AxisDirection.down,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 4.0,
                                                                                      tailBaseWidth: 24.0,
                                                                                      tailLength: 12.0,
                                                                                      waitDuration: Duration(milliseconds: 100),
                                                                                      showDuration: Duration(milliseconds: 100),
                                                                                      triggerMode: TooltipTriggerMode.tap,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            icon: Icon(
                                                                                              Icons.undo,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              print('IconButton pressed ...');
                                                                                            },
                                                                                          ),
                                                                                          if (_model.undoAvailable! && _model.showChat!)
                                                                                            FlutterFlowIconButton(
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 40.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              icon: Icon(
                                                                                                Icons.undo,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                await actions.sendCommand(
                                                                                                  'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                                  '/undo',
                                                                                                  _model.chatSessionID!,
                                                                                                  _model.tenantID!,
                                                                                                  '',
                                                                                                  currentUserEmail,
                                                                                                  _model.boardID,
                                                                                                  _model.cardID,
                                                                                                );
                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 1000,
                                                                                                  ),
                                                                                                );
                                                                                                _model.undoAction = await BuilderUiStateTable().queryRows(
                                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                                    'session_id',
                                                                                                    _model.chatSessionID,
                                                                                                  ),
                                                                                                );
                                                                                                _model.blueprintSections = _model.undoAction!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                                _model.progressSummary = _model.undoAction?.firstOrNull?.progressSummary;
                                                                                                _model.undoAvailable = _model.undoAction?.firstOrNull?.undoAvailable;
                                                                                                _model.redoAvailable = _model.undoAction?.firstOrNull?.redoAvailable;
                                                                                                safeSetState(() {});
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Action'),
                                                                                                      content: Text('Undo action processed'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                );

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    AlignedTooltip(
                                                                                      content: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Text(
                                                                                          'Redo...',
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      offset: 4.0,
                                                                                      preferredDirection: AxisDirection.down,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 4.0,
                                                                                      tailBaseWidth: 24.0,
                                                                                      tailLength: 12.0,
                                                                                      waitDuration: Duration(milliseconds: 100),
                                                                                      showDuration: Duration(milliseconds: 100),
                                                                                      triggerMode: TooltipTriggerMode.tap,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            icon: Icon(
                                                                                              Icons.redo,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              print('IconButton pressed ...');
                                                                                            },
                                                                                          ),
                                                                                          if (_model.redoAvailable! && _model.showChat!)
                                                                                            FlutterFlowIconButton(
                                                                                              borderRadius: 8.0,
                                                                                              buttonSize: 40.0,
                                                                                              fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                              icon: Icon(
                                                                                                Icons.redo,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 24.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                await actions.sendCommand(
                                                                                                  'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                                  '/redo',
                                                                                                  _model.chatSessionID!,
                                                                                                  _model.tenantID!,
                                                                                                  '',
                                                                                                  currentUserEmail,
                                                                                                  _model.boardID,
                                                                                                  _model.cardID,
                                                                                                );
                                                                                                await Future.delayed(
                                                                                                  Duration(
                                                                                                    milliseconds: 1000,
                                                                                                  ),
                                                                                                );
                                                                                                _model.redoAction = await BuilderUiStateTable().queryRows(
                                                                                                  queryFn: (q) => q.eqOrNull(
                                                                                                    'session_id',
                                                                                                    _model.chatSessionID,
                                                                                                  ),
                                                                                                );
                                                                                                _model.blueprintSections = _model.redoAction!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                                _model.progressSummary = _model.redoAction?.firstOrNull?.progressSummary;
                                                                                                _model.undoAvailable = _model.redoAction?.firstOrNull?.undoAvailable;
                                                                                                _model.redoAvailable = _model.redoAction?.firstOrNull?.redoAvailable;
                                                                                                safeSetState(() {});
                                                                                                await showDialog(
                                                                                                  context: context,
                                                                                                  builder: (alertDialogContext) {
                                                                                                    return AlertDialog(
                                                                                                      title: Text('Action'),
                                                                                                      content: Text('redo action processed'),
                                                                                                      actions: [
                                                                                                        TextButton(
                                                                                                          onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                          child: Text('Ok'),
                                                                                                        ),
                                                                                                      ],
                                                                                                    );
                                                                                                  },
                                                                                                );

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    AlignedTooltip(
                                                                                      content: Padding(
                                                                                        padding: EdgeInsets.all(4.0),
                                                                                        child: Text(
                                                                                          'Publish...',
                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                ),
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      offset: 4.0,
                                                                                      preferredDirection: AxisDirection.down,
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      elevation: 4.0,
                                                                                      tailBaseWidth: 24.0,
                                                                                      tailLength: 12.0,
                                                                                      waitDuration: Duration(milliseconds: 100),
                                                                                      showDuration: Duration(milliseconds: 100),
                                                                                      triggerMode: TooltipTriggerMode.tap,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            icon: Icon(
                                                                                              Icons.publish,
                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            onPressed: () {
                                                                                              print('publishIconButton pressed ...');
                                                                                            },
                                                                                          ),
                                                                                          AlignedTooltip(
                                                                                            content: Padding(
                                                                                              padding: EdgeInsets.all(4.0),
                                                                                              child: Text(
                                                                                                'Click to save progress',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyLarge.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyLarge.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            offset: 4.0,
                                                                                            preferredDirection: AxisDirection.down,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 4.0,
                                                                                            tailBaseWidth: 24.0,
                                                                                            tailLength: 12.0,
                                                                                            waitDuration: Duration(milliseconds: 100),
                                                                                            showDuration: Duration(milliseconds: 1500),
                                                                                            triggerMode: TooltipTriggerMode.tap,
                                                                                            child: Visibility(
                                                                                              visible: _model.showChat ?? true,
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderRadius: 8.0,
                                                                                                buttonSize: 40.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                                icon: Icon(
                                                                                                  Icons.save,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  var confirmDialogResponse = await showDialog<bool>(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return AlertDialog(
                                                                                                            title: Text('Action request...'),
                                                                                                            content: Text('Do you want to publish?'),
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
                                                                                                    if (_model.actionCase == 1) {
                                                                                                      _model.newOpsRow = await OpsBoardTable().insert({
                                                                                                        'name': _model.boardUiName,
                                                                                                        'tenant_id': _model.tenantID,
                                                                                                      });
                                                                                                      _model.publishReturnC1 = await actions.publishCommand(
                                                                                                        'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                                        _model.chatSessionID!,
                                                                                                        _model.tenantID!,
                                                                                                        currentUserEmail,
                                                                                                        currentUserDisplayName,
                                                                                                        _model.newOpsRow!.id,
                                                                                                      );
                                                                                                    } else {
                                                                                                      _model.publishReturnC234 = await actions.publishCommand(
                                                                                                        'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                                        _model.chatSessionID!,
                                                                                                        _model.tenantID!,
                                                                                                        currentUserEmail,
                                                                                                        currentUserDisplayName,
                                                                                                        _model.boardID!,
                                                                                                      );
                                                                                                    }

                                                                                                    await Future.delayed(
                                                                                                      Duration(
                                                                                                        milliseconds: 1000,
                                                                                                      ),
                                                                                                    );
                                                                                                    _model.publishAction = await BuilderUiStateTable().queryRows(
                                                                                                      queryFn: (q) => q.eqOrNull(
                                                                                                        'session_id',
                                                                                                        _model.chatSessionID,
                                                                                                      ),
                                                                                                    );
                                                                                                    if ((_model.actionCase == 3) || (_model.actionCase == 4)) {
                                                                                                      await ReportTable().update(
                                                                                                        data: {
                                                                                                          'url_icon': _model.cardUIURL,
                                                                                                          'status': _model.cardStatus,
                                                                                                          'showCounter': _model.viewUsage,
                                                                                                          'counterThreshold': _model.viewThreshold,
                                                                                                        },
                                                                                                        matchingRows: (rows) => rows.eqOrNull(
                                                                                                          'id',
                                                                                                          _model.cardID,
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    _model.blueprintSections = _model.publishAction!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                                    _model.progressSummary = _model.publishAction?.firstOrNull?.progressSummary;
                                                                                                    _model.undoAvailable = _model.publishAction?.firstOrNull?.undoAvailable;
                                                                                                    _model.redoAvailable = _model.publishAction?.firstOrNull?.redoAvailable;
                                                                                                    _model.showChat = true;
                                                                                                    _model.isPublished = true;
                                                                                                    safeSetState(() {});
                                                                                                    await showDialog(
                                                                                                      context: context,
                                                                                                      builder: (alertDialogContext) {
                                                                                                        return AlertDialog(
                                                                                                          title: Text('Action'),
                                                                                                          content: Text('Configuration Published'),
                                                                                                          actions: [
                                                                                                            TextButton(
                                                                                                              onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                              child: Text('Ok'),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  }

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
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
                                                                Expanded(
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final blueprintSummary = _model
                                                                          .blueprintSections
                                                                          .toList();

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            blueprintSummary.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 12.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                blueprintSummaryIndex) {
                                                                          final blueprintSummaryItem =
                                                                              blueprintSummary[blueprintSummaryIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                border: Border.all(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(8.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              getJsonField(
                                                                                                blueprintSummaryItem,
                                                                                                r'''$.title''',
                                                                                              ).toString(),
                                                                                              style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                    font: GoogleFonts.inter(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 4.0)),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 8.0, 4.0),
                                                                                                  child: Text(
                                                                                                    getJsonField(
                                                                                                      blueprintSummaryItem,
                                                                                                      r'''$.status''',
                                                                                                    ).toString(),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.inter(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          fontSize: 9.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Icon(
                                                                                              Icons.help_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(24.0, 8.0, 0.0, 8.0),
                                                                                      child: Builder(
                                                                                        builder: (context) {
                                                                                          final itemsFromBlueprint = getJsonField(
                                                                                            blueprintSummaryItem,
                                                                                            r'''$.items''',
                                                                                          ).toList();

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            primary: false,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: itemsFromBlueprint.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                            itemBuilder: (context, itemsFromBlueprintIndex) {
                                                                                              final itemsFromBlueprintItem = itemsFromBlueprint[itemsFromBlueprintIndex];
                                                                                              return Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Flexible(
                                                                                                    flex: 1,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              itemsFromBlueprintItem,
                                                                                                              r'''$.label''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FontStyle.italic,
                                                                                                                  ),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FontStyle.italic,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Flexible(
                                                                                                    flex: 4,
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                itemsFromBlueprintItem,
                                                                                                                r'''$.value''',
                                                                                                              ).toString(),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 12.0,
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
                                                                                                ],
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 6.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height:
                                                                      16.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 0.0)),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        if (!_model.showChat!)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    72.0, 0.0, 72.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 96.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Welcome to the Soliis AI App Builder',
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
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    12.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Build the app you need to keep your organisation informed.',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .headlineSmall
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmall
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmall
                                                                    .fontStyle,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    32.0),
                                                        child: Lottie.asset(
                                                          'assets/jsons/Saabu.io.json',
                                                          width: 200.0,
                                                          height: 200.0,
                                                          fit: BoxFit.contain,
                                                          animate: true,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            'Create or edit a dashboard, ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'design or modify the app that sends',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                          Text(
                                                            'operational signals to your organisation',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  font:
                                                                      GoogleFonts
                                                                          .inter(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .fontStyle,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 6.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        64.0,
                                                                        64.0,
                                                                        64.0,
                                                                        0.0),
                                                            child: Text(
                                                              '>>>      ${_model.aiUpdates}      <<<',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmall
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .warning,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineSmall
                                                                        .fontStyle,
                                                                  ),
                                                            ).animateOnPageLoad(
                                                                animationsMap[
                                                                    'textOnPageLoadAnimation']!),
                                                          ),
                                                          if (_model
                                                                  .animationShow ??
                                                              true)
                                                            Lottie.asset(
                                                              'assets/jsons/Processing.json',
                                                              width: 400.0,
                                                              height: 100.0,
                                                              fit: BoxFit
                                                                  .contain,
                                                              animate: true,
                                                            ),
                                                        ],
                                                      ),
                                                    ],
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
