import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dashboard_builder_widget.dart' show DashboardBuilderWidget;
import 'package:flutter/material.dart';

class DashboardBuilderModel extends FlutterFlowModel<DashboardBuilderWidget> {
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

  ///  State fields for stateful widgets in this page.

  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDownOps widget.
  int? dropDownOpsValue;
  FormFieldController<int>? dropDownOpsValueController;
  // Stores action output result for [Backend Call - API (Init chat session)] action in IconButton widget.
  ApiCallResponse? chatInit1;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<OpsBoardRow>? getBTCid;
  // Stores action output result for [Backend Call - API (Init chat session)] action in IconButton widget.
  ApiCallResponse? chatInit2;
  // Stores action output result for [Backend Call - Query Rows] action in IconButton widget.
  List<BuilderUiStateRow>? renderCase2;
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

  @override
  void initState(BuildContext context) {
    supportmenuModel = createModel(context, () => SupportmenuModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    supportmenuModel.dispose();
    sideNavModel.dispose();
  }
}
