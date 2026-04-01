import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/geticon/geticon_widget.dart';
import '/components/new_dispatch_card/new_dispatch_card_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/components/tree_components/location/location_tree_dropdown/location_tree_dropdown_widget.dart';
import '/components/tree_components/team/team_tree_dropdown/team_tree_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'app_builder_model.dart';
export 'app_builder_model.dart';

class AppBuilderWidget extends StatefulWidget {
  const AppBuilderWidget({super.key});

  static String routeName = 'appBuilder';
  static String routePath = '/appBuilder';

  @override
  State<AppBuilderWidget> createState() => _AppBuilderWidgetState();
}

class _AppBuilderWidgetState extends State<AppBuilderWidget>
    with TickerProviderStateMixin {
  late AppBuilderModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AppBuilderModel());

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
      _model.viewMode = 'AI';
      _model.cardSelected = false;
      _model.phoneView = true;
      _model.contentUpdated = false;
      _model.assetAwareState = false;
      _model.locationAwareState = false;
      _model.newCard = false;
      _model.iconUrlPath = null;
      _model.cardType = -1;
      _model.helipImagePath = null;
      _model.selectedCard = null;
      safeSetState(() {
        _model.checkboxUsageValue = _model.viewUsage!;
      });
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 6,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.summaryTextFieldTextController ??= TextEditingController();
    _model.summaryTextFieldFocusNode ??= FocusNode();

    _model.usageThresholdTextController1 ??= TextEditingController();
    _model.usageThresholdFocusNode1 ??= FocusNode();

    _model.assetSwitchValue = false;
    _model.assetUIPromptTextFieldTextController ??= TextEditingController();
    _model.assetUIPromptTextFieldFocusNode ??= FocusNode();

    _model.locationSwitchValue = false;
    _model.locationUIPromptTextFieldTextController ??= TextEditingController();
    _model.locationUIPromptTextFieldFocusNode ??= FocusNode();

    _model.reportPromptTextFieldTextController ??= TextEditingController();
    _model.reportPromptTextFieldFocusNode ??= FocusNode();

    _model.helpTextTextController ??= TextEditingController();
    _model.helpTextFocusNode ??= FocusNode();

    _model.usageThresholdTextController2 ??= TextEditingController();
    _model.usageThresholdFocusNode2 ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.usageThresholdTextController1?.text = '5';
          _model.usageThresholdTextController2?.text = '5';
        }));
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
            width: MediaQuery.sizeOf(context).width * 1.0,
            height: MediaQuery.sizeOf(context).height * 1.0,
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                          selectedNav: 40,
                          contentWarning: false,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<FormSchemaRow>>(
                          future: FormSchemaTable().queryRows(
                            queryFn: (q) => q.eqOrNull(
                              'tenant_id',
                              FFAppState().session.tenantID,
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
                            List<FormSchemaRow> containerMainFormSchemaRowList =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: FutureBuilder<List<OpsBoardRow>>(
                                future: OpsBoardTable().queryRows(
                                  queryFn: (q) => q.eqOrNull(
                                    'tenant_id',
                                    FFAppState().session.tenantID,
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
                                      containerOpsBoardsOpsBoardRowList =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 12.0, 12.0, 6.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Flexible(
                                              child: Container(
                                                decoration: BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (!_model.showChat!)
                                                      Flexible(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Flexible(
                                                                flex: 6,
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 36.0, 0.0, 0.0),
                                                                              child: Container(
                                                                                height: 60.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    FlutterFlowDropDown<int>(
                                                                                      controller: _model.dropDownOpsValueController ??= FormFieldController<int>(
                                                                                        _model.dropDownOpsValue ??= null,
                                                                                      ),
                                                                                      options: List<int>.from(containerOpsBoardsOpsBoardRowList.map((e) => e.id).toList()),
                                                                                      optionLabels: containerOpsBoardsOpsBoardRowList.map((e) => e.name).toList(),
                                                                                      onChanged: (val) async {
                                                                                        safeSetState(() => _model.dropDownOpsValue = val);
                                                                                        var _shouldSetState = false;
                                                                                        if ((_model.isPublished == false) && _model.showChat!) {
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
                                                                                            _model.showChat = false;
                                                                                            _model.blueprintSections = [];
                                                                                            _model.isPublished = false;
                                                                                            _model.actionCase = 0;
                                                                                            _model.configType = null;
                                                                                            _model.chatSessionID = 'none';
                                                                                            _model.undoAvailable = false;
                                                                                            _model.redoAvailable = false;
                                                                                            _model.chatPrompt1 = null;
                                                                                            _model.chatPrompt2 = null;
                                                                                            _model.cardSelected = false;
                                                                                            _model.phoneView = true;
                                                                                            _model.contentUpdated = false;
                                                                                            _model.assetAwareState = false;
                                                                                            _model.locationAwareState = false;
                                                                                            _model.newCard = false;
                                                                                          } else {
                                                                                            if (_shouldSetState) safeSetState(() {});
                                                                                            return;
                                                                                          }
                                                                                        }
                                                                                        _model.boardID = _model.dropDownOpsValue;
                                                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                                                          SnackBar(
                                                                                            content: Text(
                                                                                              _model.boardID!.toString(),
                                                                                              style: TextStyle(
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                              ),
                                                                                            ),
                                                                                            duration: Duration(milliseconds: 4000),
                                                                                            backgroundColor: FlutterFlowTheme.of(context).secondary,
                                                                                          ),
                                                                                        );
                                                                                        _model.reportQuery = await ReportTable().queryRows(
                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                            'ops_board_id',
                                                                                            _model.boardID,
                                                                                          ),
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        _model.reportRows = _model.reportQuery!.toList().cast<ReportRow>();
                                                                                        safeSetState(() {});
                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                      },
                                                                                      width: 320.0,
                                                                                      height: 40.0,
                                                                                      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.inter(
                                                                                              fontWeight: FontWeight.normal,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                      hintText: 'Select Dashboard...',
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
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 320.0,
                                                                                      height: 700.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(32.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          width: 4.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF1F4F8),
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(28.0),
                                                                                                topRight: Radius.circular(28.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 6.0, 16.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Align(
                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: 100.0,
                                                                                                            height: 24.0,
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 30.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 44.0,
                                                                                                        icon: Icon(
                                                                                                          Icons.menu_rounded,
                                                                                                          color: Color(0xFF14181B),
                                                                                                          size: 24.0,
                                                                                                        ),
                                                                                                        onPressed: () {
                                                                                                          print('IconButton pressed ...');
                                                                                                        },
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 20.0),
                                                                                                  child: Container(
                                                                                                    height: 110.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Colors.white,
                                                                                                      boxShadow: [
                                                                                                        BoxShadow(
                                                                                                          blurRadius: 4.0,
                                                                                                          color: Color(0x34090F13),
                                                                                                          offset: Offset(
                                                                                                            0.0,
                                                                                                            2.0,
                                                                                                          ),
                                                                                                        )
                                                                                                      ],
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                    ),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 8.0, 12.0, 8.0),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              'Daily tracker',
                                                                                                              style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                                                    font: GoogleFonts.outfit(
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                                    ),
                                                                                                                    color: Color(0xFF14181B),
                                                                                                                    fontSize: 18.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Progress',
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
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  '4/10',
                                                                                                                  style: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                                                        font: GoogleFonts.outfit(
                                                                                                                          fontWeight: FontWeight.w500,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                                        ),
                                                                                                                        color: Color(0xFF14181B),
                                                                                                                        fontSize: 32.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Visibility(
                                                                                                visible: _model.boardID != null,
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 4.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final cardGridview = _model.reportRows.map((e) => e).toList();

                                                                                                      return GridView.builder(
                                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                                          0,
                                                                                                          0,
                                                                                                          0,
                                                                                                          0.0,
                                                                                                        ),
                                                                                                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                                                                          crossAxisCount: 2,
                                                                                                          crossAxisSpacing: 12.0,
                                                                                                          mainAxisSpacing: 12.0,
                                                                                                          childAspectRatio: 1.5,
                                                                                                        ),
                                                                                                        primary: false,
                                                                                                        scrollDirection: Axis.vertical,
                                                                                                        itemCount: cardGridview.length,
                                                                                                        itemBuilder: (context, cardGridviewIndex) {
                                                                                                          final cardGridviewItem = cardGridview[cardGridviewIndex];
                                                                                                          return InkWell(
                                                                                                            splashColor: Colors.transparent,
                                                                                                            focusColor: Colors.transparent,
                                                                                                            hoverColor: Colors.transparent,
                                                                                                            highlightColor: Colors.transparent,
                                                                                                            onTap: () async {
                                                                                                              if (_model.contentUpdated == true) {
                                                                                                                var confirmDialogResponse = await showDialog<bool>(
                                                                                                                      context: context,
                                                                                                                      builder: (alertDialogContext) {
                                                                                                                        return AlertDialog(
                                                                                                                          title: Text('Save Changes...'),
                                                                                                                          content: Text('Changes have been made to the ${_model.nameTextFieldTextController.text} dispatch card! Do you want to save these?'),
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
                                                                                                                  await ReportTable().update(
                                                                                                                    data: {
                                                                                                                      'name': _model.nameTextFieldTextController.text,
                                                                                                                      'ui_description': _model.selectedCard?.uiDescription,
                                                                                                                      'status': _model.cardStatus,
                                                                                                                      'report_type': _model.cardType,
                                                                                                                      'prompt': _model.reportPromptTextFieldTextController.text,
                                                                                                                      'helptext': _model.helpTextTextController.text,
                                                                                                                      'helpImage': _model.helipImagePath,
                                                                                                                      'assetAware': _model.assetSwitchValue,
                                                                                                                      'locationAware': _model.locationSwitchValue,
                                                                                                                      'assetValue': _model.assetTypeValue,
                                                                                                                      'locationValue': _model.locationTypeValue,
                                                                                                                      'assetNameDescription': _model.assetUIPromptTextFieldTextController.text,
                                                                                                                      'locationNameDescription': _model.locationUIPromptTextFieldTextController.text,
                                                                                                                      'url_icon': _model.iconUrlPath,
                                                                                                                      'showCounter': _model.showUsageValue,
                                                                                                                      'counterThreshold': int.tryParse(_model.usageThresholdTextController1.text),
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                      'id',
                                                                                                                      _model.selectedCard?.id,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  _model.showChat = false;
                                                                                                                  _model.blueprintSections = [];
                                                                                                                  _model.isPublished = false;
                                                                                                                  _model.actionCase = 0;
                                                                                                                  _model.configType = null;
                                                                                                                  _model.chatSessionID = 'none';
                                                                                                                  _model.undoAvailable = false;
                                                                                                                  _model.redoAvailable = false;
                                                                                                                  _model.chatPrompt1 = null;
                                                                                                                  _model.chatPrompt2 = null;
                                                                                                                  safeSetState(() {});
                                                                                                                }
                                                                                                              }
                                                                                                              _model.selectedCard = cardGridviewItem;
                                                                                                              _model.cardSelected = true;
                                                                                                              _model.cardID = cardGridviewItem.id;
                                                                                                              _model.cardUIURL = cardGridviewItem.urlIcon;
                                                                                                              _model.helipImagePath = cardGridviewItem.helpImage;
                                                                                                              _model.contentUpdated = false;
                                                                                                              _model.assetAwareState = cardGridviewItem.assetAware;
                                                                                                              _model.locationAwareState = cardGridviewItem.locationAware;
                                                                                                              safeSetState(() {});
                                                                                                              _model.cardID = cardGridviewItem.id;
                                                                                                              safeSetState(() {});
                                                                                                              FFAppState().updateDispatchUIeditStruct(
                                                                                                                (e) => e
                                                                                                                  ..selectedLocation = cardGridviewItem.locationSelectedLocation
                                                                                                                  ..selectedTeam = cardGridviewItem.teamSelectedTeam,
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                              if (_model.assetAwareState == true) {}
                                                                                                              if (_model.locationAwareState!) {}
                                                                                                              safeSetState(() {});
                                                                                                            },
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                boxShadow: [
                                                                                                                  BoxShadow(
                                                                                                                    blurRadius: 2.0,
                                                                                                                    color: Color(0x2F1D2429),
                                                                                                                    offset: Offset(
                                                                                                                      1.0,
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
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 6.0, 6.0, 8.0),
                                                                                                                child: Stack(
                                                                                                                  children: [
                                                                                                                    Column(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                cardGridviewItem.name,
                                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                      fontSize: 10.0,
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                    ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                        Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                child: Text(
                                                                                                                                  valueOrDefault<String>(
                                                                                                                                    cardGridviewItem.uiDescription,
                                                                                                                                    'description',
                                                                                                                                  ),
                                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                        font: GoogleFonts.inter(
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                        ),
                                                                                                                                        fontSize: 8.0,
                                                                                                                                        letterSpacing: 0.0,
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                      ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 4.0),
                                                                                                                        child: ClipRRect(
                                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                                          child: Image.network(
                                                                                                                            cardGridviewItem.urlIcon!,
                                                                                                                            width: 40.0,
                                                                                                                            height: 40.0,
                                                                                                                            fit: BoxFit.cover,
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Align(
                                                                                                                      alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                                        child: Container(
                                                                                                                          height: 18.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).alternate,
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
                                                                                                                            borderRadius: BorderRadius.circular(2.0),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              children: [
                                                                                                                                Align(
                                                                                                                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    '4 this week',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          font: GoogleFonts.inter(
                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                          ),
                                                                                                                                          fontSize: 8.5,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFF1F4F8),
                                                                                              boxShadow: [
                                                                                                BoxShadow(
                                                                                                  blurRadius: 0.0,
                                                                                                  color: Color(0x33000000),
                                                                                                  offset: Offset(
                                                                                                    0.0,
                                                                                                    -1.0,
                                                                                                  ),
                                                                                                )
                                                                                              ],
                                                                                              borderRadius: BorderRadius.only(
                                                                                                topLeft: Radius.circular(24.0),
                                                                                                topRight: Radius.circular(24.0),
                                                                                                bottomLeft: Radius.circular(28.0),
                                                                                                bottomRight: Radius.circular(28.0),
                                                                                              ),
                                                                                            ),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Stack(
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(48.0, 24.0, 48.0, 36.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderRadius: 28.0,
                                                                                                            buttonSize: 56.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                            icon: FaIcon(
                                                                                                              FontAwesomeIcons.newspaper,
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              size: 28.0,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              print('IconButton pressed ...');
                                                                                                            },
                                                                                                          ),
                                                                                                          Align(
                                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                            child: FlutterFlowIconButton(
                                                                                                              borderRadius: 28.0,
                                                                                                              buttonSize: 56.0,
                                                                                                              fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                              icon: Icon(
                                                                                                                Icons.support_agent,
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                size: 28.0,
                                                                                                              ),
                                                                                                              onPressed: () {
                                                                                                                print('IconButton pressed ...');
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                          FlutterFlowIconButton(
                                                                                                            borderRadius: 28.0,
                                                                                                            buttonSize: 56.0,
                                                                                                            fillColor: FlutterFlowTheme.of(context).primary,
                                                                                                            icon: FaIcon(
                                                                                                              FontAwesomeIcons.tasks,
                                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                                              size: 28.0,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              print('IconButton pressed ...');
                                                                                                            },
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
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
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 240.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                child: Icon(
                                                                                                  Icons.arrow_back,
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  size: 24.0,
                                                                                                ),
                                                                                              ),
                                                                                              Builder(
                                                                                                builder: (context) => InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    var _shouldSetState = false;
                                                                                                    if ((_model.isPublished == false) && _model.showChat!) {
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
                                                                                                        _model.showChat = false;
                                                                                                        _model.blueprintSections = [];
                                                                                                        _model.isPublished = false;
                                                                                                        _model.actionCase = 0;
                                                                                                        _model.configType = null;
                                                                                                        _model.chatSessionID = 'none';
                                                                                                        _model.undoAvailable = false;
                                                                                                        _model.redoAvailable = false;
                                                                                                        _model.chatPrompt1 = null;
                                                                                                        _model.chatPrompt2 = null;
                                                                                                        safeSetState(() {});
                                                                                                      } else {
                                                                                                        if (_shouldSetState) safeSetState(() {});
                                                                                                        return;
                                                                                                      }
                                                                                                    }
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
                                                                                                            child: NewDispatchCardWidget(
                                                                                                              newCard: false,
                                                                                                              cardType: 0,
                                                                                                              carddescription: '',
                                                                                                              executeNewCard: (newCard, cardType, cardDescription, cartTypeName, cardUiName) async {
                                                                                                                _model.cardPrompt = cardDescription;
                                                                                                                _model.reportType = cardType;
                                                                                                                _model.cardTypeName = cartTypeName;
                                                                                                                _model.cardUiName = cardUiName;
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );

                                                                                                    if (_model.reportType != -1) {
                                                                                                      _model.configType = 'ctd';
                                                                                                      _model.chatSessionID = functions.createUuid();
                                                                                                      _model.showChat = false;
                                                                                                      _model.chatPrompt1 = 'Creating a new card';
                                                                                                      _model.chatPrompt2 = 'Give a brief outline of the card';
                                                                                                      _model.cardUIDescrition = '';
                                                                                                      safeSetState(() {});
                                                                                                      // Action 4 -  init_config_
                                                                                                      _model.chatInit3 = await InitChatSessionCall.call(
                                                                                                        pConfigType: 'ctd',
                                                                                                        pSourceSchemaId: null,
                                                                                                        pSessionId: _model.chatSessionID,
                                                                                                        pTenantId: _model.tenantID,
                                                                                                        token: FFAppState().supabaseAuthToken,
                                                                                                        supabaseKey: FFDevEnvironmentValues().supabaseAnonKey,
                                                                                                      );

                                                                                                      _shouldSetState = true;
                                                                                                      if ((_model.chatInit3?.succeeded ?? true)) {
                                                                                                        _model.showChat = true;
                                                                                                        _model.actionCase = 3;
                                                                                                        _model.isPublished = false;
                                                                                                        safeSetState(() {});
                                                                                                        _model.blueprintSections = [];
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
                                                                                                      }
                                                                                                    }
                                                                                                    if (_shouldSetState) safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 140.0,
                                                                                                    height: 80.0,
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
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                                          child: FlutterFlowIconButton(
                                                                                                            borderRadius: 8.0,
                                                                                                            buttonSize: 48.0,
                                                                                                            icon: Icon(
                                                                                                              Icons.add_circle_outline,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              size: 28.0,
                                                                                                            ),
                                                                                                            onPressed: () {
                                                                                                              print('IconButton pressed ...');
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Add New',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              'Card',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    font: GoogleFonts.inter(
                                                                                                                      fontWeight: FontWeight.w500,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(48.0, 12.0, 0.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Or, click on card',
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'to edit it...',
                                                                                                style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                      ),
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(48.0, 12.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Mode:',
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
                                                                                              if (_model.viewMode == 'AI')
                                                                                                FlutterFlowIconButton(
                                                                                                  borderRadius: 24.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.phone_iphone,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    _model.viewMode = 'phone';
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                              if (_model.viewMode == 'phone')
                                                                                                FlutterFlowIconButton(
                                                                                                  borderRadius: 24.0,
                                                                                                  buttonSize: 48.0,
                                                                                                  icon: Icon(
                                                                                                    Icons.auto_awesome,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    size: 24.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    _model.viewMode = 'AI';
                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              if (false)
                                                                Flexible(
                                                                  flex: 7,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Container(
                                                                          height:
                                                                              60.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children: [
                                                                              AlignedTooltip(
                                                                                content: Padding(
                                                                                  padding: EdgeInsets.all(4.0),
                                                                                  child: Text(
                                                                                    'Edit current card configuration...',
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
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: FlutterFlowIconButton(
                                                                                    borderRadius: 8.0,
                                                                                    buttonSize: 48.0,
                                                                                    icon: Icon(
                                                                                      Icons.mode_edit_outlined,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 28.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      var _shouldSetState = false;
                                                                                      _model.aiUpdates = 'Selected: edit card';
                                                                                      _model.animationShow = false;
                                                                                      safeSetState(() {});
                                                                                      _model.cardID = _model.selectedCard?.id;
                                                                                      _model.animationShow = true;
                                                                                      safeSetState(() {});
                                                                                      if ((_model.isPublished == false) && _model.showChat!) {
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
                                                                                          _model.showChat = false;
                                                                                          _model.blueprintSections = [];
                                                                                          _model.isPublished = false;
                                                                                          _model.actionCase = 0;
                                                                                          _model.configType = null;
                                                                                          _model.chatSessionID = 'none';
                                                                                          _model.undoAvailable = false;
                                                                                          _model.redoAvailable = false;
                                                                                          _model.chatPrompt1 = null;
                                                                                          _model.chatPrompt2 = null;
                                                                                          safeSetState(() {});
                                                                                        } else {
                                                                                          if (_shouldSetState) safeSetState(() {});
                                                                                          return;
                                                                                        }
                                                                                      }
                                                                                      _model.configType = 'ctd';
                                                                                      _model.chatSessionID = functions.createUuid();
                                                                                      _model.chatPrompt1 = 'You want to edit this card';
                                                                                      _model.chatPrompt2 = 'Outline the changes you want to make, if you just want to review the card, type \'review card\'';
                                                                                      safeSetState(() {});
                                                                                      _model.aiUpdates = 'Retrieve previows AI conversation';
                                                                                      safeSetState(() {});
                                                                                      _model.getSchemaID = await ReportTable().queryRows(
                                                                                        queryFn: (q) => q.eqOrNull(
                                                                                          'id',
                                                                                          _model.selectedCard?.id,
                                                                                        ),
                                                                                      );
                                                                                      _shouldSetState = true;
                                                                                      _model.aiUpdates = 'Extract card configuration and rules';
                                                                                      _model.animationShow = true;
                                                                                      _model.cardStatus = _model.getSchemaID?.firstOrNull?.status;
                                                                                      safeSetState(() {});
                                                                                      _model.chatInit4 = await InitChatSessionCall.call(
                                                                                        pConfigType: 'ctd',
                                                                                        pSourceSchemaId: _model.getSchemaID?.firstOrNull?.cTDSchema,
                                                                                        pSessionId: _model.chatSessionID,
                                                                                        pTenantId: _model.tenantID,
                                                                                        token: FFAppState().supabaseAuthToken,
                                                                                        supabaseKey: FFDevEnvironmentValues().supabaseAnonKey,
                                                                                      );

                                                                                      _shouldSetState = true;
                                                                                      _model.aiUpdates = 'Initiate dialog';
                                                                                      safeSetState(() {});
                                                                                      if ((_model.chatInit4?.succeeded ?? true)) {
                                                                                        _model.showChat = false;
                                                                                        _model.actionCase = 4;
                                                                                        _model.isPublished = false;
                                                                                        _model.cardUIURL = _model.getSchemaID?.firstOrNull?.urlIcon;
                                                                                        _model.cardUiName = _model.getSchemaID?.firstOrNull?.name;
                                                                                        _model.cardUIDescrition = _model.getSchemaID?.firstOrNull?.uiDescription;
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
                                                                                        _model.renderCase4 = await BuilderUiStateTable().queryRows(
                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                            'session_id',
                                                                                            _model.chatSessionID,
                                                                                          ),
                                                                                        );
                                                                                        _shouldSetState = true;
                                                                                        _model.blueprintSections = _model.renderCase4!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                        _model.progressSummary = _model.renderCase4?.firstOrNull?.progressSummary;
                                                                                        _model.undoAvailable = _model.renderCase4?.firstOrNull?.undoAvailable;
                                                                                        _model.redoAvailable = _model.renderCase4?.firstOrNull?.redoAvailable;
                                                                                        _model.showChat = true;
                                                                                        _model.aiUpdates = 'Ready';
                                                                                        _model.viewUsage = _model.getSchemaID?.firstOrNull?.showCounter;
                                                                                        _model.viewThreshold = _model.getSchemaID?.firstOrNull?.counterThreshold;
                                                                                        safeSetState(() {});
                                                                                        safeSetState(() {
                                                                                          _model.checkboxUsageValue = _model.viewUsage!;
                                                                                        });
                                                                                        safeSetState(() {
                                                                                          _model.usageThresholdTextController2?.text = _model.viewThreshold!.toString();
                                                                                        });
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

                                                                                      if (_shouldSetState) safeSetState(() {});
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              AlignedTooltip(
                                                                                content: Padding(
                                                                                  padding: EdgeInsets.all(4.0),
                                                                                  child: Text(
                                                                                    'Delete card...',
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
                                                                                    size: 28.0,
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
                                                                                    'Click for card setup information...',
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
                                                                                child: Builder(
                                                                                  builder: (context) => FlutterFlowIconButton(
                                                                                    borderRadius: 8.0,
                                                                                    buttonSize: 48.0,
                                                                                    icon: Icon(
                                                                                      Icons.info_outline,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 28.0,
                                                                                    ),
                                                                                    onPressed: () async {
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
                                                                                              child: NewDispatchCardWidget(
                                                                                                newCard: false,
                                                                                                cardType: 0,
                                                                                                carddescription: '',
                                                                                                executeNewCard: (newCard, cardType, cardDescription, cartTypeName, cardUiName) async {
                                                                                                  _model.cardPrompt = cardDescription;
                                                                                                  _model.reportType = cardType;
                                                                                                  _model.cardTypeName = cartTypeName;
                                                                                                  _model.cardUiName = cardUiName;
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
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              children: [
                                                                                Align(
                                                                                  alignment: Alignment(0.0, 0),
                                                                                  child: TabBar(
                                                                                    labelColor: FlutterFlowTheme.of(context).primaryText,
                                                                                    unselectedLabelColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                    labelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    unselectedLabelStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                          font: GoogleFonts.inter(
                                                                                            fontWeight: FontWeight.normal,
                                                                                            fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                          ),
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                          fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                        ),
                                                                                    indicatorColor: FlutterFlowTheme.of(context).primary,
                                                                                    tabs: [
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.addressCard,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Card',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Icon(
                                                                                            Icons.summarize_outlined,
                                                                                            size: 20.0,
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Detail',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                            child: FaIcon(
                                                                                              FontAwesomeIcons.solidObjectGroup,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Groups',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.auto_awesome,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Prompt',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.auto_mode,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Triage',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                            child: Icon(
                                                                                              Icons.help,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                          Tab(
                                                                                            text: 'Help',
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                    controller: _model.tabBarController,
                                                                                    onTap: (i) async {
                                                                                      [
                                                                                        () async {},
                                                                                        () async {},
                                                                                        () async {},
                                                                                        () async {},
                                                                                        () async {},
                                                                                        () async {}
                                                                                      ][i]();
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: TabBarView(
                                                                                    controller: _model.tabBarController,
                                                                                    children: [
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [],
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 8.0, 16.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Flexible(
                                                                                                                flex: 1,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        'Preview',
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
                                                                                                              Flexible(
                                                                                                                flex: 3,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Container(
                                                                                                                      width: 340.0,
                                                                                                                      decoration: BoxDecoration(
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                        boxShadow: [
                                                                                                                          BoxShadow(
                                                                                                                            blurRadius: 0.0,
                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                            offset: Offset(
                                                                                                                              -4.0,
                                                                                                                              0.0,
                                                                                                                            ),
                                                                                                                          )
                                                                                                                        ],
                                                                                                                        borderRadius: BorderRadius.only(
                                                                                                                          bottomLeft: Radius.circular(1.0),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Container(
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                ),
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                    children: [
                                                                                                                                      Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Container(
                                                                                                                                          width: 228.0,
                                                                                                                                          height: 152.0,
                                                                                                                                          decoration: BoxDecoration(
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                            boxShadow: [
                                                                                                                                              BoxShadow(
                                                                                                                                                blurRadius: 2.0,
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
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 12.0),
                                                                                                                                            child: Stack(
                                                                                                                                              children: [
                                                                                                                                                Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                  children: [
                                                                                                                                                    Row(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      children: [
                                                                                                                                                        Expanded(
                                                                                                                                                          child: Text(
                                                                                                                                                            _model.nameTextFieldTextController.text,
                                                                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                                                  ),
                                                                                                                                                                  fontSize: 16.0,
                                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                                                                ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    ),
                                                                                                                                                    Row(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                      children: [
                                                                                                                                                        Expanded(
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                                                                            child: Text(
                                                                                                                                                              _model.summaryTextFieldTextController.text,
                                                                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                                    ),
                                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                                    letterSpacing: 1.0,
                                                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                                  ),
                                                                                                                                                            ),
                                                                                                                                                          ),
                                                                                                                                                        ),
                                                                                                                                                      ],
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                                Align(
                                                                                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 4.0),
                                                                                                                                                    child: ClipRRect(
                                                                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                                                                      child: Image.network(
                                                                                                                                                        _model.iconUrlPath!,
                                                                                                                                                        width: 60.0,
                                                                                                                                                        height: 60.0,
                                                                                                                                                        fit: BoxFit.cover,
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                Align(
                                                                                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                                                                                    child: Container(
                                                                                                                                                      height: 24.0,
                                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                                        color: FlutterFlowTheme.of(context).alternate,
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
                                                                                                                                                        borderRadius: BorderRadius.circular(2.0),
                                                                                                                                                      ),
                                                                                                                                                      child: Padding(
                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                                                                        child: Row(
                                                                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                                                                          children: [
                                                                                                                                                            Align(
                                                                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                                                                              child: Text(
                                                                                                                                                                '4 this week',
                                                                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                                                      ),
                                                                                                                                                                      fontSize: 14.0,
                                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                                                                    ],
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
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Divider(
                                                                                                        thickness: 2.0,
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: SingleChildScrollView(
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                              children: [
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'Card Type',
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
                                                                                                                          FlutterFlowDropDown<int>(
                                                                                                                            controller: _model.cardTypeValueController ??= FormFieldController<int>(
                                                                                                                              _model.cardTypeValue ??= _model.selectedCard?.reportType,
                                                                                                                            ),
                                                                                                                            options: List<int>.from([0, 1, 2, 3, 4, 5]),
                                                                                                                            optionLabels: [
                                                                                                                              'Alert',
                                                                                                                              'Image',
                                                                                                                              'Voice Note',
                                                                                                                              'Voice Form',
                                                                                                                              'Interpreter',
                                                                                                                              'Support'
                                                                                                                            ],
                                                                                                                            onChanged: (val) async {
                                                                                                                              safeSetState(() => _model.cardTypeValue = val);
                                                                                                                              if ((_model.cardTypeValue != _model.selectedCard?.reportType) && (_model.contentUpdated == false)) {
                                                                                                                                _model.contentUpdated = true;
                                                                                                                                safeSetState(() {});
                                                                                                                              }
                                                                                                                            },
                                                                                                                            width: 240.0,
                                                                                                                            height: 40.0,
                                                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 14.0,
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'Status',
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
                                                                                                                          FlutterFlowDropDown<int>(
                                                                                                                            controller: _model.cardStatusValueController1 ??= FormFieldController<int>(
                                                                                                                              _model.cardStatusValue1 ??= _model.selectedCard?.status,
                                                                                                                            ),
                                                                                                                            options: List<int>.from([0, 1, 2]),
                                                                                                                            optionLabels: ['Archive', 'Draft', 'Live'],
                                                                                                                            onChanged: (val) async {
                                                                                                                              safeSetState(() => _model.cardStatusValue1 = val);
                                                                                                                              if ((_model.cardStatus != _model.selectedCard?.status) && (_model.contentUpdated == false)) {
                                                                                                                                _model.contentUpdated = true;
                                                                                                                                safeSetState(() {});
                                                                                                                              }
                                                                                                                            },
                                                                                                                            width: 240.0,
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'Card Name',
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
                                                                                                                            width: 340.0,
                                                                                                                            child: TextFormField(
                                                                                                                              controller: _model.nameTextFieldTextController,
                                                                                                                              focusNode: _model.nameTextFieldFocusNode,
                                                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                                                '_model.nameTextFieldTextController',
                                                                                                                                Duration(milliseconds: 500),
                                                                                                                                () async {
                                                                                                                                  if ((_model.nameTextFieldTextController.text != _model.selectedCard?.name) && (_model.contentUpdated == false)) {
                                                                                                                                    _model.contentUpdated = true;
                                                                                                                                    safeSetState(() {});
                                                                                                                                  }
                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              autofocus: false,
                                                                                                                              obscureText: false,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                isDense: true,
                                                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
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
                                                                                                                              validator: _model.nameTextFieldTextControllerValidator.asValidator(context),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 0.0),
                                                                                                                              child: Text(
                                                                                                                                'Summary',
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
                                                                                                                          Container(
                                                                                                                            width: 340.0,
                                                                                                                            child: TextFormField(
                                                                                                                              controller: _model.summaryTextFieldTextController,
                                                                                                                              focusNode: _model.summaryTextFieldFocusNode,
                                                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                                                '_model.summaryTextFieldTextController',
                                                                                                                                Duration(milliseconds: 500),
                                                                                                                                () async {
                                                                                                                                  if ((_model.summaryTextFieldTextController.text != _model.selectedCard?.uiDescription) && (_model.contentUpdated == false)) {
                                                                                                                                    _model.contentUpdated = true;
                                                                                                                                    safeSetState(() {});
                                                                                                                                  }
                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                              ),
                                                                                                                              autofocus: false,
                                                                                                                              obscureText: false,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                isDense: true,
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
                                                                                                                                      fontWeight: FontWeight.normal,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                              maxLines: 2,
                                                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              validator: _model.summaryTextFieldTextControllerValidator.asValidator(context),
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
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Expanded(
                                                                                                                              child: Text(
                                                                                                                                'Icon',
                                                                                                                                textAlign: TextAlign.end,
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
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: 64.0,
                                                                                                                            height: 64.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                                                              borderRadius: BorderRadius.circular(4.0),
                                                                                                                            ),
                                                                                                                            child: Align(
                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                              child: ClipRRect(
                                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                                                child: Image.network(
                                                                                                                                  _model.iconUrlPath!,
                                                                                                                                  width: 60.0,
                                                                                                                                  height: 60.0,
                                                                                                                                  fit: BoxFit.cover,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Column(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            children: [
                                                                                                                              Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                                child: FFButtonWidget(
                                                                                                                                  onPressed: () async {
                                                                                                                                    final selectedMedia = await selectMedia(
                                                                                                                                      storageFolderPath: _model.selectedCard?.id.toString(),
                                                                                                                                      maxWidth: 400.00,
                                                                                                                                      maxHeight: 400.00,
                                                                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                                                                      multiImage: false,
                                                                                                                                    );
                                                                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                                      safeSetState(() => _model.isDataUploading_uploadDataSlg = true);
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
                                                                                                                                        _model.isDataUploading_uploadDataSlg = false;
                                                                                                                                      }
                                                                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                                        safeSetState(() {
                                                                                                                                          _model.uploadedLocalFile_uploadDataSlg = selectedUploadedFiles.first;
                                                                                                                                          _model.uploadedFileUrl_uploadDataSlg = downloadUrls.first;
                                                                                                                                        });
                                                                                                                                      } else {
                                                                                                                                        safeSetState(() {});
                                                                                                                                        return;
                                                                                                                                      }
                                                                                                                                    }

                                                                                                                                    _model.contentUpdated = true;
                                                                                                                                    _model.iconUrlPath = _model.uploadedFileUrl_uploadDataSlg;
                                                                                                                                    safeSetState(() {});
                                                                                                                                  },
                                                                                                                                  text: 'Upload',
                                                                                                                                  options: FFButtonOptions(
                                                                                                                                    width: 80.0,
                                                                                                                                    height: 30.0,
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                                    textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                                          font: GoogleFonts.inter(
                                                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                          ),
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                                        ),
                                                                                                                                    elevation: 0.0,
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ].divide(SizedBox(height: 8.0)),
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
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 1,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              'View Usage',
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
                                                                                                                          Theme(
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
                                                                                                                              value: _model.showUsageValue ??= true,
                                                                                                                              onChanged: (newValue) async {
                                                                                                                                safeSetState(() => _model.showUsageValue = newValue!);
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
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(36.0, 0.0, 8.0, 0.0),
                                                                                                                            child: Text(
                                                                                                                              'Threshold ',
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
                                                                                                                          Container(
                                                                                                                            width: 50.0,
                                                                                                                            child: TextFormField(
                                                                                                                              controller: _model.usageThresholdTextController1,
                                                                                                                              focusNode: _model.usageThresholdFocusNode1,
                                                                                                                              autofocus: false,
                                                                                                                              obscureText: false,
                                                                                                                              decoration: InputDecoration(
                                                                                                                                isDense: true,
                                                                                                                                labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                      font: GoogleFonts.inter(
                                                                                                                                        fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                        fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                      ),
                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                hintText: '#',
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
                                                                                                                              textAlign: TextAlign.center,
                                                                                                                              cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              enableInteractiveSelection: true,
                                                                                                                              validator: _model.usageThresholdTextController1Validator.asValidator(context),
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
                                                                                                                FutureBuilder<List<LocationRow>>(
                                                                                                                  future: LocationTable().queryRows(
                                                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                                                      'id',
                                                                                                                      FFAppState().dispatchUIedit.selectedLocation,
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
                                                                                                                    List<LocationRow> editCardLocationContainerLocationRowList = snapshot.data!;

                                                                                                                    return Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    'Location visibility',
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
                                                                                                                                  width: 340.0,
                                                                                                                                  height: 40.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    border: Border.all(
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              editCardLocationContainerLocationRowList.firstOrNull?.name,
                                                                                                                                              'name-location',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                  ),
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Builder(
                                                                                                                                        builder: (context) => Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              await showAlignedDialog(
                                                                                                                                                barrierDismissible: false,
                                                                                                                                                context: context,
                                                                                                                                                isGlobal: false,
                                                                                                                                                avoidOverflow: true,
                                                                                                                                                targetAnchor: AlignmentDirectional(-8.25, 9.9).resolve(Directionality.of(context)),
                                                                                                                                                followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                                builder: (dialogContext) {
                                                                                                                                                  return Material(
                                                                                                                                                    color: Colors.transparent,
                                                                                                                                                    child: GestureDetector(
                                                                                                                                                      onTap: () {
                                                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                      },
                                                                                                                                                      child: Container(
                                                                                                                                                        height: 360.0,
                                                                                                                                                        width: 320.0,
                                                                                                                                                        child: LocationTreeDropdownWidget(
                                                                                                                                                          topID: FFAppState().session.locationTreeIDStart,
                                                                                                                                                          currentPath: FFAppState().dispatchUIedit.selectedLocation.toString(),
                                                                                                                                                          selectedTitle: editCardLocationContainerLocationRowList.firstOrNull!.name!,
                                                                                                                                                          showLongName: false,
                                                                                                                                                          opMode: 1,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                            child: Container(
                                                                                                                                              width: 32.0,
                                                                                                                                              height: 32.2,
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                                                              ),
                                                                                                                                              child: Align(
                                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                                child: Icon(
                                                                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                  size: 24.0,
                                                                                                                                                ),
                                                                                                                                              ),
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                FutureBuilder<List<TeamRow>>(
                                                                                                                  future: TeamTable().querySingleRow(
                                                                                                                    queryFn: (q) => q.eqOrNull(
                                                                                                                      'id',
                                                                                                                      FFAppState().dispatchUIedit.selectedTeam,
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
                                                                                                                    List<TeamRow> editCardTeamContainerTeamRowList = snapshot.data!;

                                                                                                                    final editCardTeamContainerTeamRow = editCardTeamContainerTeamRowList.isNotEmpty ? editCardTeamContainerTeamRowList.first : null;

                                                                                                                    return Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            flex: 1,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                                children: [
                                                                                                                                  Text(
                                                                                                                                    'Team visibility',
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
                                                                                                                                  width: 340.0,
                                                                                                                                  height: 40.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                                    border: Border.all(
                                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  child: Row(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                          child: Text(
                                                                                                                                            valueOrDefault<String>(
                                                                                                                                              editCardTeamContainerTeamRow?.name,
                                                                                                                                              'name-team',
                                                                                                                                            ),
                                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                                    fontWeight: FontWeight.normal,
                                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                  ),
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      Builder(
                                                                                                                                        builder: (context) => Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                          child: InkWell(
                                                                                                                                            splashColor: Colors.transparent,
                                                                                                                                            focusColor: Colors.transparent,
                                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                                            onTap: () async {
                                                                                                                                              await showAlignedDialog(
                                                                                                                                                barrierDismissible: false,
                                                                                                                                                context: context,
                                                                                                                                                isGlobal: false,
                                                                                                                                                avoidOverflow: true,
                                                                                                                                                targetAnchor: AlignmentDirectional(-8.25, 9.9).resolve(Directionality.of(context)),
                                                                                                                                                followerAnchor: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                                builder: (dialogContext) {
                                                                                                                                                  return Material(
                                                                                                                                                    color: Colors.transparent,
                                                                                                                                                    child: GestureDetector(
                                                                                                                                                      onTap: () {
                                                                                                                                                        FocusScope.of(dialogContext).unfocus();
                                                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                      },
                                                                                                                                                      child: Container(
                                                                                                                                                        height: 360.0,
                                                                                                                                                        width: 320.0,
                                                                                                                                                        child: TeamTreeDropdownWidget(
                                                                                                                                                          topID: FFAppState().session.teamTreeIDStart,
                                                                                                                                                          currentPath: FFAppState().dispatchUIedit.selectedTeam.toString(),
                                                                                                                                                          selectedTitle: editCardTeamContainerTeamRow!.name!,
                                                                                                                                                          showLongName: false,
                                                                                                                                                          opMode: 1,
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  );
                                                                                                                                                },
                                                                                                                                              );
                                                                                                                                            },
                                                                                                                                            child: Container(
                                                                                                                                              width: 32.0,
                                                                                                                                              height: 32.2,
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                borderRadius: BorderRadius.circular(4.0),
                                                                                                                                              ),
                                                                                                                                              child: Align(
                                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                                child: Icon(
                                                                                                                                                  Icons.keyboard_arrow_down_rounded,
                                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                                  size: 24.0,
                                                                                                                                                ),
                                                                                                                                              ),
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
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                                Divider(
                                                                                                                  thickness: 2.0,
                                                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                                                ),
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          flex: 1,
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                                              children: [
                                                                                                                                Text(
                                                                                                                                  'Available to roles',
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
                                                                                                                                width: 340.0,
                                                                                                                                height: 40.0,
                                                                                                                                decoration: BoxDecoration(
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                                                  border: Border.all(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                child: Row(
                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                  children: [
                                                                                                                                    Expanded(
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                        child: Text(
                                                                                                                                          'Hello World',
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                font: GoogleFonts.inter(
                                                                                                                                                  fontWeight: FontWeight.normal,
                                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                                ),
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                fontWeight: FontWeight.normal,
                                                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                                                                      child: Container(
                                                                                                                                        width: 32.0,
                                                                                                                                        height: 32.2,
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          borderRadius: BorderRadius.circular(4.0),
                                                                                                                                        ),
                                                                                                                                        child: Align(
                                                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                                          child: Icon(
                                                                                                                                            Icons.keyboard_arrow_down_rounded,
                                                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                            size: 24.0,
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
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ].divide(SizedBox(height: 16.0)),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 18.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                        child: FutureBuilder<List<LocationRow>>(
                                                                                          future: LocationTable().queryRows(
                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                              'id',
                                                                                              FFAppState().dispatchUIedit.selectedLocation,
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

                                                                                            return Container(
                                                                                              decoration: BoxDecoration(),
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              'Dispatch cards can be used individually, where each card is a complete information entity. Alternatively they can be part of a Group, where a set of cards create a full information entity.',
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
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(60.0, 0.0, 60.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'In addition individual cards can be attached to an asset, or a location...',
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
                                                                                                    Divider(
                                                                                                      thickness: 2.0,
                                                                                                      color: FlutterFlowTheme.of(context).alternate,
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Asset Aware',
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
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 360.0,
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Switch.adaptive(
                                                                                                                      value: _model.assetSwitchValue!,
                                                                                                                      onChanged: (newValue) async {
                                                                                                                        safeSetState(() => _model.assetSwitchValue = newValue);
                                                                                                                        if (newValue) {
                                                                                                                          if (!_model.contentUpdated!) {
                                                                                                                            _model.contentUpdated = true;
                                                                                                                            safeSetState(() {});
                                                                                                                          }
                                                                                                                        }
                                                                                                                      },
                                                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Icon(
                                                                                                                        Icons.info_outline,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (_model.assetSwitchValue == true)
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                        child: FlutterFlowDropDown<int>(
                                                                                                                          controller: _model.assetTypeValueController ??= FormFieldController<int>(
                                                                                                                            _model.assetTypeValue ??= _model.selectedCard?.assetValue,
                                                                                                                          ),
                                                                                                                          options: List<int>.from([0, 1, 2]),
                                                                                                                          optionLabels: [
                                                                                                                            'Free text',
                                                                                                                            'QR Code / Barcode',
                                                                                                                            'Vehicle Registration Plate'
                                                                                                                          ],
                                                                                                                          onChanged: (val) async {
                                                                                                                            safeSetState(() => _model.assetTypeValue = val);
                                                                                                                            if ((_model.assetTypeValue != _model.selectedCard?.assetValue) && (_model.contentUpdated == false)) {
                                                                                                                              _model.contentUpdated = true;
                                                                                                                              safeSetState(() {});
                                                                                                                            }
                                                                                                                          },
                                                                                                                          width: 340.0,
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
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          'Asset Name Description',
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
                                                                                                                      Container(
                                                                                                                        width: 340.0,
                                                                                                                        child: TextFormField(
                                                                                                                          controller: _model.assetUIPromptTextFieldTextController,
                                                                                                                          focusNode: _model.assetUIPromptTextFieldFocusNode,
                                                                                                                          autofocus: false,
                                                                                                                          obscureText: false,
                                                                                                                          decoration: InputDecoration(
                                                                                                                            isDense: true,
                                                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                  font: GoogleFonts.inter(
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                  ),
                                                                                                                                  fontSize: 14.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                ),
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
                                                                                                                          enableInteractiveSelection: true,
                                                                                                                          validator: _model.assetUIPromptTextFieldTextControllerValidator.asValidator(context),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ].divide(SizedBox(height: 12.0)),
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
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Flexible(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Location Aware',
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
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Container(
                                                                                                                width: 360.0,
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                  children: [
                                                                                                                    Switch.adaptive(
                                                                                                                      value: _model.locationSwitchValue!,
                                                                                                                      onChanged: (newValue) async {
                                                                                                                        safeSetState(() => _model.locationSwitchValue = newValue);
                                                                                                                        if (newValue) {
                                                                                                                          if (!_model.contentUpdated!) {
                                                                                                                            _model.contentUpdated = true;
                                                                                                                            safeSetState(() {});
                                                                                                                          }
                                                                                                                        }
                                                                                                                      },
                                                                                                                      activeColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                                                                                                                      inactiveTrackColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                      inactiveThumbColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                    ),
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Icon(
                                                                                                                        Icons.info_outline,
                                                                                                                        color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                        size: 24.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              if (_model.locationSwitchValue ?? true)
                                                                                                                Container(
                                                                                                                  decoration: BoxDecoration(),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                                                    child: Column(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                          child: FlutterFlowDropDown<int>(
                                                                                                                            controller: _model.locationTypeValueController ??= FormFieldController<int>(
                                                                                                                              _model.locationTypeValue ??= _model.selectedCard?.locationValue,
                                                                                                                            ),
                                                                                                                            options: List<int>.from([0, 1]),
                                                                                                                            optionLabels: ['Location Classification', 'Address'],
                                                                                                                            onChanged: (val) async {
                                                                                                                              safeSetState(() => _model.locationTypeValue = val);
                                                                                                                              if ((_model.locationTypeValue != _model.selectedCard?.locationValue) && !_model.contentUpdated!) {
                                                                                                                                _model.contentUpdated = true;
                                                                                                                                safeSetState(() {});
                                                                                                                              }
                                                                                                                            },
                                                                                                                            width: 340.0,
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
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            'Location Name Description',
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
                                                                                                                        Container(
                                                                                                                          width: 340.0,
                                                                                                                          child: TextFormField(
                                                                                                                            controller: _model.locationUIPromptTextFieldTextController,
                                                                                                                            focusNode: _model.locationUIPromptTextFieldFocusNode,
                                                                                                                            autofocus: false,
                                                                                                                            obscureText: false,
                                                                                                                            decoration: InputDecoration(
                                                                                                                              isDense: true,
                                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                                    font: GoogleFonts.inter(
                                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                    ),
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                                  ),
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
                                                                                                                            enableInteractiveSelection: true,
                                                                                                                            validator: _model.locationUIPromptTextFieldTextControllerValidator.asValidator(context),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(height: 12.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 16.0)),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(48.0, 30.0, 32.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Text(
                                                                                                    'Enter the prompt that will be used everytime this dispatch card sends an information payload to the dashboard...',
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
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(48.0, 18.0, 32.0, 24.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsets.all(12.0),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          child: TextFormField(
                                                                                                            controller: _model.reportPromptTextFieldTextController,
                                                                                                            focusNode: _model.reportPromptTextFieldFocusNode,
                                                                                                            autofocus: false,
                                                                                                            obscureText: false,
                                                                                                            decoration: InputDecoration(
                                                                                                              isDense: true,
                                                                                                              labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    font: GoogleFonts.poppins(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                  ),
                                                                                                              hintText: 'TextField',
                                                                                                              hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                    font: GoogleFonts.poppins(
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                    ),
                                                                                                                    fontSize: 16.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                  ),
                                                                                                              enabledBorder: OutlineInputBorder(
                                                                                                                borderSide: BorderSide(
                                                                                                                  color: Color(0x00000000),
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
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  font: GoogleFonts.openSans(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                  ),
                                                                                                                  fontSize: 16.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                ),
                                                                                                            maxLines: null,
                                                                                                            cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                            enableInteractiveSelection: true,
                                                                                                            validator: _model.reportPromptTextFieldTextControllerValidator.asValidator(context),
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
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                                    child: Text(
                                                                                                      'Triage Agents',
                                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                            font: GoogleFonts.poppins(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                                            ),
                                                                                                            fontSize: 18.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(48.0, 20.0, 32.0, 10.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Enable data extraction',
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
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Select the schema that defines the content that will be extracted...',
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
                                                                                                    ].divide(SizedBox(height: 12.0)),
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
                                                                                      Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(32.0, 24.0, 32.0, 24.0),
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Stack(
                                                                                                      children: [
                                                                                                        ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                          child: Image.network(
                                                                                                            _model.helipImagePath!,
                                                                                                            width: double.infinity,
                                                                                                            height: 280.0,
                                                                                                            fit: BoxFit.contain,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(1.0, -1.0),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(4.0),
                                                                                                            child: FFButtonWidget(
                                                                                                              onPressed: () async {
                                                                                                                final selectedMedia = await selectMedia(
                                                                                                                  storageFolderPath: _model.selectedCard?.id.toString(),
                                                                                                                  maxWidth: 2000.00,
                                                                                                                  maxHeight: 1000.00,
                                                                                                                  mediaSource: MediaSource.photoGallery,
                                                                                                                  multiImage: false,
                                                                                                                );
                                                                                                                if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                                  safeSetState(() => _model.isDataUploading_uploadDataHelpImageOrg = true);
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
                                                                                                                    _model.isDataUploading_uploadDataHelpImageOrg = false;
                                                                                                                  }
                                                                                                                  if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                    safeSetState(() {
                                                                                                                      _model.uploadedLocalFile_uploadDataHelpImageOrg = selectedUploadedFiles.first;
                                                                                                                      _model.uploadedFileUrl_uploadDataHelpImageOrg = downloadUrls.first;
                                                                                                                    });
                                                                                                                  } else {
                                                                                                                    safeSetState(() {});
                                                                                                                    return;
                                                                                                                  }
                                                                                                                }

                                                                                                                _model.iconUrlPath = _model.uploadedFileUrl_uploadDataSlg;
                                                                                                                safeSetState(() {});
                                                                                                              },
                                                                                                              text: 'Upload',
                                                                                                              options: FFButtonOptions(
                                                                                                                height: 30.0,
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                      ),
                                                                                                                      color: Colors.white,
                                                                                                                      fontSize: 12.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).titleSmall.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).titleSmall.fontStyle,
                                                                                                                    ),
                                                                                                                elevation: 0.0,
                                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      child: Align(
                                                                                                        alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                                                                                                          child: Container(
                                                                                                            width: double.infinity,
                                                                                                            constraints: BoxConstraints(
                                                                                                              minWidth: 80.0,
                                                                                                            ),
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                            ),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Container(
                                                                                                                  width: double.infinity,
                                                                                                                  child: TextFormField(
                                                                                                                    controller: _model.helpTextTextController,
                                                                                                                    focusNode: _model.helpTextFocusNode,
                                                                                                                    autofocus: false,
                                                                                                                    obscureText: false,
                                                                                                                    decoration: InputDecoration(
                                                                                                                      isDense: true,
                                                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                            font: GoogleFonts.inter(
                                                                                                                              fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                              fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                            ),
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                          ),
                                                                                                                      hintText: 'TextField',
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
                                                                                                                          color: Color(0x00000000),
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
                                                                                                                    enableInteractiveSelection: true,
                                                                                                                    validator: _model.helpTextTextControllerValidator.asValidator(context),
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
                                                                                        ],
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.showChat ?? true)
                                                      Flexible(
                                                        child: Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  1.0,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  1.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Flexible(
                                                                flex: 4,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            60.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              if (_model.chatSessionID != 'none')
                                                                                Expanded(
                                                                                  child: AuthUserStreamWidget(
                                                                                    builder: (context) => Container(
                                                                                      width: double.infinity,
                                                                                      height: double.infinity,
                                                                                      child: custom_widgets.N8nChatUiWidget2(
                                                                                        width: double.infinity,
                                                                                        height: double.infinity,
                                                                                        webhookUrl: 'https://soliis.app.n8n.cloud/webhook/jsonBuilder/v1',
                                                                                        cacheUrl: 'https://soliis.app.n8n.cloud/webhook/1c677817-273d-4fc0-ab24-5df9c7082316/cacheUrl/v1',
                                                                                        userName: currentUserDisplayName,
                                                                                        userEmail: currentUserEmail,
                                                                                        chatName: 'Soliis App Builder',
                                                                                        profileImageUrl: 'www.test,png',
                                                                                        title: _model.chatPrompt1,
                                                                                        subtitle: _model.chatPrompt2,
                                                                                        enableAudio: false,
                                                                                        enableImage: false,
                                                                                        waitForResponse: true,
                                                                                        showHeader: false,
                                                                                        backgroundChatUser: '#E8DDD3',
                                                                                        textColor: '#374151',
                                                                                        customDataJson: functions.buildCustomDataJson(_model.reportType, _model.cardTypeName, _model.cardPrompt, _model.cardUiName, _model.boardUiName, _model.boardPrompt),
                                                                                        sessionId: _model.chatSessionID,
                                                                                        tenantId: _model.tenantID,
                                                                                        boardId: _model.boardID,
                                                                                        cardId: _model.cardID,
                                                                                        onMessageSentAction: (content) async {},
                                                                                        onMessageReceivedAction: (content) async {
                                                                                          _model.blueprintState = await BuilderUiStateTable().queryRows(
                                                                                            queryFn: (q) => q.eqOrNull(
                                                                                              'session_id',
                                                                                              _model.chatSessionID,
                                                                                            ),
                                                                                          );
                                                                                          _model.blueprintSections = _model.blueprintState!.firstOrNull!.blueprint.toList().cast<dynamic>();
                                                                                          _model.progressSummary = _model.blueprintState?.firstOrNull?.progressSummary;
                                                                                          _model.undoAvailable = _model.blueprintState?.firstOrNull?.undoAvailable;
                                                                                          _model.redoAvailable = _model.blueprintState?.firstOrNull?.redoAvailable;
                                                                                          _model.cardUiName = getJsonField(
                                                                                            _model.blueprintState?.firstOrNull?.blueprint,
                                                                                            r'''$[0].items[0].value''',
                                                                                          ).toString();
                                                                                          _model.cardUIDescrition = getJsonField(
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
                                                                thickness: 1.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                              ),
                                                              Flexible(
                                                                flex: 4,
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.5,
                                                                  height: double
                                                                      .infinity,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            60.0,
                                                                            6.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Summary',
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                      ),
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                              if (false)
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'View: ',
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
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, -1.0),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 8.0, 12.0, 8.0),
                                                                                        child: Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        'Progress:',
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
                                                                                    Text(
                                                                                      valueOrDefault<String>(
                                                                                        _model.progressSummary,
                                                                                        '<begin>',
                                                                                      ),
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
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 16.0, 12.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    if (_model.configType == 'ctd')
                                                                                      Container(
                                                                                        width: 228.0,
                                                                                        height: 154.0,
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
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(12.0, 10.0, 12.0, 12.0),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            _model.cardUiName,
                                                                                                            'name',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                font: GoogleFonts.inter(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                                ),
                                                                                                                fontSize: 16.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).labelSmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              _model.cardUIDescrition,
                                                                                                              'Description',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                  font: GoogleFonts.inter(
                                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                  ),
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 1.0,
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                child: Builder(
                                                                                                  builder: (context) => Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 4.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
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
                                                                                                                child: GeticonWidget(
                                                                                                                  cardUIName: _model.cardUiName,
                                                                                                                  iconCallback: (iconURL) async {
                                                                                                                    _model.cardUIURL = iconURL;
                                                                                                                    safeSetState(() {});
                                                                                                                  },
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                        child: Image.network(
                                                                                                          _model.cardUIURL!,
                                                                                                          width: 60.0,
                                                                                                          height: 60.0,
                                                                                                          fit: BoxFit.cover,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              if (_model.viewUsage ?? true)
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                                    child: Container(
                                                                                                      height: 24.0,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).alternate,
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
                                                                                                        borderRadius: BorderRadius.circular(2.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                          children: [
                                                                                                            Align(
                                                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                                              child: Text(
                                                                                                                '${_model.usageThresholdTextController2.text} this week',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      font: GoogleFonts.inter(
                                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
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
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: 154.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: <Widget>[].divide(SizedBox(width: 6.0)),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
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
                                                                                                                        await ReportTable().update(
                                                                                                                          data: {
                                                                                                                            'user_id': currentUserUid,
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
                                                                                                    ].divide(SizedBox(width: 6.0)),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 12.0)),
                                                                                              ),
                                                                                              if (_model.configType == 'ctd')
                                                                                                Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'Status',
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
                                                                                                          flex: 2,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: FlutterFlowDropDown<int>(
                                                                                                                  controller: _model.cardStatusValueController2 ??= FormFieldController<int>(
                                                                                                                    _model.cardStatusValue2 ??= _model.cardStatus,
                                                                                                                  ),
                                                                                                                  options: List<int>.from([0, 1, 2]),
                                                                                                                  optionLabels: ['Archive', 'Draft', 'Live'],
                                                                                                                  onChanged: (val) => safeSetState(() => _model.cardStatusValue2 = val),
                                                                                                                  width: 200.0,
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
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          flex: 1,
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.end,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  'View usage',
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
                                                                                                          flex: 2,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                                            children: [
                                                                                                              Theme(
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
                                                                                                                  value: _model.checkboxUsageValue ??= true,
                                                                                                                  onChanged: (newValue) async {
                                                                                                                    safeSetState(() => _model.checkboxUsageValue = newValue!);
                                                                                                                    if (newValue!) {
                                                                                                                      _model.viewUsage = !(_model.viewUsage ?? true);
                                                                                                                      safeSetState(() {});
                                                                                                                    }
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
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  'Threshold',
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
                                                                                                              Container(
                                                                                                                width: 50.0,
                                                                                                                child: TextFormField(
                                                                                                                  controller: _model.usageThresholdTextController2,
                                                                                                                  focusNode: _model.usageThresholdFocusNode2,
                                                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                                                    '_model.usageThresholdTextController2',
                                                                                                                    Duration(milliseconds: 2000),
                                                                                                                    () async {
                                                                                                                      _model.viewThreshold = int.tryParse(_model.usageThresholdTextController2.text);
                                                                                                                      safeSetState(() {});
                                                                                                                    },
                                                                                                                  ),
                                                                                                                  autofocus: false,
                                                                                                                  obscureText: false,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    isDense: true,
                                                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                                          font: GoogleFonts.inter(
                                                                                                                            fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                            fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                          ),
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FlutterFlowTheme.of(context).labelMedium.fontWeight,
                                                                                                                          fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                                                                                                                        ),
                                                                                                                    hintText: '#',
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
                                                                                                                  textAlign: TextAlign.center,
                                                                                                                  cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  enableInteractiveSelection: true,
                                                                                                                  validator: _model.usageThresholdTextController2Validator.asValidator(context),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 12.0)),
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
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final blueprintSummary = _model.blueprintSections.toList();

                                                                                    return ListView.separated(
                                                                                      padding: EdgeInsets.zero,
                                                                                      shrinkWrap: true,
                                                                                      scrollDirection: Axis.vertical,
                                                                                      itemCount: blueprintSummary.length,
                                                                                      separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                      itemBuilder: (context, blueprintSummaryIndex) {
                                                                                        final blueprintSummaryItem = blueprintSummary[blueprintSummaryIndex];
                                                                                        return Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                          child: Container(
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
                                                                            ].divide(SizedBox(height: 16.0)),
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
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
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
