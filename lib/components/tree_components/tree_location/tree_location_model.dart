import '/backend/api_requests/api_calls.dart';
import '/components/tree_components/tree_location/tree_location_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tree_location_widget.dart' show TreeLocationWidget;
import 'package:flutter/material.dart';

class TreeLocationModel extends FlutterFlowModel<TreeLocationWidget> {
  ///  Local state fields for this component.

  List<dynamic> treedatalocation = [];
  void addToTreedatalocation(dynamic item) => treedatalocation.add(item);
  void removeFromTreedatalocation(dynamic item) =>
      treedatalocation.remove(item);
  void removeAtIndexFromTreedatalocation(int index) =>
      treedatalocation.removeAt(index);
  void insertAtIndexInTreedatalocation(int index, dynamic item) =>
      treedatalocation.insert(index, item);
  void updateTreedatalocationAtIndex(int index, Function(dynamic) updateFn) =>
      treedatalocation[index] = updateFn(treedatalocation[index]);

  bool viewchildren = true;

  bool haschildren = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTree)] action in TreeLocation widget.
  ApiCallResponse? apiGetChildren;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
