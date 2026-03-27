import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_user_widget.dart' show NewUserWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class NewUserModel extends FlutterFlowModel<NewUserWidget> {
  ///  Local state fields for this component.

  String? newinvitecode = ' ';

  String? tmpImagePath =
      'https://kbhebouujenlqndnunwz.supabase.co/storage/v1/object/public/resources/images/person.jpg';

  bool? imgSet;

  String? statusMsg = 'Enter new user details...';

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for title widget.
  String? titleValue;
  FormFieldController<String>? titleValueController;
  // State field(s) for knownAs widget.
  FocusNode? knownAsFocusNode;
  TextEditingController? knownAsTextController;
  String? Function(BuildContext, String?)? knownAsTextControllerValidator;
  // State field(s) for forename widget.
  FocusNode? forenameFocusNode;
  TextEditingController? forenameTextController;
  String? Function(BuildContext, String?)? forenameTextControllerValidator;
  String? _forenameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Forename is required';
    }

    return null;
  }

  // State field(s) for surname widget.
  FocusNode? surnameFocusNode;
  TextEditingController? surnameTextController;
  String? Function(BuildContext, String?)? surnameTextControllerValidator;
  String? _surnameTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Surname is required';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Email is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileTextController;
  late MaskTextInputFormatter mobileMask;
  String? Function(BuildContext, String?)? mobileTextControllerValidator;
  bool isDataUploading_uploadData4User = false;
  FFUploadedFile uploadedLocalFile_uploadData4User =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');

  // State field(s) for adminRole widget.
  int? adminRoleValue;
  FormFieldController<int>? adminRoleValueController;
  // State field(s) for userMgmt widget.
  int? userMgmtValue;
  FormFieldController<int>? userMgmtValueController;
  // State field(s) for dispatchMgmt widget.
  int? dispatchMgmtValue;
  FormFieldController<int>? dispatchMgmtValueController;
  // State field(s) for appAccess widget.
  int? appAccessValue;
  FormFieldController<int>? appAccessValueController;
  // Stores action output result for [Validate Form] action in ButtonCreate widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonCreate widget.
  List<UsersRow>? emailCheckNewUser;
  // Stores action output result for [Backend Call - API (Create FB User Tenant)] action in ButtonCreate widget.
  ApiCallResponse? newUserAsTenant;
  // Stores action output result for [Backend Call - API (Get Verification URL)] action in ButtonCreate widget.
  ApiCallResponse? verificationURL;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  UsersRow? newUserAccountNoImage;
  bool isDataUploading_sBBucketDataURL = false;
  FFUploadedFile uploadedLocalFile_sBBucketDataURL =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_sBBucketDataURL = '';

  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  UsersRow? newUserAccount;
  // Stores action output result for [Backend Call - API (Send email auth)] action in ButtonCreate widget.
  ApiCallResponse? apiResultwuz2;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonCreate widget.
  List<UserTenantsRow>? checkNewUserTenant;

  @override
  void initState(BuildContext context) {
    forenameTextControllerValidator = _forenameTextControllerValidator;
    surnameTextControllerValidator = _surnameTextControllerValidator;
    emailTextControllerValidator = _emailTextControllerValidator;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    knownAsFocusNode?.dispose();
    knownAsTextController?.dispose();

    forenameFocusNode?.dispose();
    forenameTextController?.dispose();

    surnameFocusNode?.dispose();
    surnameTextController?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    mobileFocusNode?.dispose();
    mobileTextController?.dispose();
  }
}
