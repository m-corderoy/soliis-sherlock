// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TenantMgmtStruct extends FFFirebaseStruct {
  TenantMgmtStruct({
    String? tenantName,
    String? ownerName,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _tenantName = tenantName,
        _ownerName = ownerName,
        _status = status,
        super(firestoreUtilData);

  // "tenantName" field.
  String? _tenantName;
  String get tenantName => _tenantName ?? '';
  set tenantName(String? val) => _tenantName = val;

  bool hasTenantName() => _tenantName != null;

  // "ownerName" field.
  String? _ownerName;
  String get ownerName => _ownerName ?? '';
  set ownerName(String? val) => _ownerName = val;

  bool hasOwnerName() => _ownerName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static TenantMgmtStruct fromMap(Map<String, dynamic> data) =>
      TenantMgmtStruct(
        tenantName: data['tenantName'] as String?,
        ownerName: data['ownerName'] as String?,
        status: data['status'] as String?,
      );

  static TenantMgmtStruct? maybeFromMap(dynamic data) => data is Map
      ? TenantMgmtStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'tenantName': _tenantName,
        'ownerName': _ownerName,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'tenantName': serializeParam(
          _tenantName,
          ParamType.String,
        ),
        'ownerName': serializeParam(
          _ownerName,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static TenantMgmtStruct fromSerializableMap(Map<String, dynamic> data) =>
      TenantMgmtStruct(
        tenantName: deserializeParam(
          data['tenantName'],
          ParamType.String,
          false,
        ),
        ownerName: deserializeParam(
          data['ownerName'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TenantMgmtStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TenantMgmtStruct &&
        tenantName == other.tenantName &&
        ownerName == other.ownerName &&
        status == other.status;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([tenantName, ownerName, status]);
}

TenantMgmtStruct createTenantMgmtStruct({
  String? tenantName,
  String? ownerName,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TenantMgmtStruct(
      tenantName: tenantName,
      ownerName: ownerName,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TenantMgmtStruct? updateTenantMgmtStruct(
  TenantMgmtStruct? tenantMgmt, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tenantMgmt
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTenantMgmtStructData(
  Map<String, dynamic> firestoreData,
  TenantMgmtStruct? tenantMgmt,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tenantMgmt == null) {
    return;
  }
  if (tenantMgmt.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tenantMgmt.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tenantMgmtData = getTenantMgmtFirestoreData(tenantMgmt, forFieldValue);
  final nestedData = tenantMgmtData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tenantMgmt.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTenantMgmtFirestoreData(
  TenantMgmtStruct? tenantMgmt, [
  bool forFieldValue = false,
]) {
  if (tenantMgmt == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tenantMgmt.toMap());

  // Add any Firestore field values
  mapToFirestore(tenantMgmt.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTenantMgmtListFirestoreData(
  List<TenantMgmtStruct>? tenantMgmts,
) =>
    tenantMgmts?.map((e) => getTenantMgmtFirestoreData(e, true)).toList() ?? [];
