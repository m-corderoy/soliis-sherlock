import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cms_setup80_widget.dart' show CmsSetup80Widget;
import 'package:flutter/material.dart';

class CmsSetup80Model extends FlutterFlowModel<CmsSetup80Widget> {
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
