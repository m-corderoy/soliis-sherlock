// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DisplayStruct extends FFFirebaseStruct {
  DisplayStruct({
    DateTime? datetime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _datetime = datetime,
        super(firestoreUtilData);

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  set datetime(DateTime? val) => _datetime = val;

  bool hasDatetime() => _datetime != null;

  static DisplayStruct fromMap(Map<String, dynamic> data) => DisplayStruct(
        datetime: data['datetime'] as DateTime?,
      );

  static DisplayStruct? maybeFromMap(dynamic data) =>
      data is Map ? DisplayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'datetime': _datetime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'datetime': serializeParam(
          _datetime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static DisplayStruct fromSerializableMap(Map<String, dynamic> data) =>
      DisplayStruct(
        datetime: deserializeParam(
          data['datetime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'DisplayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DisplayStruct && datetime == other.datetime;
  }

  @override
  int get hashCode => const ListEquality().hash([datetime]);
}

DisplayStruct createDisplayStruct({
  DateTime? datetime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DisplayStruct(
      datetime: datetime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DisplayStruct? updateDisplayStruct(
  DisplayStruct? display, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    display
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDisplayStructData(
  Map<String, dynamic> firestoreData,
  DisplayStruct? display,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (display == null) {
    return;
  }
  if (display.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && display.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final displayData = getDisplayFirestoreData(display, forFieldValue);
  final nestedData = displayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = display.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDisplayFirestoreData(
  DisplayStruct? display, [
  bool forFieldValue = false,
]) {
  if (display == null) {
    return {};
  }
  final firestoreData = mapToFirestore(display.toMap());

  // Add any Firestore field values
  mapToFirestore(display.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDisplayListFirestoreData(
  List<DisplayStruct>? displays,
) =>
    displays?.map((e) => getDisplayFirestoreData(e, true)).toList() ?? [];
