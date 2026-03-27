import '/flutter_flow/flutter_flow_util.dart';
import 'new_team_nodeold_widget.dart' show NewTeamNodeoldWidget;
import 'package:flutter/material.dart';

class NewTeamNodeoldModel extends FlutterFlowModel<NewTeamNodeoldWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'New Node name is required';
    }

    if (val.length < 3) {
      return 'Nodes must be at least 3 characters';
    }

    return null;
  }

  // Stores action output result for [Validate Form] action in Button widget.
  bool? formValidated;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
