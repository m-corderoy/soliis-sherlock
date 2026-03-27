import '/auth/firebase_auth/auth_util.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/components/select_tenant/select_tenant_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';

class LoginMainModel extends FlutterFlowModel<LoginMainWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }

  /// Action blocks.
  Future login(BuildContext context) async {
    List<UserTenantViewRow>? loggedUserAB;
    List<LocationRow>? locationTreeDataAB;
    List<TeamRow>? teamTreeDataAB;

    // auth with firebase
    GoRouter.of(context).prepareAuthEvent();

    final user = await authManager.signInWithEmail(
      context,
      emailAddressTextController.text,
      passwordTextController.text,
    );
    if (user == null) {
      return;
    }

    // pause...
    await Future.delayed(
      Duration(
        milliseconds: 250,
      ),
    );
    // determine number tenants
    loggedUserAB = await UserTenantViewTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'user_id',
        currentUserUid,
      ),
    );
    if (loggedUserAB.length == 1) {
      // adminRole defines access
      //
      // 0. superuser (app owner)
      // 1  tenant owner
      // 2 Manager for tenant
      // 3 team leader
      // 4 team member
      // uodate session app variable
      FFAppState().updateSessionStruct(
        (e) => e
          ..adminRole = loggedUserAB?.firstOrNull?.authAdmin
          ..tenantID = loggedUserAB?.firstOrNull?.tenantId
          ..tenantName = loggedUserAB?.firstOrNull?.tenantName
          ..userAdmin = loggedUserAB?.firstOrNull?.userAdmin
          ..accessControl = loggedUserAB?.firstOrNull?.accessControl
          ..dispatchAdmin = loggedUserAB?.firstOrNull?.dispatchAdmin
          ..locationTreeIDStart = loggedUserAB?.firstOrNull?.locationStartID
          ..teamTreeIDStart = loggedUserAB?.firstOrNull?.teamStartID
          ..tenantPrompt = loggedUserAB?.firstOrNull?.prompt
          ..roleTreeIDStart = loggedUserAB?.firstOrNull?.rolesID,
      );
    } else {
      // Multi Tenant select
      await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            alignment: AlignmentDirectional(0.0, 0.0)
                .resolve(Directionality.of(context)),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(dialogContext).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Container(
                height: 500.0,
                width: 400.0,
                child: SelectTenantWidget(
                  selectedTenant: (tenantID,
                      adminlevel,
                      name,
                      userAdmin,
                      accessControl,
                      dispatchAdmin,
                      prompt,
                      locationTree,
                      teamTree,
                      roleTree) async {
                    FFAppState().session = SessionStruct(
                      tenantID: tenantID,
                      adminRole: adminlevel,
                      tenantName: name,
                      userAdmin: userAdmin,
                      accessControl: accessControl,
                      dispatchAdmin: dispatchAdmin,
                      tenantPrompt: prompt,
                      locationTreeIDStart: locationTree,
                      teamTreeIDStart: teamTree,
                      roleTreeIDStart: roleTree,
                    );
                    safeSetState(() {});
                    // set params dispatch  view
                    FFAppState().dispatchUIcontrol = DispatchUIStruct(
                      selectedLocation:
                          FFAppState().session.locationTreeIDStart,
                      selectedTeam: FFAppState().session.teamTreeIDStart,
                    );
                    safeSetState(() {});
                  },
                ),
              ),
            ),
          );
        },
      );
    }

    // mint supabase token
    await actions.updateSupabaseTokenWithTenantID();
    // Get Location Ltree
    locationTreeDataAB = await LocationTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'id',
        FFAppState().session.locationTreeIDStart,
      ),
    );
    // Get Teams Ltree
    teamTreeDataAB = await TeamTable().queryRows(
      queryFn: (q) => q.eqOrNull(
        'id',
        FFAppState().session.teamTreeIDStart,
      ),
    );
    // set params dispatch  view
    FFAppState().dispatchUIcontrol = DispatchUIStruct(
      selectedLocation: FFAppState().session.locationTreeIDStart,
      selectedLtreeLocation: locationTreeDataAB.firstOrNull?.path,
      selectedTeam: FFAppState().session.teamTreeIDStart,
      selectedLtreeTeam: teamTreeDataAB.firstOrNull?.path,
    );
    if (FFAppState().defaultOpsBoard == -1) {
      // goto home page

      context.pushNamedAuth(HomeWidget.routeName, context.mounted);
    } else {
      context.pushNamedAuth(
        DashboardWidget.routeName,
        context.mounted,
        queryParameters: {
          'opsBoardID': serializeParam(
            FFAppState().defaultOpsBoard,
            ParamType.int,
          ),
        }.withoutNulls,
      );
    }
  }
}
