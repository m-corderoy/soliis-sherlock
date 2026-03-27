import '/flutter_flow/flutter_flow_util.dart';
import 'new_dispatch_card_widget.dart' show NewDispatchCardWidget;
import 'package:flutter/material.dart';

class NewDispatchCardModel extends FlutterFlowModel<NewDispatchCardWidget> {
  ///  Local state fields for this component.

  int? cardType;

  String? card0prompt;

  String? card1prompt =
      'Card reference 1: A Photos and Notes submission card. One or more images can be submitted, each with a text note. The photos are analysised using AI (including the notes as context).';

  String? card2prompt;

  String? card3prompt;

  String? card4prompt;

  String? card5prompt;

  String? cardDescription;

  String? cardTypeName;

  String? cardUiName;

  bool? textSet;

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
