import '/backend/api_requests/api_calls.dart';
import '/components/tree_components/location/location_tree_general/location_tree_general_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_tree_general_widget.dart' show LocationTreeGeneralWidget;
import 'package:flutter/material.dart';

class LocationTreeGeneralModel
    extends FlutterFlowModel<LocationTreeGeneralWidget> {
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

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (GetTree)] action in locationTreeGeneral widget.
  ApiCallResponse? apiGetLocationChildren;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
