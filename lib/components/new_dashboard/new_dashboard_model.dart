import '/flutter_flow/flutter_flow_util.dart';
import 'new_dashboard_widget.dart' show NewDashboardWidget;
import 'package:flutter/material.dart';

class NewDashboardModel extends FlutterFlowModel<NewDashboardWidget> {
  ///  Local state fields for this component.

  String? name;

  String? description;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for task widget.
  FocusNode? taskFocusNode;
  TextEditingController? taskTextController;
  String? Function(BuildContext, String?)? taskTextControllerValidator;
  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    taskFocusNode?.dispose();
    taskTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();
  }
}
