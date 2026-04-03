import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'card_builder_widget.dart' show CardBuilderWidget;
import 'package:flutter/material.dart';

class CardBuilderModel extends FlutterFlowModel<CardBuilderWidget> {
  ///  Local state fields for this page.

  String? chatSessionID;

  bool? codeViewMode;

  bool? showChat;

  int? boardID;

  int? cardID;

  int? tenantID = -1;

  String? configType;

  List<dynamic> blueprintSections = [];
  void addToBlueprintSections(dynamic item) => blueprintSections.add(item);
  void removeFromBlueprintSections(dynamic item) =>
      blueprintSections.remove(item);
  void removeAtIndexFromBlueprintSections(int index) =>
      blueprintSections.removeAt(index);
  void insertAtIndexInBlueprintSections(int index, dynamic item) =>
      blueprintSections.insert(index, item);
  void updateBlueprintSectionsAtIndex(int index, Function(dynamic) updateFn) =>
      blueprintSections[index] = updateFn(blueprintSections[index]);

  String? progressSummary;

  bool? undoAvailable;

  bool? redoAvailable;

  int? reportType = 0;

  String? cardTypeName;

  String? cardPrompt;

  String? cardUiName;

  String? boardUiName;

  String? boardPrompt;

  int? actionCase = 0;

  bool? isPublished;

  String? cardUIDescrition;

  String? chatPrompt1;

  String? chatPrompt2;

  String? cardUIURL;

  String? aiUpdates;

  bool? animationShow;

  int? cardStatus = -1;

  bool? viewUsage;

  int? viewThreshold = 5;

  /// AI or phone
  String? viewMode;

  bool cardSelected = true;

  bool? phoneView;

  bool? contentUpdated;

  bool? assetAwareState;

  bool? locationAwareState;

  bool? newCard;

  ReportRow? selectedCard;

  String? helipImagePath;

  int? cardType;

  String? iconUrlPath;

  List<ReportRow> reportRows = [];
  void addToReportRows(ReportRow item) => reportRows.add(item);
  void removeFromReportRows(ReportRow item) => reportRows.remove(item);
  void removeAtIndexFromReportRows(int index) => reportRows.removeAt(index);
  void insertAtIndexInReportRows(int index, ReportRow item) =>
      reportRows.insert(index, item);
  void updateReportRowsAtIndex(int index, Function(ReportRow) updateFn) =>
      reportRows[index] = updateFn(reportRows[index]);

  ///  State fields for stateful widgets in this page.

  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDownOps widget.
  int? dropDownOpsValue;
  FormFieldController<int>? dropDownOpsValueController;
  // Stores action output result for [Backend Call - Query Rows] action in DropDownOps widget.
  List<ReportRow>? reportQuery;
  // Stores action output result for [Backend Call - API (Init chat session)] action in NewCardContainer widget.
  ApiCallResponse? chatInit3;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<ReportRow>? getSchemaID;
  // Stores action output result for [Backend Call - API (Init chat session)] action in IconButton widget.
  ApiCallResponse? chatInit4;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<BuilderUiStateRow>? renderCase4;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for cardType widget.
  int? cardTypeValue;
  FormFieldController<int>? cardTypeValueController;
  // State field(s) for cardStatus widget.
  int? cardStatusValue1;
  FormFieldController<int>? cardStatusValueController1;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for SummaryTextField widget.
  FocusNode? summaryTextFieldFocusNode;
  TextEditingController? summaryTextFieldTextController;
  String? Function(BuildContext, String?)?
      summaryTextFieldTextControllerValidator;
  bool isDataUploading_uploadDataSlg = false;
  FFUploadedFile uploadedLocalFile_uploadDataSlg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataSlg = '';

  // State field(s) for showUsage widget.
  bool? showUsageValue;
  // State field(s) for usageThreshold widget.
  FocusNode? usageThresholdFocusNode1;
  TextEditingController? usageThresholdTextController1;
  String? Function(BuildContext, String?)?
      usageThresholdTextController1Validator;
  // State field(s) for assetSwitch widget.
  bool? assetSwitchValue;
  // State field(s) for assetType widget.
  int? assetTypeValue;
  FormFieldController<int>? assetTypeValueController;
  // State field(s) for assetUIPromptTextField widget.
  FocusNode? assetUIPromptTextFieldFocusNode;
  TextEditingController? assetUIPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      assetUIPromptTextFieldTextControllerValidator;
  // State field(s) for locationSwitch widget.
  bool? locationSwitchValue;
  // State field(s) for locationType widget.
  int? locationTypeValue;
  FormFieldController<int>? locationTypeValueController;
  // State field(s) for locationUIPromptTextField widget.
  FocusNode? locationUIPromptTextFieldFocusNode;
  TextEditingController? locationUIPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      locationUIPromptTextFieldTextControllerValidator;
  // State field(s) for ReportPromptTextField widget.
  FocusNode? reportPromptTextFieldFocusNode;
  TextEditingController? reportPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      reportPromptTextFieldTextControllerValidator;
  bool isDataUploading_uploadDataHelpImageOrg = false;
  FFUploadedFile uploadedLocalFile_uploadDataHelpImageOrg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataHelpImageOrg = '';

  // State field(s) for HelpText widget.
  FocusNode? helpTextFocusNode;
  TextEditingController? helpTextTextController;
  String? Function(BuildContext, String?)? helpTextTextControllerValidator;
  // Stores action output result for [Backend Call - Query Rows] action in N8nChatUiWidget2 widget.
  List<BuilderUiStateRow>? blueprintState;
  // Stores action output result for [Backend Call - Query Rows] action in undoIconButton widget.
  List<BuilderUiStateRow>? undoAction;
  // Stores action output result for [Backend Call - Query Rows] action in redoIconButton widget.
  List<BuilderUiStateRow>? redoAction;
  // Stores action output result for [Backend Call - Insert Row] action in publishIconButton widget.
  OpsBoardRow? newOpsRow;
  // Stores action output result for [Custom Action - publishCommand] action in publishIconButton widget.
  dynamic publishReturnC1;
  // Stores action output result for [Custom Action - publishCommand] action in publishIconButton widget.
  dynamic publishReturnC234;
  // Stores action output result for [Backend Call - Query Rows] action in publishIconButton widget.
  List<BuilderUiStateRow>? publishAction;
  // State field(s) for cardStatus widget.
  int? cardStatusValue2;
  FormFieldController<int>? cardStatusValueController2;
  // State field(s) for CheckboxUsage widget.
  bool? checkboxUsageValue;
  // State field(s) for usageThreshold widget.
  FocusNode? usageThresholdFocusNode2;
  TextEditingController? usageThresholdTextController2;
  String? Function(BuildContext, String?)?
      usageThresholdTextController2Validator;

  @override
  void initState(BuildContext context) {
    supportmenuModel = createModel(context, () => SupportmenuModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    supportmenuModel.dispose();
    sideNavModel.dispose();
    tabBarController?.dispose();
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    summaryTextFieldFocusNode?.dispose();
    summaryTextFieldTextController?.dispose();

    usageThresholdFocusNode1?.dispose();
    usageThresholdTextController1?.dispose();

    assetUIPromptTextFieldFocusNode?.dispose();
    assetUIPromptTextFieldTextController?.dispose();

    locationUIPromptTextFieldFocusNode?.dispose();
    locationUIPromptTextFieldTextController?.dispose();

    reportPromptTextFieldFocusNode?.dispose();
    reportPromptTextFieldTextController?.dispose();

    helpTextFocusNode?.dispose();
    helpTextTextController?.dispose();

    usageThresholdFocusNode2?.dispose();
    usageThresholdTextController2?.dispose();
  }
}
