import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'testdropdown_widget.dart' show TestdropdownWidget;
import 'package:flutter/material.dart';

class TestdropdownModel extends FlutterFlowModel<TestdropdownWidget> {
  ///  Local state fields for this page.

  int? seletioID;

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
