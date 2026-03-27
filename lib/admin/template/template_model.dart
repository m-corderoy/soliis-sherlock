import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'template_widget.dart' show TemplateWidget;
import 'package:flutter/material.dart';

class TemplateModel extends FlutterFlowModel<TemplateWidget> {
  ///  Local state fields for this page.

  dynamic jsonSchemaSelected;

  ///  State fields for stateful widgets in this page.

  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;

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
