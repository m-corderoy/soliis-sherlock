import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_tenant_widget.dart' show NewTenantWidget;
import 'package:flutter/material.dart';

class NewTenantModel extends FlutterFlowModel<NewTenantWidget> {
  ///  Local state fields for this component.

  String? newinvitecode;

  String? tempUserID;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for tenantName widget.
  FocusNode? tenantNameFocusNode;
  TextEditingController? tenantNameTextController;
  String? Function(BuildContext, String?)? tenantNameTextControllerValidator;
  String? _tenantNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for ownerEmail widget.
  FocusNode? ownerEmailFocusNode;
  TextEditingController? ownerEmailTextController;
  String? Function(BuildContext, String?)? ownerEmailTextControllerValidator;
  String? _ownerEmailTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for ownerForename widget.
  FocusNode? ownerForenameFocusNode;
  TextEditingController? ownerForenameTextController;
  String? Function(BuildContext, String?)? ownerForenameTextControllerValidator;
  // State field(s) for ownerSurname widget.
  FocusNode? ownerSurnameFocusNode;
  TextEditingController? ownerSurnameTextController;
  String? Function(BuildContext, String?)? ownerSurnameTextControllerValidator;
  // Stores action output result for [Validate Form] action in ButtonCreate widget.
  bool? formValidate;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonCreate widget.
  List<UsersRow>? isEmailNew;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonCreate widget.
  List<UsersRow>? emailForAccount;
  // Stores action output result for [Backend Call - API (Create FB User Tenant)] action in ButtonCreate widget.
  ApiCallResponse? createNewFBUser;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  UsersRow? newUserOwnerForTenantD;
  // Stores action output result for [Backend Call - API (Get Verification URL)] action in ButtonCreate widget.
  ApiCallResponse? verificationURL;
  // Stores action output result for [Backend Call - API (Send email auth)] action in ButtonCreate widget.
  ApiCallResponse? apiResultwuz;
  // Stores action output result for [Backend Call - Query Rows] action in ButtonCreate widget.
  List<UsersRow>? emailCheck;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  TenantRow? newTenant;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  LocationRow? entryLocation;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  TeamRow? entryTeam;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  RoleRow? entryRole;
  // Stores action output result for [Backend Call - Update Row(s)] action in ButtonCreate widget.
  List<TenantRow>? updatedTenant;
  // Stores action output result for [Backend Call - Insert Row] action in ButtonCreate widget.
  UserTenantsRow? tenantUserRecord;

  @override
  void initState(BuildContext context) {
    tenantNameTextControllerValidator = _tenantNameTextControllerValidator;
    ownerEmailTextControllerValidator = _ownerEmailTextControllerValidator;
  }

  @override
  void dispose() {
    tenantNameFocusNode?.dispose();
    tenantNameTextController?.dispose();

    ownerEmailFocusNode?.dispose();
    ownerEmailTextController?.dispose();

    ownerForenameFocusNode?.dispose();
    ownerForenameTextController?.dispose();

    ownerSurnameFocusNode?.dispose();
    ownerSurnameTextController?.dispose();
  }
}
