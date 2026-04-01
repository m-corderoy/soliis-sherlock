// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TenantlistStruct extends FFFirebaseStruct {
  TenantlistStruct({
    String? userId,
    String? knownas,
    String? forename,
    String? surname,
    String? email,
    int? tenantId,
    String? tenantName,
    DateTime? expiryDate,
    String? status,
    int? authAdmin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userId = userId,
        _knownas = knownas,
        _forename = forename,
        _surname = surname,
        _email = email,
        _tenantId = tenantId,
        _tenantName = tenantName,
        _expiryDate = expiryDate,
        _status = status,
        _authAdmin = authAdmin,
        super(firestoreUtilData);

  // "user_id" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "knownas" field.
  String? _knownas;
  String get knownas => _knownas ?? '';
  set knownas(String? val) => _knownas = val;

  bool hasKnownas() => _knownas != null;

  // "forename" field.
  String? _forename;
  String get forename => _forename ?? '';
  set forename(String? val) => _forename = val;

  bool hasForename() => _forename != null;

  // "surname" field.
  String? _surname;
  String get surname => _surname ?? '';
  set surname(String? val) => _surname = val;

  bool hasSurname() => _surname != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "tenant_id" field.
  int? _tenantId;
  int get tenantId => _tenantId ?? 0;
  set tenantId(int? val) => _tenantId = val;

  void incrementTenantId(int amount) => tenantId = tenantId + amount;

  bool hasTenantId() => _tenantId != null;

  // "tenant_name" field.
  String? _tenantName;
  String get tenantName => _tenantName ?? '';
  set tenantName(String? val) => _tenantName = val;

  bool hasTenantName() => _tenantName != null;

  // "expiry_date" field.
  DateTime? _expiryDate;
  DateTime? get expiryDate => _expiryDate;
  set expiryDate(DateTime? val) => _expiryDate = val;

  bool hasExpiryDate() => _expiryDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "auth_admin" field.
  int? _authAdmin;
  int get authAdmin => _authAdmin ?? 0;
  set authAdmin(int? val) => _authAdmin = val;

  void incrementAuthAdmin(int amount) => authAdmin = authAdmin + amount;

  bool hasAuthAdmin() => _authAdmin != null;

  static TenantlistStruct fromMap(Map<String, dynamic> data) =>
      TenantlistStruct(
        userId: data['user_id'] as String?,
        knownas: data['knownas'] as String?,
        forename: data['forename'] as String?,
        surname: data['surname'] as String?,
        email: data['email'] as String?,
        tenantId: castToType<int>(data['tenant_id']),
        tenantName: data['tenant_name'] as String?,
        expiryDate: data['expiry_date'] as DateTime?,
        status: data['status'] as String?,
        authAdmin: castToType<int>(data['auth_admin']),
      );

  static TenantlistStruct? maybeFromMap(dynamic data) => data is Map
      ? TenantlistStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'knownas': _knownas,
        'forename': _forename,
        'surname': _surname,
        'email': _email,
        'tenant_id': _tenantId,
        'tenant_name': _tenantName,
        'expiry_date': _expiryDate,
        'status': _status,
        'auth_admin': _authAdmin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.String,
        ),
        'knownas': serializeParam(
          _knownas,
          ParamType.String,
        ),
        'forename': serializeParam(
          _forename,
          ParamType.String,
        ),
        'surname': serializeParam(
          _surname,
          ParamType.String,
        ),
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'tenant_id': serializeParam(
          _tenantId,
          ParamType.int,
        ),
        'tenant_name': serializeParam(
          _tenantName,
          ParamType.String,
        ),
        'expiry_date': serializeParam(
          _expiryDate,
          ParamType.DateTime,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'auth_admin': serializeParam(
          _authAdmin,
          ParamType.int,
        ),
      }.withoutNulls;

  static TenantlistStruct fromSerializableMap(Map<String, dynamic> data) =>
      TenantlistStruct(
        userId: deserializeParam(
          data['user_id'],
          ParamType.String,
          false,
        ),
        knownas: deserializeParam(
          data['knownas'],
          ParamType.String,
          false,
        ),
        forename: deserializeParam(
          data['forename'],
          ParamType.String,
          false,
        ),
        surname: deserializeParam(
          data['surname'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        tenantId: deserializeParam(
          data['tenant_id'],
          ParamType.int,
          false,
        ),
        tenantName: deserializeParam(
          data['tenant_name'],
          ParamType.String,
          false,
        ),
        expiryDate: deserializeParam(
          data['expiry_date'],
          ParamType.DateTime,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        authAdmin: deserializeParam(
          data['auth_admin'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'TenantlistStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TenantlistStruct &&
        userId == other.userId &&
        knownas == other.knownas &&
        forename == other.forename &&
        surname == other.surname &&
        email == other.email &&
        tenantId == other.tenantId &&
        tenantName == other.tenantName &&
        expiryDate == other.expiryDate &&
        status == other.status &&
        authAdmin == other.authAdmin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        knownas,
        forename,
        surname,
        email,
        tenantId,
        tenantName,
        expiryDate,
        status,
        authAdmin
      ]);
}

TenantlistStruct createTenantlistStruct({
  String? userId,
  String? knownas,
  String? forename,
  String? surname,
  String? email,
  int? tenantId,
  String? tenantName,
  DateTime? expiryDate,
  String? status,
  int? authAdmin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TenantlistStruct(
      userId: userId,
      knownas: knownas,
      forename: forename,
      surname: surname,
      email: email,
      tenantId: tenantId,
      tenantName: tenantName,
      expiryDate: expiryDate,
      status: status,
      authAdmin: authAdmin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TenantlistStruct? updateTenantlistStruct(
  TenantlistStruct? tenantlist, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tenantlist
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTenantlistStructData(
  Map<String, dynamic> firestoreData,
  TenantlistStruct? tenantlist,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tenantlist == null) {
    return;
  }
  if (tenantlist.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tenantlist.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tenantlistData = getTenantlistFirestoreData(tenantlist, forFieldValue);
  final nestedData = tenantlistData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tenantlist.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTenantlistFirestoreData(
  TenantlistStruct? tenantlist, [
  bool forFieldValue = false,
]) {
  if (tenantlist == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tenantlist.toMap());

  // Add any Firestore field values
  mapToFirestore(tenantlist.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTenantlistListFirestoreData(
  List<TenantlistStruct>? tenantlists,
) =>
    tenantlists?.map((e) => getTenantlistFirestoreData(e, true)).toList() ?? [];
