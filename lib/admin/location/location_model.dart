import '/backend/api_requests/api_calls.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'location_widget.dart' show LocationWidget;
import 'package:flutter/material.dart';

class LocationModel extends FlutterFlowModel<LocationWidget> {
  ///  Local state fields for this page.

  List<dynamic> treedata1 = [];
  void addToTreedata1(dynamic item) => treedata1.add(item);
  void removeFromTreedata1(dynamic item) => treedata1.remove(item);
  void removeAtIndexFromTreedata1(int index) => treedata1.removeAt(index);
  void insertAtIndexInTreedata1(int index, dynamic item) =>
      treedata1.insert(index, item);
  void updateTreedata1AtIndex(int index, Function(dynamic) updateFn) =>
      treedata1[index] = updateFn(treedata1[index]);

  bool? textReadOnly = true;

  int? tabID = 0;

  List<dynamic> treedata2 = [];
  void addToTreedata2(dynamic item) => treedata2.add(item);
  void removeFromTreedata2(dynamic item) => treedata2.remove(item);
  void removeAtIndexFromTreedata2(int index) => treedata2.removeAt(index);
  void insertAtIndexInTreedata2(int index, dynamic item) =>
      treedata2.insert(index, item);
  void updateTreedata2AtIndex(int index, Function(dynamic) updateFn) =>
      treedata2[index] = updateFn(treedata2[index]);

  String? tempPrompt1;

  String? tempPrompt2;

  List<dynamic> treeData1b = [];
  void addToTreeData1b(dynamic item) => treeData1b.add(item);
  void removeFromTreeData1b(dynamic item) => treeData1b.remove(item);
  void removeAtIndexFromTreeData1b(int index) => treeData1b.removeAt(index);
  void insertAtIndexInTreeData1b(int index, dynamic item) =>
      treeData1b.insert(index, item);
  void updateTreeData1bAtIndex(int index, Function(dynamic) updateFn) =>
      treeData1b[index] = updateFn(treeData1b[index]);

  String? logo;

  List<dynamic> treeData2b = [];
  void addToTreeData2b(dynamic item) => treeData2b.add(item);
  void removeFromTreeData2b(dynamic item) => treeData2b.remove(item);
  void removeAtIndexFromTreeData2b(int index) => treeData2b.removeAt(index);
  void insertAtIndexInTreeData2b(int index, dynamic item) =>
      treeData2b.insert(index, item);
  void updateTreeData2bAtIndex(int index, Function(dynamic) updateFn) =>
      treeData2b[index] = updateFn(treeData2b[index]);

  String? teamTextPath;

  bool? teamEdit = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetTree)] action in location widget.
  ApiCallResponse? getInitialLocation;
  // Stores action output result for [Backend Call - API (GetTeam)] action in location widget.
  ApiCallResponse? getInitialTeam;
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
