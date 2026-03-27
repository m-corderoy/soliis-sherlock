import '/backend/api_requests/api_calls.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'dart:async';
import 'dashboard_widget.dart' show DashboardWidget;
import 'package:flutter/material.dart';

class DashboardModel extends FlutterFlowModel<DashboardWidget> {
  ///  Local state fields for this page.

  DateTime? dashTime;

  String? selectedTitle = 'title';

  String? selectedSummary = 'Summary';

  List<dynamic> payloadfromTriage = [];
  void addToPayloadfromTriage(dynamic item) => payloadfromTriage.add(item);
  void removeFromPayloadfromTriage(dynamic item) =>
      payloadfromTriage.remove(item);
  void removeAtIndexFromPayloadfromTriage(int index) =>
      payloadfromTriage.removeAt(index);
  void insertAtIndexInPayloadfromTriage(int index, dynamic item) =>
      payloadfromTriage.insert(index, item);
  void updatePayloadfromTriageAtIndex(int index, Function(dynamic) updateFn) =>
      payloadfromTriage[index] = updateFn(payloadfromTriage[index]);

  List<String> chart3barlabels = ['1', '2', '3', '4', '5', '6', '7'];
  void addToChart3barlabels(String item) => chart3barlabels.add(item);
  void removeFromChart3barlabels(String item) => chart3barlabels.remove(item);
  void removeAtIndexFromChart3barlabels(int index) =>
      chart3barlabels.removeAt(index);
  void insertAtIndexInChart3barlabels(int index, String item) =>
      chart3barlabels.insert(index, item);
  void updateChart3barlabelsAtIndex(int index, Function(String) updateFn) =>
      chart3barlabels[index] = updateFn(chart3barlabels[index]);

  List<int> chart3Values = [23, 67, 45, 35, 50, 0, 41];
  void addToChart3Values(int item) => chart3Values.add(item);
  void removeFromChart3Values(int item) => chart3Values.remove(item);
  void removeAtIndexFromChart3Values(int index) => chart3Values.removeAt(index);
  void insertAtIndexInChart3Values(int index, int item) =>
      chart3Values.insert(index, item);
  void updateChart3ValuesAtIndex(int index, Function(int) updateFn) =>
      chart3Values[index] = updateFn(chart3Values[index]);

  int? opID;

  dynamic selectedpostedData;

  bool? rowSelected;

  dynamic imagesToShow;

  int? imageCounter = 0;

  dynamic utpdata;

  dynamic postDataJson;

  ///  State fields for stateful widgets in this page.

  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // State field(s) for sourceSwitch widget.
  bool? sourceSwitchValue;
  // Stores action output result for [Backend Call - API (Report Test)] action in IconButton widget.
  ApiCallResponse? apiResultPDF;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;

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

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
