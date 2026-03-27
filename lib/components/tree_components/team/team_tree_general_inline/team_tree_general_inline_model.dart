import '/backend/api_requests/api_calls.dart';
import '/components/tree_components/team/team_tree_general_inline/team_tree_general_inline_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'team_tree_general_inline_widget.dart' show TeamTreeGeneralInlineWidget;
import 'package:flutter/material.dart';

class TeamTreeGeneralInlineModel
    extends FlutterFlowModel<TeamTreeGeneralInlineWidget> {
  ///  Local state fields for this component.

  List<dynamic> treedatateam = [];
  void addToTreedatateam(dynamic item) => treedatateam.add(item);
  void removeFromTreedatateam(dynamic item) => treedatateam.remove(item);
  void removeAtIndexFromTreedatateam(int index) => treedatateam.removeAt(index);
  void insertAtIndexInTreedatateam(int index, dynamic item) =>
      treedatateam.insert(index, item);
  void updateTreedatateamAtIndex(int index, Function(dynamic) updateFn) =>
      treedatateam[index] = updateFn(treedatateam[index]);

  bool viewchildren = true;

  bool haschildren = true;

  int? selectedNodeID = 0;

  int? selectedOperation = 0;

  bool? selectedUpdateNeeded;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTeam)] action in teamTreeGeneralInline widget.
  ApiCallResponse? apiGetTeamChildren;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
