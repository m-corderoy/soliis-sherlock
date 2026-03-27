import '../database.dart';

class ModelDefinitionTable extends SupabaseTable<ModelDefinitionRow> {
  @override
  String get tableName => 'model_definition';

  @override
  ModelDefinitionRow createRow(Map<String, dynamic> data) =>
      ModelDefinitionRow(data);
}

class ModelDefinitionRow extends SupabaseDataRow {
  ModelDefinitionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ModelDefinitionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String get modelName => getField<String>('model_name')!;
  set modelName(String value) => setField<String>('model_name', value);

  String get baseModel => getField<String>('base_model')!;
  set baseModel(String value) => setField<String>('base_model', value);

  String? get suffix => getField<String>('suffix');
  set suffix(String? value) => setField<String>('suffix', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
