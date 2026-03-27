import '/backend/api_requests/api_calls.dart';
import '/backend/supabase/supabase.dart';
import '/components/bin/side_nav_admin/side_nav_admin_widget.dart';
import '/components/supportmenu/supportmenu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'oldadmin_widget.dart' show OldadminWidget;
import 'package:flutter/material.dart';

class OldadminModel extends FlutterFlowModel<OldadminWidget> {
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

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - API (GetTree)] action in oldadmin widget.
  ApiCallResponse? getInitialLocation;
  // Stores action output result for [Backend Call - API (GetTeam)] action in oldadmin widget.
  ApiCallResponse? getInitialTeam;
  // Model for sideNavAdmin component.
  late SideNavAdminModel sideNavAdminModel;
  // State field(s) for MouseHomeSetup widget.
  bool mouseHomeSetupHovered = false;
  // State field(s) for MousePrompt widget.
  bool mousePromptHovered = false;
  // State field(s) for MouseBoards widget.
  bool mouseBoardsHovered = false;
  // State field(s) for MouseLocation widget.
  bool mouseLocationHovered = false;
  // State field(s) for MouseTeams widget.
  bool mouseTeamsHovered = false;
  // State field(s) for MouseRoles widget.
  bool mouseRolesHovered = false;
  // Model for supportmenu component.
  late SupportmenuModel supportmenuModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  bool isDataUploading_uploadDataImageSetup = false;
  FFUploadedFile uploadedLocalFile_uploadDataImageSetup =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadDataImageSetup = '';

  // State field(s) for TenantPromptField widget.
  FocusNode? tenantPromptFieldFocusNode;
  TextEditingController? tenantPromptFieldTextController;
  String? Function(BuildContext, String?)?
      tenantPromptFieldTextControllerValidator;
  // State field(s) for opsBoardDropDown widget.
  int? opsBoardDropDownValue;
  FormFieldController<int>? opsBoardDropDownValueController;
  // State field(s) for opsPromptTextField widget.
  FocusNode? opsPromptTextFieldFocusNode;
  TextEditingController? opsPromptTextFieldTextController;
  String? Function(BuildContext, String?)?
      opsPromptTextFieldTextControllerValidator;
  Color? colorPicked;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // Stores action output result for [Backend Call - Delete Row(s)] action in teamTreeGeneralInline widget.
  List<TeamRow>? deletenode;
  // State field(s) for TextEditlongname widget.
  FocusNode? textEditlongnameFocusNode;
  TextEditingController? textEditlongnameTextController;
  String? Function(BuildContext, String?)?
      textEditlongnameTextControllerValidator;
  // State field(s) for TextFieldPrompt widget.
  FocusNode? textFieldPromptFocusNode;
  TextEditingController? textFieldPromptTextController;
  String? Function(BuildContext, String?)?
      textFieldPromptTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Checkbox widget.
  bool? checkboxValue3;

  @override
  void initState(BuildContext context) {
    sideNavAdminModel = createModel(context, () => SideNavAdminModel());
    supportmenuModel = createModel(context, () => SupportmenuModel());
  }

  @override
  void dispose() {
    sideNavAdminModel.dispose();
    supportmenuModel.dispose();
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    tenantPromptFieldFocusNode?.dispose();
    tenantPromptFieldTextController?.dispose();

    opsPromptTextFieldFocusNode?.dispose();
    opsPromptTextFieldTextController?.dispose();

    textEditlongnameFocusNode?.dispose();
    textEditlongnameTextController?.dispose();

    textFieldPromptFocusNode?.dispose();
    textFieldPromptTextController?.dispose();
  }
}
