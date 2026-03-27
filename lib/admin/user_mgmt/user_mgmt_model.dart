import '/backend/supabase/supabase.dart';
import '/components/side_nav/side_nav_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:async';
import 'user_mgmt_widget.dart' show UserMgmtWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserMgmtModel extends FlutterFlowModel<UserMgmtWidget> {
  ///  Local state fields for this page.

  String? selectedUserID = ' ';

  String? title = 'title';

  String? forename = 'forename';

  /// surname
  String? surname = 'surname';

  String? mobile = 'mobile';

  String? knownas = 'knownas';

  bool? viewOnly = true;

  String? profile = 'User profile';

  bool? pageChange;

  int? accessLevel = -1;

  int? userAdmin = -1;

  int? dispatchAdmin = -1;

  int? accessControl = -1;

  String? origPhotoURL;

  String? newPhotoURL;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // Model for sideNav component.
  late SideNavModel sideNavModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  Completer<List<UserTenantViewRow>>? requestCompleter;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for title widget.
  String? titleValue;
  FormFieldController<String>? titleValueController;
  // State field(s) for firstNameTextField widget.
  FocusNode? firstNameTextFieldFocusNode;
  TextEditingController? firstNameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstNameTextFieldTextControllerValidator;
  // State field(s) for surnameTextField widget.
  FocusNode? surnameTextFieldFocusNode;
  TextEditingController? surnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      surnameTextFieldTextControllerValidator;
  // State field(s) for knownAsTextField widget.
  FocusNode? knownAsTextFieldFocusNode;
  TextEditingController? knownAsTextFieldTextController;
  String? Function(BuildContext, String?)?
      knownAsTextFieldTextControllerValidator;
  // State field(s) for mobileTextField widget.
  FocusNode? mobileTextFieldFocusNode;
  TextEditingController? mobileTextFieldTextController;
  late MaskTextInputFormatter mobileTextFieldMask;
  String? Function(BuildContext, String?)?
      mobileTextFieldTextControllerValidator;
  bool isDataUploading_uploadHeadshot = false;
  FFUploadedFile uploadedLocalFile_uploadHeadshot =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadHeadshot = '';

  // State field(s) for accessLevelDropDown widget.
  int? accessLevelDropDownValue;
  FormFieldController<int>? accessLevelDropDownValueController;
  // State field(s) for userMgmtDropDown widget.
  int? userMgmtDropDownValue;
  FormFieldController<int>? userMgmtDropDownValueController;
  // State field(s) for dipatchMgmtDropDown widget.
  int? dipatchMgmtDropDownValue;
  FormFieldController<int>? dipatchMgmtDropDownValueController;
  // State field(s) for appAccessDropDown widget.
  int? appAccessDropDownValue;
  FormFieldController<int>? appAccessDropDownValueController;
  // State field(s) for promptTextField widget.
  FocusNode? promptTextFieldFocusNode;
  TextEditingController? promptTextFieldTextController;
  String? Function(BuildContext, String?)?
      promptTextFieldTextControllerValidator;
  // Stores action output result for [Backend Call - Delete Row(s)] action in Button widget.
  List<UsersRow>? deleteUser;

  @override
  void initState(BuildContext context) {
    supportmenuModel = createModel(context, () => SupportmenuModel());
    sideNavModel = createModel(context, () => SideNavModel());
  }

  @override
  void dispose() {
    supportmenuModel.dispose();
    sideNavModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tabBarController?.dispose();
    firstNameTextFieldFocusNode?.dispose();
    firstNameTextFieldTextController?.dispose();

    surnameTextFieldFocusNode?.dispose();
    surnameTextFieldTextController?.dispose();

    knownAsTextFieldFocusNode?.dispose();
    knownAsTextFieldTextController?.dispose();

    mobileTextFieldFocusNode?.dispose();
    mobileTextFieldTextController?.dispose();

    promptTextFieldFocusNode?.dispose();
    promptTextFieldTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
