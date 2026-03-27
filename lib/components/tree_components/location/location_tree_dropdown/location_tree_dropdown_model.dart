import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_tree_dropdown_widget.dart' show LocationTreeDropdownWidget;
import 'package:flutter/material.dart';

class LocationTreeDropdownModel
    extends FlutterFlowModel<LocationTreeDropdownWidget> {
  ///  Local state fields for this component.

  List<dynamic> treeData = [];
  void addToTreeData(dynamic item) => treeData.add(item);
  void removeFromTreeData(dynamic item) => treeData.remove(item);
  void removeAtIndexFromTreeData(int index) => treeData.removeAt(index);
  void insertAtIndexInTreeData(int index, dynamic item) =>
      treeData.insert(index, item);
  void updateTreeDataAtIndex(int index, Function(dynamic) updateFn) =>
      treeData[index] = updateFn(treeData[index]);

  bool viewchildren = true;

  bool haschildren = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTree)] action in locationTreeDropdown widget.
  ApiCallResponse? loadLocation;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
