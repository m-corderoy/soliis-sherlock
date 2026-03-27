import '../database.dart';

class TrainingJsonlViewTable extends SupabaseTable<TrainingJsonlViewRow> {
  @override
  String get tableName => 'training_jsonl_view';

  @override
  TrainingJsonlViewRow createRow(Map<String, dynamic> data) =>
      TrainingJsonlViewRow(data);
}

class TrainingJsonlViewRow extends SupabaseDataRow {
  TrainingJsonlViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TrainingJsonlViewTable();

  int? get modelDefinitionId => getField<int>('model_definition_id');
  set modelDefinitionId(int? value) =>
      setField<int>('model_definition_id', value);

  dynamic get jsonl => getField<dynamic>('jsonl');
  set jsonl(dynamic value) => setField<dynamic>('jsonl', value);
}
