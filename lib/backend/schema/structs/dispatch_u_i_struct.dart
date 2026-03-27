// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DispatchUIStruct extends FFFirebaseStruct {
  DispatchUIStruct({
    int? selectedLocation,
    String? selectedLtreeLocation,
    int? selectedTeam,
    String? selectedLtreeTeam,
    List<int>? selectedRole,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _selectedLocation = selectedLocation,
        _selectedLtreeLocation = selectedLtreeLocation,
        _selectedTeam = selectedTeam,
        _selectedLtreeTeam = selectedLtreeTeam,
        _selectedRole = selectedRole,
        super(firestoreUtilData);

  // "selectedLocation" field.
  int? _selectedLocation;
  int get selectedLocation => _selectedLocation ?? 0;
  set selectedLocation(int? val) => _selectedLocation = val;

  void incrementSelectedLocation(int amount) =>
      selectedLocation = selectedLocation + amount;

  bool hasSelectedLocation() => _selectedLocation != null;

  // "selectedLtreeLocation" field.
  String? _selectedLtreeLocation;
  String get selectedLtreeLocation => _selectedLtreeLocation ?? '';
  set selectedLtreeLocation(String? val) => _selectedLtreeLocation = val;

  bool hasSelectedLtreeLocation() => _selectedLtreeLocation != null;

  // "selectedTeam" field.
  int? _selectedTeam;
  int get selectedTeam => _selectedTeam ?? 0;
  set selectedTeam(int? val) => _selectedTeam = val;

  void incrementSelectedTeam(int amount) =>
      selectedTeam = selectedTeam + amount;

  bool hasSelectedTeam() => _selectedTeam != null;

  // "selectedLtreeTeam" field.
  String? _selectedLtreeTeam;
  String get selectedLtreeTeam => _selectedLtreeTeam ?? '';
  set selectedLtreeTeam(String? val) => _selectedLtreeTeam = val;

  bool hasSelectedLtreeTeam() => _selectedLtreeTeam != null;

  // "selectedRole" field.
  List<int>? _selectedRole;
  List<int> get selectedRole => _selectedRole ?? const [];
  set selectedRole(List<int>? val) => _selectedRole = val;

  void updateSelectedRole(Function(List<int>) updateFn) {
    updateFn(_selectedRole ??= []);
  }

  bool hasSelectedRole() => _selectedRole != null;

  static DispatchUIStruct fromMap(Map<String, dynamic> data) =>
      DispatchUIStruct(
        selectedLocation: castToType<int>(data['selectedLocation']),
        selectedLtreeLocation: data['selectedLtreeLocation'] as String?,
        selectedTeam: castToType<int>(data['selectedTeam']),
        selectedLtreeTeam: data['selectedLtreeTeam'] as String?,
        selectedRole: getDataList(data['selectedRole']),
      );

  static DispatchUIStruct? maybeFromMap(dynamic data) => data is Map
      ? DispatchUIStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'selectedLocation': _selectedLocation,
        'selectedLtreeLocation': _selectedLtreeLocation,
        'selectedTeam': _selectedTeam,
        'selectedLtreeTeam': _selectedLtreeTeam,
        'selectedRole': _selectedRole,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'selectedLocation': serializeParam(
          _selectedLocation,
          ParamType.int,
        ),
        'selectedLtreeLocation': serializeParam(
          _selectedLtreeLocation,
          ParamType.String,
        ),
        'selectedTeam': serializeParam(
          _selectedTeam,
          ParamType.int,
        ),
        'selectedLtreeTeam': serializeParam(
          _selectedLtreeTeam,
          ParamType.String,
        ),
        'selectedRole': serializeParam(
          _selectedRole,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static DispatchUIStruct fromSerializableMap(Map<String, dynamic> data) =>
      DispatchUIStruct(
        selectedLocation: deserializeParam(
          data['selectedLocation'],
          ParamType.int,
          false,
        ),
        selectedLtreeLocation: deserializeParam(
          data['selectedLtreeLocation'],
          ParamType.String,
          false,
        ),
        selectedTeam: deserializeParam(
          data['selectedTeam'],
          ParamType.int,
          false,
        ),
        selectedLtreeTeam: deserializeParam(
          data['selectedLtreeTeam'],
          ParamType.String,
          false,
        ),
        selectedRole: deserializeParam<int>(
          data['selectedRole'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'DispatchUIStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is DispatchUIStruct &&
        selectedLocation == other.selectedLocation &&
        selectedLtreeLocation == other.selectedLtreeLocation &&
        selectedTeam == other.selectedTeam &&
        selectedLtreeTeam == other.selectedLtreeTeam &&
        listEquality.equals(selectedRole, other.selectedRole);
  }

  @override
  int get hashCode => const ListEquality().hash([
        selectedLocation,
        selectedLtreeLocation,
        selectedTeam,
        selectedLtreeTeam,
        selectedRole
      ]);
}

DispatchUIStruct createDispatchUIStruct({
  int? selectedLocation,
  String? selectedLtreeLocation,
  int? selectedTeam,
  String? selectedLtreeTeam,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DispatchUIStruct(
      selectedLocation: selectedLocation,
      selectedLtreeLocation: selectedLtreeLocation,
      selectedTeam: selectedTeam,
      selectedLtreeTeam: selectedLtreeTeam,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DispatchUIStruct? updateDispatchUIStruct(
  DispatchUIStruct? dispatchUI, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    dispatchUI
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDispatchUIStructData(
  Map<String, dynamic> firestoreData,
  DispatchUIStruct? dispatchUI,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (dispatchUI == null) {
    return;
  }
  if (dispatchUI.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && dispatchUI.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final dispatchUIData = getDispatchUIFirestoreData(dispatchUI, forFieldValue);
  final nestedData = dispatchUIData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = dispatchUI.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDispatchUIFirestoreData(
  DispatchUIStruct? dispatchUI, [
  bool forFieldValue = false,
]) {
  if (dispatchUI == null) {
    return {};
  }
  final firestoreData = mapToFirestore(dispatchUI.toMap());

  // Add any Firestore field values
  dispatchUI.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDispatchUIListFirestoreData(
  List<DispatchUIStruct>? dispatchUIs,
) =>
    dispatchUIs?.map((e) => getDispatchUIFirestoreData(e, true)).toList() ?? [];
