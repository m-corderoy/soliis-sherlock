import '../database.dart';

class ModelRecordTypeTable extends SupabaseTable<ModelRecordTypeRow> {
  @override
  String get tableName => 'model_record_type';

  @override
  ModelRecordTypeRow createRow(Map<String, dynamic> data) =>
      ModelRecordTypeRow(data);
}

class ModelRecordTypeRow extends SupabaseDataRow {
  ModelRecordTypeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModelRecordTypeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get modelDefinitionId => getField<int>('model_definition_id')!;
  set modelDefinitionId(int value) =>
      setField<int>('model_definition_id', value);

  int get recordTypeId => getField<int>('record_type_id')!;
  set recordTypeId(int value) => setField<int>('record_type_id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
