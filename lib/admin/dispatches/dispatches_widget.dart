import '/auth/base_auth_user_provider.dart';
import '/backend/supabase/supabase.dart';
import '/components/new_dispatch_card/new_dispatch_card_widget.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/components/tree_components/location/location_tree_dropdown/location_tree_dropdown_widget.dart';
import '/components/tree_components/team/team_tree_dropdown/team_tree_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/index.dart';
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dispatches_model.dart';
export 'dispatches_model.dart';

class DispatchesWidget extends StatefulWidget {
  const DispatchesWidget({super.key});

  static String routeName = 'dispatches';
  static String routePath = '/dispatches';

  @override
  State<DispatchesWidget> createState() => _DispatchesWidgetState();
}

class _DispatchesWidgetState extends State<DispatchesWidget>
    with TickerProviderStateMixin {
  late DispatchesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DispatchesModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (loggedIn == true) {
        _model.cardSelected = false;
        _model.phoneView = true;
        _model.contentUpdated = false;
        _model.assetAwareState = false;
        _model.locationAwareState = false;
        _model.newCard = false;
        safeSetState(() {});
      } else {
        context.pushNamed(LoginMainWidget.routeName);
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.nameTextFieldTextController ??= TextEditingController();
    _model.nameTextFieldFocusNode ??= FocusNode();

    _model.summaryTextFieldTextController ??= TextEditingController();
    _model.summaryTextFieldFocusNode ??= FocusNode();

    _model.usageThresholdTextController ??= TextEditingController();
    _model.usageThresholdFocusNode ??= FocusNode();

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

    animationsMap.addAll({
      'iconButtonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(1.2, 1.2),
            end: Offset(1.0, 1.0),
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {
          _model.usageThresholdTextController?.text = '5';
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
        body: SafeArea(
          top: true,
          child: Container(
            decoration: BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 5.0, 0.0, 0.0),
                          child: wrapWithModel(
                            model: _model.supportmenuModel,
                            updateCallback: () => safeSetState(() {}),
                            child: SupportmenuWidget(),
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
                          selectedNav: 45,
                          contentWarning: false,
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<List<LocationRow>>(
                          future: LocationTable().querySingleRow(
                            queryFn: (q) => q.eqOrNull(
                              'id',
                              FFAppState().dispatchUIcontrol.selectedLocation,
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
                            List<LocationRow>
                                locationDBContainerLocationRowList =
                                snapshot.data!;

                            final locationDBContainerLocationRow =
                                locationDBContainerLocationRowList.isNotEmpty
                                    ? locationDBContainerLocationRowList.first
                                    : null;

                            return Container(
                              decoration: BoxDecoration(),
                              child: FutureBuilder<List<TeamRow>>(
                                future: TeamTable().querySingleRow(
                                  queryFn: (q) => q.eqOrNull(
                                    'id',
                                    FFAppState().dispatchUIcontrol.selectedTeam,
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
                                  List<TeamRow> teamDBContainerTeamRowList =
                                      snapshot.data!;

                                  final teamDBContainerTeamRow =
                                      teamDBContainerTeamRowList.isNotEmpty
                                          ? teamDBContainerTeamRowList.first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(),
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<FormSchemaRow>
                                            formTemplatesContainerFormSchemaRowList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  decoration: BoxDecoration(),
                                                  child: FutureBuilder<
                                                      List<OpsBoardRow>>(
                                                    future: OpsBoardTable()
                                                        .queryRows(
                                                      queryFn: (q) => q
                                                          .eqOrNull(
                                                            'tenant_id',
                                                            FFAppState()
                                                                .session
                                                                .tenantID,
                                                          )
                                                          .order('created_at'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            child:
                                                                CircularProgressIndicator(
                                                              valueColor:
                                                                  AlwaysStoppedAnimation<
                                                                      Color>(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<OpsBoardRow>
                                                          containerOpsBoardOpsBoardRowList =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: FutureBuilder<
                                                            List<ReportRow>>(
                                                          future: (_model
                                                                      .requestCompleter ??=
                                                                  Completer<
                                                                      List<
                                                                          ReportRow>>()
                                                                    ..complete(
                                                                        ReportTable()
                                                                            .queryRows(
                                                                      queryFn: (q) => q
                                                                          .eqOrNull(
                                                                            'tenant_id',
                                                                            FFAppState().session.tenantID,
                                                                          )
                                                                          .eqOrNull(
                                                                            'ops_board_id',
                                                                            _model.dropDownDashboardValue,
                                                                          )
                                                                          .inFilterOrNull(
                                                                            'status',
                                                                            _model.selectedStatus,
                                                                          )
                                                                          .order('id'),
                                                                    )))
                                                              .future,
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<ReportRow>
                                                                containerReportDBReportRowList =
                                                                snapshot.data!;

                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8.0,
                                                                        24.0,
                                                                        16.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          FlutterFlowDropDown<int>(
                                                                                            controller: _model.dropDownDashboardValueController ??= FormFieldController<int>(
                                                                                              _model.dropDownDashboardValue ??= null,
                                                                                            ),
                                                                                            options: List<int>.from(containerOpsBoardOpsBoardRowList.map((e) => e.id).toList()),
                                                                                            optionLabels: containerOpsBoardOpsBoardRowList.map((e) => e.name).toList(),
                                                                                            onChanged: (val) async {
                                                                                              safeSetState(() => _model.dropDownDashboardValue = val);
                                                                                              safeSetState(() => _model.requestCompleter = null);
                                                                                              await _model.waitForRequestCompleted();
                                                                                            },
                                                                                            width: 280.0,
                                                                                            height: 40.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
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
                                                                                          FlutterFlowDropDown<int>(
                                                                                            multiSelectController: _model.dropDownStatusValueController ??= FormListFieldController<int>(_model.dropDownStatusValue ??= List<int>.from(
                                                                                              _model.selectedStatus ?? [],
                                                                                            )),
                                                                                            options: List<int>.from([2, 1, 0]),
                                                                                            optionLabels: [
                                                                                              'Live',
                                                                                              'Draft',
                                                                                              'Archive'
                                                                                            ],
                                                                                            width: 170.0,
                                                                                            height: 40.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.inter(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                            hintText: 'Select Card Status...',
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
                                                                                            isMultiSelect: true,
                                                                                            onMultiSelectChanged: (val) async {
                                                                                              safeSetState(() => _model.dropDownStatusValue = val);
                                                                                              _model.selectedStatus = _model.dropDownStatusValue!.toList().cast<int>();
                                                                                              safeSetState(() {});
                                                                                              safeSetState(() => _model.requestCompleter = null);
                                                                                              await _model.waitForRequestCompleted();
                                                                                            },
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                      ),
                                                                                      if (FFAppState().session.dispatchAdmin >= 3)
                                                                                        Builder(
                                                                                          builder: (context) => FlutterFlowIconButton(
                                                                                            borderRadius: 8.0,
                                                                                            buttonSize: 40.0,
                                                                                            fillColor: FlutterFlowTheme.of(context).alternate,
                                                                                            icon: Icon(
                                                                                              Icons.playlist_add,
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
                                                                                                      child: NewDispatchCardWidget(
                                                                                                        newCard: false,
                                                                                                        cardType: 0,
                                                                                                        carddescription: null,
                                                                                                        executeNewCard: (newCard, cardType, cardDescription, cartTypeName, cardUiName) async {
                                                                                                          _model.newRecord = await ReportTable().insert({
                                                                                                            'tenant_id': FFAppState().session.tenantID,
                                                                                                            'ops_board_id': _model.dropDownDashboardValue,
                                                                                                            'report_type': cardType,
                                                                                                            'status': 1,
                                                                                                          });
                                                                                                          _model.selectedCard = _model.newRecord;
                                                                                                          _model.cardSelected = true;
                                                                                                          _model.triageID = _model.newRecord?.id;
                                                                                                          _model.iconUrlPath = _model.newRecord?.urlIcon;
                                                                                                          _model.helpImagePath = _model.newRecord?.helpImage;
                                                                                                          _model.contentUpdated = true;
                                                                                                          _model.assetAwareState = _model.newRecord?.assetAware;
                                                                                                          _model.locationAwareState = _model.newRecord?.locationAware;
                                                                                                          _model.newCard = true;
                                                                                                          _model.paramInt1 = _model.newRecord?.paramInt1;
                                                                                                          safeSetState(() {});
                                                                                                          FFAppState().updateDispatchUIeditStruct(
                                                                                                            (e) => e
                                                                                                              ..selectedLocation = _model.newRecord?.locationSelectedLocation
                                                                                                              ..selectedTeam = _model.newRecord?.teamSelectedTeam,
                                                                                                          );
                                                                                                          safeSetState(() {});
                                                                                                          safeSetState(() {
                                                                                                            _model.cardTypeValueController?.value = cardType;
                                                                                                            _model.cardTypeValue = cardType;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.cardStatusValueController?.value = 1;
                                                                                                            _model.cardStatusValue = 1;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.nameTextFieldTextController?.text = _model.newRecord!.name;
                                                                                                            _model.nameTextFieldFocusNode?.requestFocus();
                                                                                                            WidgetsBinding.instance.addPostFrameCallback((_) {
                                                                                                              _model.nameTextFieldTextController?.selection = const TextSelection.collapsed(offset: 0);
                                                                                                            });
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.summaryTextFieldTextController?.text = _model.newRecord!.uiDescription!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.helpTextTextController?.text = _model.newRecord!.helptext!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.reportPromptTextFieldTextController?.text = _model.newRecord!.prompt!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.assetTypeValueController?.value = _model.newRecord!.assetValue!;
                                                                                                            _model.assetTypeValue = _model.newRecord!.assetValue!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.locationTypeValueController?.value = _model.newRecord!.locationValue!;
                                                                                                            _model.locationTypeValue = _model.newRecord!.locationValue!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.assetSwitchValue = _model.newRecord!.assetAware!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.locationSwitchValue = _model.newRecord!.locationAware!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.assetUIPromptTextFieldTextController?.text = _model.newRecord!.assetNameDescription!;
                                                                                                          });
                                                                                                          safeSetState(() {
                                                                                                            _model.locationUIPromptTextFieldTextController?.text = _model.newRecord!.locationNameDescription!;
                                                                                                          });
                                                                                                          safeSetState(() => _model.requestCompleter = null);
                                                                                                          await _model.waitForRequestCompleted(maxWait: 2000);
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              );

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                  ),
                                                                                ),
                                                                                Divider(
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 320.0,
                                                                                      height: 696.0,
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
                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                bottomRight: Radius.circular(0.0),
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
                                                                                                        onPressed: () async {
                                                                                                          HapticFeedback.mediumImpact();
                                                                                                          scaffoldKey.currentState!.openEndDrawer();
                                                                                                        },
                                                                                                      ).animateOnPageLoad(animationsMap['iconButtonOnPageLoadAnimation']!),
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
                                                                                          if (_model.dropDownDashboardValue != null)
                                                                                            Expanded(
                                                                                              child: Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 4.0),
                                                                                                  child: Builder(
                                                                                                    builder: (context) {
                                                                                                      final phoneGrid = containerReportDBReportRowList.toList();

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
                                                                                                        itemCount: phoneGrid.length,
                                                                                                        itemBuilder: (context, phoneGridIndex) {
                                                                                                          final phoneGridItem = phoneGrid[phoneGridIndex];
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
                                                                                                                      'status': _model.cardStatusValue,
                                                                                                                      'report_type': _model.cardTypeValue,
                                                                                                                      'prompt': _model.reportPromptTextFieldTextController.text,
                                                                                                                      'helptext': _model.helpTextTextController.text,
                                                                                                                      'helpImage': _model.helpImagePath,
                                                                                                                      'assetAware': _model.assetSwitchValue,
                                                                                                                      'locationAware': _model.locationSwitchValue,
                                                                                                                      'assetValue': _model.assetTypeValue,
                                                                                                                      'locationValue': _model.locationTypeValue,
                                                                                                                      'assetNameDescription': _model.assetUIPromptTextFieldTextController.text,
                                                                                                                      'locationNameDescription': _model.locationUIPromptTextFieldTextController.text,
                                                                                                                      'url_icon': _model.iconUrlPath,
                                                                                                                      'showCounter': _model.showUsageValue,
                                                                                                                      'counterThreshold': int.tryParse(_model.usageThresholdTextController.text),
                                                                                                                    },
                                                                                                                    matchingRows: (rows) => rows.eqOrNull(
                                                                                                                      'id',
                                                                                                                      _model.selectedCard?.id,
                                                                                                                    ),
                                                                                                                  );
                                                                                                                  safeSetState(() => _model.requestCompleter = null);
                                                                                                                  await _model.waitForRequestCompleted();
                                                                                                                }
                                                                                                              }
                                                                                                              _model.selectedCard = phoneGridItem;
                                                                                                              _model.cardSelected = true;
                                                                                                              _model.triageID = phoneGridItem.id;
                                                                                                              _model.iconUrlPath = phoneGridItem.urlIcon;
                                                                                                              _model.helpImagePath = phoneGridItem.helpImage;
                                                                                                              _model.contentUpdated = false;
                                                                                                              _model.assetAwareState = phoneGridItem.assetAware;
                                                                                                              _model.locationAwareState = phoneGridItem.locationAware;
                                                                                                              _model.paramInt1 = phoneGridItem.paramInt1;
                                                                                                              _model.selectedCardID = phoneGridItem.id;
                                                                                                              safeSetState(() {});
                                                                                                              FFAppState().updateDispatchUIeditStruct(
                                                                                                                (e) => e
                                                                                                                  ..selectedLocation = phoneGridItem.locationSelectedLocation
                                                                                                                  ..selectedTeam = phoneGridItem.teamSelectedTeam,
                                                                                                              );
                                                                                                              safeSetState(() {});
                                                                                                              safeSetState(() {
                                                                                                                _model.nameTextFieldTextController?.text = phoneGridItem.name;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.summaryTextFieldTextController?.text = phoneGridItem.uiDescription!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.helpTextTextController?.text = phoneGridItem.helptext!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.reportPromptTextFieldTextController?.text = phoneGridItem.prompt!;
                                                                                                              });
                                                                                                              if (_model.assetAwareState == true) {
                                                                                                                safeSetState(() {
                                                                                                                  _model.assetTypeValueController?.value = phoneGridItem.assetValue!;
                                                                                                                  _model.assetTypeValue = phoneGridItem.assetValue!;
                                                                                                                });
                                                                                                              } else {
                                                                                                                safeSetState(() {
                                                                                                                  _model.assetTypeValueController?.value = 0;
                                                                                                                  _model.assetTypeValue = 0;
                                                                                                                });
                                                                                                              }

                                                                                                              if (_model.locationAwareState!) {
                                                                                                                safeSetState(() {
                                                                                                                  _model.locationTypeValueController?.value = phoneGridItem.locationValue!;
                                                                                                                  _model.locationTypeValue = phoneGridItem.locationValue!;
                                                                                                                });
                                                                                                              } else {
                                                                                                                safeSetState(() {
                                                                                                                  _model.locationTypeValueController?.value = 0;
                                                                                                                  _model.locationTypeValue = 0;
                                                                                                                });
                                                                                                              }

                                                                                                              safeSetState(() {
                                                                                                                _model.assetSwitchValue = phoneGridItem.assetAware!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.locationSwitchValue = phoneGridItem.locationAware!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.assetUIPromptTextFieldTextController?.text = phoneGridItem.assetNameDescription!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.locationUIPromptTextFieldTextController?.text = phoneGridItem.locationNameDescription!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.showUsageValue = phoneGridItem.showCounter!;
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.usageThresholdTextController?.text = phoneGridItem.counterThreshold!.toString();
                                                                                                              });
                                                                                                              safeSetState(() {
                                                                                                                _model.cardTypeValueController?.value = phoneGridItem.reportType!;
                                                                                                                _model.cardTypeValue = phoneGridItem.reportType!;
                                                                                                              });
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
                                                                                                                                valueOrDefault<String>(
                                                                                                                                  phoneGridItem.name,
                                                                                                                                  'Title',
                                                                                                                                ),
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
                                                                                                                                    phoneGridItem.uiDescription,
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
                                                                                                                            phoneGridItem.urlIcon!,
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
                                                                                                bottomLeft: Radius.circular(28.0),
                                                                                                bottomRight: Radius.circular(28.0),
                                                                                                topLeft: Radius.circular(24.0),
                                                                                                topRight: Radius.circular(24.0),
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
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    VerticalDivider(
                                                                      thickness:
                                                                          1.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                    Flexible(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      if (_model.selectedCard?.reportType == 0)
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.warning_amber_rounded,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Alert Dispatch Card',
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
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (_model.selectedCard?.reportType == 1)
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.camera_alt,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          'Photo  Dispatch Card',
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
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (_model.selectedCard?.reportType == 2)
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.keyboard_voice,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Voice Note Dispatch Card',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.inter(
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                              ),
                                                                                                              fontSize: 18.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w500,
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
                                                                                      if (_model.selectedCard?.reportType == 3)
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Icon(
                                                                                              Icons.text_snippet_outlined,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 32.0,
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Form Dispatch Card',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.inter(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      fontSize: 18.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      if (_model.selectedCard?.reportType == 4)
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.translate,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Interpreter',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      if (_model.selectedCard?.reportType == 5)
                                                                                        Expanded(
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Icon(
                                                                                                Icons.support_agent,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                size: 40.0,
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Support',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.inter(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                        fontSize: 18.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      FFButtonWidget(
                                                                                        onPressed: () async {
                                                                                          await ReportTable().update(
                                                                                            data: {
                                                                                              'name': _model.nameTextFieldTextController.text,
                                                                                              'ui_description': _model.selectedCard?.uiDescription,
                                                                                              'status': _model.cardStatusValue,
                                                                                              'report_type': _model.cardTypeValue,
                                                                                              'prompt': _model.reportPromptTextFieldTextController.text,
                                                                                              'helptext': _model.helpTextTextController.text,
                                                                                              'helpImage': _model.helpImagePath,
                                                                                              'assetAware': _model.assetSwitchValue,
                                                                                              'locationAware': _model.locationSwitchValue,
                                                                                              'assetValue': _model.assetTypeValue,
                                                                                              'locationValue': _model.locationTypeValue,
                                                                                              'assetNameDescription': _model.assetUIPromptTextFieldTextController.text,
                                                                                              'locationNameDescription': _model.locationUIPromptTextFieldTextController.text,
                                                                                              'url_icon': _model.iconUrlPath,
                                                                                              'showCounter': _model.showUsageValue,
                                                                                              'counterThreshold': int.tryParse(_model.usageThresholdTextController.text),
                                                                                            },
                                                                                            matchingRows: (rows) => rows.eqOrNull(
                                                                                              'id',
                                                                                              _model.selectedCard?.id,
                                                                                            ),
                                                                                          );
                                                                                          _model.contentUpdated = false;
                                                                                          safeSetState(() {});
                                                                                          safeSetState(() => _model.requestCompleter = null);
                                                                                          await _model.waitForRequestCompleted();
                                                                                        },
                                                                                        text: 'Save',
                                                                                        options: FFButtonOptions(
                                                                                          width: 80.0,
                                                                                          height: 32.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.inter(
                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                ),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 12.0)),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Divider(
                                                                              thickness: 1.0,
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            Expanded(
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  if (_model.cardSelected ?? false) {
                                                                                    return Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                      ),
                                                                                      child: FutureBuilder<List<ReportRow>>(
                                                                                        future: ReportTable().querySingleRow(
                                                                                          queryFn: (q) => q.eqOrNull(
                                                                                            'id',
                                                                                            _model.selectedCardID,
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
                                                                                          List<ReportRow> containerReportRowList = snapshot.data!;

                                                                                          final containerReportRow = containerReportRowList.isNotEmpty ? containerReportRowList.first : null;

                                                                                          return Container(
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Form(
                                                                                              key: _model.formKey,
                                                                                              autovalidateMode: AutovalidateMode.disabled,
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                child: Column(
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
                                                                                                                child: Icon(
                                                                                                                  Icons.send_sharp,
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
                                                                                                                                              bottomRight: Radius.circular(0.0),
                                                                                                                                              topLeft: Radius.circular(0.0),
                                                                                                                                              topRight: Radius.circular(0.0),
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
                                                                                                                                                controller: _model.cardStatusValueController ??= FormFieldController<int>(
                                                                                                                                                  _model.cardStatusValue ??= _model.selectedCard?.status,
                                                                                                                                                ),
                                                                                                                                                options: List<int>.from([0, 1, 2]),
                                                                                                                                                optionLabels: ['Archive', 'Draft', 'Live'],
                                                                                                                                                onChanged: (val) async {
                                                                                                                                                  safeSetState(() => _model.cardStatusValue = val);
                                                                                                                                                  if ((_model.cardStatusValue != _model.selectedCard?.status) && (_model.contentUpdated == false)) {
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

                                                                                                                                                        _model.iconUrlPath = _model.uploadedFileUrl_uploadDataSlg;
                                                                                                                                                        _model.contentUpdated = true;
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
                                                                                                                                                  controller: _model.usageThresholdTextController,
                                                                                                                                                  focusNode: _model.usageThresholdFocusNode,
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
                                                                                                                                                  validator: _model.usageThresholdTextControllerValidator.asValidator(context),
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
                                                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                                                                              optionLabels: ['Free text', 'QR Code / Barcode', 'Vehicle Registration Plate'],
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
                                                                                                                                                  if ((_model.locationTypeValue != _model.selectedCard?.locationValue) && (_model.contentUpdated == false)) {
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
                                                                                                                                  value: _model.extractionCheckboxValue ??= true,
                                                                                                                                  onChanged: (newValue) async {
                                                                                                                                    safeSetState(() => _model.extractionCheckboxValue = newValue!);
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
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                                child: Text(
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
                                                                                                                          Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Icon(
                                                                                                                                  Icons.text_snippet_outlined,
                                                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                                  size: 32.0,
                                                                                                                                ),
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: FlutterFlowDropDown<int>(
                                                                                                                                    controller: _model.dropDownTemplateValueController ??= FormFieldController<int>(
                                                                                                                                      _model.dropDownTemplateValue ??= _model.selectedCard?.paramInt1,
                                                                                                                                    ),
                                                                                                                                    options: List<int>.from(formTemplatesContainerFormSchemaRowList.map((e) => e.id).toList()),
                                                                                                                                    optionLabels: formTemplatesContainerFormSchemaRowList.map((e) => e.title).toList(),
                                                                                                                                    onChanged: (val) async {
                                                                                                                                      safeSetState(() => _model.dropDownTemplateValue = val);
                                                                                                                                      _model.paramInt1 = _model.dropDownTemplateValue;
                                                                                                                                      safeSetState(() {});
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    width: 300.0,
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
                                                                                                                                    hintText: 'Select data extraction template...',
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
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                                                  child: FFButtonWidget(
                                                                                                                                    onPressed: () async {
                                                                                                                                      _model.paramInt1 = 0;
                                                                                                                                      _model.contentUpdated = true;
                                                                                                                                      safeSetState(() {
                                                                                                                                        _model.dropDownTemplateValueController?.value = _model.paramInt1!;
                                                                                                                                        _model.dropDownTemplateValue = _model.paramInt1!;
                                                                                                                                      });
                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    text: 'Clear',
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
                                                                                                                              ],
                                                                                                                            ),
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
                                                                                                                                _model.helpImagePath!,
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
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return Container(
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          16.0)),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
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
