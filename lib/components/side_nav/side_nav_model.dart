import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_widget.dart' show SideNavWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class SideNavModel extends FlutterFlowModel<SideNavWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for MouseRegionTenant widget.
  bool mouseRegionTenantHovered = false;
  // State field(s) for MouseRegionAI widget.
  bool mouseRegionAIHovered1 = false;
  // State field(s) for MouseRegionOrd widget.
  bool mouseRegionOrdHovered1 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for MouseRegionOrd widget.
  bool mouseRegionOrdHovered2 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // State field(s) for MouseRegionOrd widget.
  bool mouseRegionOrdHovered3 = false;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // State field(s) for MouseRegionTenant1 widget.
  bool mouseRegionTenant1Hovered = false;
  // State field(s) for MouseRegionTenants widget.
  bool mouseRegionTenantsHovered = false;
  // State field(s) for MouseRegionAI widget.
  bool mouseRegionAIHovered2 = false;
  // State field(s) for MouseRegionOrdcol widget.
  bool mouseRegionOrdcolHovered1 = false;
  // State field(s) for MouseRegionOrdcol widget.
  bool mouseRegionOrdcolHovered2 = false;
  // State field(s) for MouseRegionOrdcol widget.
  bool mouseRegionOrdcolHovered3 = false;
  // State field(s) for MouseRegionTenant2 widget.
  bool mouseRegionTenant2Hovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
  }
}
