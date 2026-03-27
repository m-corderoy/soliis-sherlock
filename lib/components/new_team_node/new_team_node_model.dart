import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_team_node_widget.dart' show NewTeamNodeWidget;
import 'package:flutter/material.dart';

class NewTeamNodeModel extends FlutterFlowModel<NewTeamNodeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nodeName widget.
  FocusNode? nodeNameFocusNode;
  TextEditingController? nodeNameTextController;
  String? Function(BuildContext, String?)? nodeNameTextControllerValidator;
  String? _nodeNameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for TextFieldPath widget.
  FocusNode? textFieldPathFocusNode;
  TextEditingController? textFieldPathTextController;
  String? Function(BuildContext, String?)? textFieldPathTextControllerValidator;
  // Stores action output result for [Validate Form] action in ButtonCreate widget.
  bool? validateNewTeamNode;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  TeamRow? newNode;

  @override
  void initState(BuildContext context) {
    nodeNameTextControllerValidator = _nodeNameTextControllerValidator;
  }

  @override
  void dispose() {
    nodeNameFocusNode?.dispose();
    nodeNameTextController?.dispose();

    textFieldPathFocusNode?.dispose();
    textFieldPathTextController?.dispose();
  }
}
