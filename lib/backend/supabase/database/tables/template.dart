import '../database.dart';

class TemplateTable extends SupabaseTable<TemplateRow> {
  @override
  String get tableName => 'template';

  @override
  TemplateRow createRow(Map<String, dynamic> data) => TemplateRow(data);
}

class TemplateRow extends SupabaseDataRow {
  TemplateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TemplateTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);
}
