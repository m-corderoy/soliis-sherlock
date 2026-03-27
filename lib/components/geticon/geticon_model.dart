import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'geticon_widget.dart' show GeticonWidget;
import 'package:flutter/material.dart';

class GeticonModel extends FlutterFlowModel<GeticonWidget> {
  ///  Local state fields for this component.

  String? searchQuery;

  bool isLoading = true;

  List<dynamic> iconResults = [];
  void addToIconResults(dynamic item) => iconResults.add(item);
  void removeFromIconResults(dynamic item) => iconResults.remove(item);
  void removeAtIndexFromIconResults(int index) => iconResults.removeAt(index);
  void insertAtIndexInIconResults(int index, dynamic item) =>
      iconResults.insert(index, item);
  void updateIconResultsAtIndex(int index, Function(dynamic) updateFn) =>
      iconResults[index] = updateFn(iconResults[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (Get Icons)] action in Button widget.
  ApiCallResponse? apiGetIcons;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
