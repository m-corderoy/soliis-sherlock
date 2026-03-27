import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'report_setup60_widget.dart' show ReportSetup60Widget;
import 'package:flutter/material.dart';

class ReportSetup60Model extends FlutterFlowModel<ReportSetup60Widget> {
  ///  Local state fields for this page.

  int? triageID = 0;

  ///  State fields for stateful widgets in this page.

  // Model for sideNavAdmin component.
  late SideNavAdminModel sideNavAdminModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavAdminModel = createModel(context, () => SideNavAdminModel());
  }

  @override
  void dispose() {
    sideNavAdminModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
