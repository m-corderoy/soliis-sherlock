import '../database.dart';

class AssistantTagTable extends SupabaseTable<AssistantTagRow> {
  @override
  String get tableName => 'assistant_tag';

  @override
  AssistantTagRow createRow(Map<String, dynamic> data) => AssistantTagRow(data);
}

class AssistantTagRow extends SupabaseDataRow {
  AssistantTagRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AssistantTagTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get trainingExampleId => getField<int>('training_example_id');
  set trainingExampleId(int? value) =>
      setField<int>('training_example_id', value);

  int get tagCategoryId => getField<int>('tag_category_id')!;
  set tagCategoryId(int value) => setField<int>('tag_category_id', value);

  int get tagValueId => getField<int>('tag_value_id')!;
  set tagValueId(int value) => setField<int>('tag_value_id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
