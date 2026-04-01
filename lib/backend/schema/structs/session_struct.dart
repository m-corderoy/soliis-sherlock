// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class SessionStruct extends FFFirebaseStruct {
  SessionStruct({
    int? tenantID,
    String? tenantName,
    int? locationTreeIDStart,
    int? teamTreeIDStart,
    int? roleTreeIDStart,

    /// 0 - tenant admin
    /// 1 - org admin
    int? adminRole,

    /// 0 - no
    /// 1 - view
    /// 2 - edit
    int? accessControl,

    /// 99 - no
    /// 0 - enable, basic list view
    /// 1 - view listrow details
    /// 2 - edit listrow details
    /// 3 -  delete
    /// 4 - add new
    ///
    int? userAdmin,
    int? dispatchAdmin,
    int? orgAdmin,
    String? tenantPrompt,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenantID = tenantID,
        _tenantName = tenantName,
        _locationTreeIDStart = locationTreeIDStart,
        _teamTreeIDStart = teamTreeIDStart,
        _roleTreeIDStart = roleTreeIDStart,
        _adminRole = adminRole,
        _accessControl = accessControl,
        _userAdmin = userAdmin,
        _dispatchAdmin = dispatchAdmin,
        _orgAdmin = orgAdmin,
        _tenantPrompt = tenantPrompt,
        super(firestoreUtilData);

  // "tenantID" field.
  int? _tenantID;
  int get tenantID => _tenantID ?? 0;
  set tenantID(int? val) => _tenantID = val;

  void incrementTenantID(int amount) => tenantID = tenantID + amount;

  bool hasTenantID() => _tenantID != null;

  // "tenantName" field.
  String? _tenantName;
  String get tenantName => _tenantName ?? '';
  set tenantName(String? val) => _tenantName = val;

  bool hasTenantName() => _tenantName != null;

  // "locationTreeIDStart" field.
  int? _locationTreeIDStart;
  int get locationTreeIDStart => _locationTreeIDStart ?? 0;
  set locationTreeIDStart(int? val) => _locationTreeIDStart = val;

  void incrementLocationTreeIDStart(int amount) =>
      locationTreeIDStart = locationTreeIDStart + amount;

  bool hasLocationTreeIDStart() => _locationTreeIDStart != null;

  // "teamTreeIDStart" field.
  int? _teamTreeIDStart;
  int get teamTreeIDStart => _teamTreeIDStart ?? 0;
  set teamTreeIDStart(int? val) => _teamTreeIDStart = val;

  void incrementTeamTreeIDStart(int amount) =>
      teamTreeIDStart = teamTreeIDStart + amount;

  bool hasTeamTreeIDStart() => _teamTreeIDStart != null;

  // "roleTreeIDStart" field.
  int? _roleTreeIDStart;
  int get roleTreeIDStart => _roleTreeIDStart ?? 0;
  set roleTreeIDStart(int? val) => _roleTreeIDStart = val;

  void incrementRoleTreeIDStart(int amount) =>
      roleTreeIDStart = roleTreeIDStart + amount;

  bool hasRoleTreeIDStart() => _roleTreeIDStart != null;

  // "adminRole" field.
  int? _adminRole;
  int get adminRole => _adminRole ?? 99;
  set adminRole(int? val) => _adminRole = val;

  void incrementAdminRole(int amount) => adminRole = adminRole + amount;

  bool hasAdminRole() => _adminRole != null;

  // "accessControl" field.
  int? _accessControl;
  int get accessControl => _accessControl ?? 0;
  set accessControl(int? val) => _accessControl = val;

  void incrementAccessControl(int amount) =>
      accessControl = accessControl + amount;

  bool hasAccessControl() => _accessControl != null;

  // "userAdmin" field.
  int? _userAdmin;
  int get userAdmin => _userAdmin ?? 99;
  set userAdmin(int? val) => _userAdmin = val;

  void incrementUserAdmin(int amount) => userAdmin = userAdmin + amount;

  bool hasUserAdmin() => _userAdmin != null;

  // "dispatchAdmin" field.
  int? _dispatchAdmin;
  int get dispatchAdmin => _dispatchAdmin ?? 99;
  set dispatchAdmin(int? val) => _dispatchAdmin = val;

  void incrementDispatchAdmin(int amount) =>
      dispatchAdmin = dispatchAdmin + amount;

  bool hasDispatchAdmin() => _dispatchAdmin != null;

  // "orgAdmin" field.
  int? _orgAdmin;
  int get orgAdmin => _orgAdmin ?? 99;
  set orgAdmin(int? val) => _orgAdmin = val;

  void incrementOrgAdmin(int amount) => orgAdmin = orgAdmin + amount;

  bool hasOrgAdmin() => _orgAdmin != null;

  // "tenantPrompt" field.
  String? _tenantPrompt;
  String get tenantPrompt => _tenantPrompt ?? '';
  set tenantPrompt(String? val) => _tenantPrompt = val;

  bool hasTenantPrompt() => _tenantPrompt != null;

  static SessionStruct fromMap(Map<String, dynamic> data) => SessionStruct(
        tenantID: castToType<int>(data['tenantID']),
        tenantName: data['tenantName'] as String?,
        locationTreeIDStart: castToType<int>(data['locationTreeIDStart']),
        teamTreeIDStart: castToType<int>(data['teamTreeIDStart']),
        roleTreeIDStart: castToType<int>(data['roleTreeIDStart']),
        adminRole: castToType<int>(data['adminRole']),
        accessControl: castToType<int>(data['accessControl']),
        userAdmin: castToType<int>(data['userAdmin']),
        dispatchAdmin: castToType<int>(data['dispatchAdmin']),
        orgAdmin: castToType<int>(data['orgAdmin']),
        tenantPrompt: data['tenantPrompt'] as String?,
      );

  static SessionStruct? maybeFromMap(dynamic data) =>
      data is Map ? SessionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'tenantID': _tenantID,
        'tenantName': _tenantName,
        'locationTreeIDStart': _locationTreeIDStart,
        'teamTreeIDStart': _teamTreeIDStart,
        'roleTreeIDStart': _roleTreeIDStart,
        'adminRole': _adminRole,
        'accessControl': _accessControl,
        'userAdmin': _userAdmin,
        'dispatchAdmin': _dispatchAdmin,
        'orgAdmin': _orgAdmin,
        'tenantPrompt': _tenantPrompt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenantID': serializeParam(
          _tenantID,
          ParamType.int,
        ),
        'tenantName': serializeParam(
          _tenantName,
          ParamType.String,
        ),
        'locationTreeIDStart': serializeParam(
          _locationTreeIDStart,
          ParamType.int,
        ),
        'teamTreeIDStart': serializeParam(
          _teamTreeIDStart,
          ParamType.int,
        ),
        'roleTreeIDStart': serializeParam(
          _roleTreeIDStart,
          ParamType.int,
        ),
        'adminRole': serializeParam(
          _adminRole,
          ParamType.int,
        ),
        'accessControl': serializeParam(
          _accessControl,
          ParamType.int,
        ),
        'userAdmin': serializeParam(
          _userAdmin,
          ParamType.int,
        ),
        'dispatchAdmin': serializeParam(
          _dispatchAdmin,
          ParamType.int,
        ),
        'orgAdmin': serializeParam(
          _orgAdmin,
          ParamType.int,
        ),
        'tenantPrompt': serializeParam(
          _tenantPrompt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SessionStruct fromSerializableMap(Map<String, dynamic> data) =>
      SessionStruct(
        tenantID: deserializeParam(
          data['tenantID'],
          ParamType.int,
          false,
        ),
        tenantName: deserializeParam(
          data['tenantName'],
          ParamType.String,
          false,
        ),
        locationTreeIDStart: deserializeParam(
          data['locationTreeIDStart'],
          ParamType.int,
          false,
        ),
        teamTreeIDStart: deserializeParam(
          data['teamTreeIDStart'],
          ParamType.int,
          false,
        ),
        roleTreeIDStart: deserializeParam(
          data['roleTreeIDStart'],
          ParamType.int,
          false,
        ),
        adminRole: deserializeParam(
          data['adminRole'],
          ParamType.int,
          false,
        ),
        accessControl: deserializeParam(
          data['accessControl'],
          ParamType.int,
          false,
        ),
        userAdmin: deserializeParam(
          data['userAdmin'],
          ParamType.int,
          false,
        ),
        dispatchAdmin: deserializeParam(
          data['dispatchAdmin'],
          ParamType.int,
          false,
        ),
        orgAdmin: deserializeParam(
          data['orgAdmin'],
          ParamType.int,
          false,
        ),
        tenantPrompt: deserializeParam(
          data['tenantPrompt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SessionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SessionStruct &&
        tenantID == other.tenantID &&
        tenantName == other.tenantName &&
        locationTreeIDStart == other.locationTreeIDStart &&
        teamTreeIDStart == other.teamTreeIDStart &&
        roleTreeIDStart == other.roleTreeIDStart &&
        adminRole == other.adminRole &&
        accessControl == other.accessControl &&
        userAdmin == other.userAdmin &&
        dispatchAdmin == other.dispatchAdmin &&
        orgAdmin == other.orgAdmin &&
        tenantPrompt == other.tenantPrompt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        tenantID,
        tenantName,
        locationTreeIDStart,
        teamTreeIDStart,
        roleTreeIDStart,
        adminRole,
        accessControl,
        userAdmin,
        dispatchAdmin,
        orgAdmin,
        tenantPrompt
      ]);
}

SessionStruct createSessionStruct({
  int? tenantID,
  String? tenantName,
  int? locationTreeIDStart,
  int? teamTreeIDStart,
  int? roleTreeIDStart,
  int? adminRole,
  int? accessControl,
  int? userAdmin,
  int? dispatchAdmin,
  int? orgAdmin,
  String? tenantPrompt,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SessionStruct(
      tenantID: tenantID,
      tenantName: tenantName,
      locationTreeIDStart: locationTreeIDStart,
      teamTreeIDStart: teamTreeIDStart,
      roleTreeIDStart: roleTreeIDStart,
      adminRole: adminRole,
      accessControl: accessControl,
      userAdmin: userAdmin,
      dispatchAdmin: dispatchAdmin,
      orgAdmin: orgAdmin,
      tenantPrompt: tenantPrompt,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SessionStruct? updateSessionStruct(
  SessionStruct? session, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    session
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSessionStructData(
  Map<String, dynamic> firestoreData,
  SessionStruct? session,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (session == null) {
    return;
  }
  if (session.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && session.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sessionData = getSessionFirestoreData(session, forFieldValue);
  final nestedData = sessionData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = session.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSessionFirestoreData(
  SessionStruct? session, [
  bool forFieldValue = false,
]) {
  if (session == null) {
    return {};
  }
  final firestoreData = mapToFirestore(session.toMap());

  // Add any Firestore field values
  mapToFirestore(session.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSessionListFirestoreData(
  List<SessionStruct>? sessions,
) =>
    sessions?.map((e) => getSessionFirestoreData(e, true)).toList() ?? [];
