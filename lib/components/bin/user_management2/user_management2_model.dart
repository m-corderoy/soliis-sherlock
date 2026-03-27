import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'user_management2_widget.dart' show UserManagement2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UserManagement2Model extends FlutterFlowModel<UserManagement2Widget> {
  ///  Local state fields for this page.

  String? selectedUserID;

  String? firstname;

  String? surname;

  String? email;

  String? displayName;

  String? title;

  String? imageurl =
      'https://kbhebouujenlqndnunwz.supabase.co/storage/v1/object/public/resources/images/person.jpg';

  bool? editPrompt = false;

  String? mobile;

  int? adminRole;

  int? userAdmin;

  int? dispatchAdmin;

  int? accessControl;

  bool? viewonly;

  String? profile;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Model for sideNavAdmin component.
  late SideNavAdminModel sideNavAdminModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for titleDropDown widget.
  String? titleDropDownValue;
  FormFieldController<String>? titleDropDownValueController;
  // State field(s) for knownasTextField widget.
  FocusNode? knownasTextFieldFocusNode;
  TextEditingController? knownasTextFieldTextController;
  String? Function(BuildContext, String?)?
      knownasTextFieldTextControllerValidator;
  // State field(s) for firstnameTextField widget.
  FocusNode? firstnameTextFieldFocusNode;
  TextEditingController? firstnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      firstnameTextFieldTextControllerValidator;
  // State field(s) for surnameTextField widget.
  FocusNode? surnameTextFieldFocusNode;
  TextEditingController? surnameTextFieldTextController;
  String? Function(BuildContext, String?)?
      surnameTextFieldTextControllerValidator;
  // State field(s) for mobileAsTextField widget.
  FocusNode? mobileAsTextFieldFocusNode;
  TextEditingController? mobileAsTextFieldTextController;
  late MaskTextInputFormatter mobileAsTextFieldMask;
  String? Function(BuildContext, String?)?
      mobileAsTextFieldTextControllerValidator;
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
  // State field(s) for editProfileTextField widget.
  FocusNode? editProfileTextFieldFocusNode;
  TextEditingController? editProfileTextFieldTextController;
  String? Function(BuildContext, String?)?
      editProfileTextFieldTextControllerValidator;

  @override
  void initState(BuildContext context) {
    sideNavAdminModel = createModel(context, () => SideNavAdminModel());
  }

  @override
  void dispose() {
    sideNavAdminModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tabBarController?.dispose();
    knownasTextFieldFocusNode?.dispose();
    knownasTextFieldTextController?.dispose();

    firstnameTextFieldFocusNode?.dispose();
    firstnameTextFieldTextController?.dispose();

    surnameTextFieldFocusNode?.dispose();
    surnameTextFieldTextController?.dispose();

    mobileAsTextFieldFocusNode?.dispose();
    mobileAsTextFieldTextController?.dispose();

    editProfileTextFieldFocusNode?.dispose();
    editProfileTextFieldTextController?.dispose();
  }
}
