import '../database.dart';

class TrainingExampleTable extends SupabaseTable<TrainingExampleRow> {
  @override
  String get tableName => 'training_example';

  @override
  TrainingExampleRow createRow(Map<String, dynamic> data) =>
      TrainingExampleRow(data);
}

class TrainingExampleRow extends SupabaseDataRow {
  TrainingExampleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingExampleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int? get recordTypeId => getField<int>('record_type_id');
  set recordTypeId(int? value) => setField<int>('record_type_id', value);

  String? get systemPrompt => getField<String>('system_prompt');
  set systemPrompt(String? value) => setField<String>('system_prompt', value);

  String get assistantResponse => getField<String>('assistant_response')!;
  set assistantResponse(String value) =>
      setField<String>('assistant_response', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
