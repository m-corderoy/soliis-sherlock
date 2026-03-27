import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'dispatches_widget.dart' show DispatchesWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DispatchesModel extends FlutterFlowModel<DispatchesWidget> {
  ///  Local state fields for this page.

  ReportRow? selectedCard;

  bool? cardSelected;

  bool? phoneView;

  int? triageID = 0;

  List<dynamic> treeLocation = [];
  void addToTreeLocation(dynamic item) => treeLocation.add(item);
  void removeFromTreeLocation(dynamic item) => treeLocation.remove(item);
  void removeAtIndexFromTreeLocation(int index) => treeLocation.removeAt(index);
  void insertAtIndexInTreeLocation(int index, dynamic item) =>
      treeLocation.insert(index, item);
  void updateTreeLocationAtIndex(int index, Function(dynamic) updateFn) =>
      treeLocation[index] = updateFn(treeLocation[index]);

  List<dynamic> treeTeam = [];
  void addToTreeTeam(dynamic item) => treeTeam.add(item);
  void removeFromTreeTeam(dynamic item) => treeTeam.remove(item);
  void removeAtIndexFromTreeTeam(int index) => treeTeam.removeAt(index);
  void insertAtIndexInTreeTeam(int index, dynamic item) =>
      treeTeam.insert(index, item);
  void updateTreeTeamAtIndex(int index, Function(dynamic) updateFn) =>
      treeTeam[index] = updateFn(treeTeam[index]);

  List<int> selectedStatus = [0, 1, 2];
  void addToSelectedStatus(int item) => selectedStatus.add(item);
  void removeFromSelectedStatus(int item) => selectedStatus.remove(item);
  void removeAtIndexFromSelectedStatus(int index) =>
      selectedStatus.removeAt(index);
  void insertAtIndexInSelectedStatus(int index, int item) =>
      selectedStatus.insert(index, item);
  void updateSelectedStatusAtIndex(int index, Function(int) updateFn) =>
      selectedStatus[index] = updateFn(selectedStatus[index]);

  String? iconUrlPath;

  String? helpImagePath;

  bool? contentUpdated;

  bool? assetAwareState;

  bool? locationAwareState;

  DispatchUIStruct? optionsSelectedCard;
  void updateOptionsSelectedCardStruct(Function(DispatchUIStruct) updateFn) {
    updateFn(optionsSelectedCard ??= DispatchUIStruct());
  }

  Color? selectedColor;

  bool? newCard;

  int? paramInt1;

  int? selectedCardID = 0;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDownDashboard widget.
  int? dropDownDashboardValue;
  FormFieldController<int>? dropDownDashboardValueController;
  Completer<List<ReportRow>>? requestCompleter;
  // State field(s) for DropDownStatus widget.
  List<int>? dropDownStatusValue;
  FormFieldController<List<int>>? dropDownStatusValueController;
  // Stores action output result for [Backend Call - Insert Row] action in IconButton widget.
  ReportRow? newRecord;
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
  int? cardStatusValue;
  FormFieldController<int>? cardStatusValueController;
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
  FocusNode? usageThresholdFocusNode;
  TextEditingController? usageThresholdTextController;
  String? Function(BuildContext, String?)?
      usageThresholdTextControllerValidator;
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
  // State field(s) for extractionCheckbox widget.
  bool? extractionCheckboxValue;
  // State field(s) for DropDownTemplate widget.
  int? dropDownTemplateValue;
  FormFieldController<int>? dropDownTemplateValueController;
  bool isDataUploading_uploadDataHelpImageOrg = false;
  FFUploadedFile uploadedLocalFile_uploadDataHelpImageOrg =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataHelpImageOrg = '';

  // State field(s) for HelpText widget.
  FocusNode? helpTextFocusNode;
  TextEditingController? helpTextTextController;
  String? Function(BuildContext, String?)? helpTextTextControllerValidator;

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

    usageThresholdFocusNode?.dispose();
    usageThresholdTextController?.dispose();

    assetUIPromptTextFieldFocusNode?.dispose();
    assetUIPromptTextFieldTextController?.dispose();

    locationUIPromptTextFieldFocusNode?.dispose();
    locationUIPromptTextFieldTextController?.dispose();

    reportPromptTextFieldFocusNode?.dispose();
    reportPromptTextFieldTextController?.dispose();

    helpTextFocusNode?.dispose();
    helpTextTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
