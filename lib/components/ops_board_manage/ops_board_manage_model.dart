import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ops_board_manage_widget.dart' show OpsBoardManageWidget;
import 'package:flutter/material.dart';

class OpsBoardManageModel extends FlutterFlowModel<OpsBoardManageWidget> {
  ///  Local state fields for this component.

  String? tenantPrompt;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Query Rows] action in opsBoardManage widget.
  List<OpsBoardRow>? opsBoardToEdit;
  // State field(s) for NameTextField widget.
  FocusNode? nameTextFieldFocusNode;
  TextEditingController? nameTextFieldTextController;
  String? Function(BuildContext, String?)? nameTextFieldTextControllerValidator;
  // State field(s) for DescriptionTextField widget.
  FocusNode? descriptionTextFieldFocusNode;
  TextEditingController? descriptionTextFieldTextController;
  String? Function(BuildContext, String?)?
      descriptionTextFieldTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for PromptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Insert Row] action in Button widget.
  OpsBoardRow? newTenantRecord;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameTextFieldFocusNode?.dispose();
    nameTextFieldTextController?.dispose();

    descriptionTextFieldFocusNode?.dispose();
    descriptionTextFieldTextController?.dispose();

    tabBarController?.dispose();
    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }
}
