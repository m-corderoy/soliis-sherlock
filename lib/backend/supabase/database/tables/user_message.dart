import '../database.dart';

class UserMessageTable extends SupabaseTable<UserMessageRow> {
  @override
  String get tableName => 'user_message';

  @override
  UserMessageRow createRow(Map<String, dynamic> data) => UserMessageRow(data);
}

class UserMessageRow extends SupabaseDataRow {
  UserMessageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserMessageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int? get trainingExampleId => getField<int>('training_example_id');
  set trainingExampleId(int? value) =>
      setField<int>('training_example_id', value);

  int get ordering => getField<int>('ordering')!;
  set ordering(int value) => setField<int>('ordering', value);

  String? get textContent => getField<String>('text_content');
  set textContent(String? value) => setField<String>('text_content', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
