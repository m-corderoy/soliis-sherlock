import '../database.dart';

class ListTable extends SupabaseTable<ListRow> {
  @override
  String get tableName => 'list';

  @override
  ListRow createRow(Map<String, dynamic> data) => ListRow(data);
}

class ListRow extends SupabaseDataRow {
  ListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);
}
