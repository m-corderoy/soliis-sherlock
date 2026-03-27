import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'org_setup40_widget.dart' show OrgSetup40Widget;
import 'package:flutter/material.dart';

class OrgSetup40Model extends FlutterFlowModel<OrgSetup40Widget> {
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
