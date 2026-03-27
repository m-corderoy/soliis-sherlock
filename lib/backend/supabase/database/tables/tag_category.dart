import '../database.dart';

class TagCategoryTable extends SupabaseTable<TagCategoryRow> {
  @override
  String get tableName => 'tag_category';

  @override
  TagCategoryRow createRow(Map<String, dynamic> data) => TagCategoryRow(data);
}

class TagCategoryRow extends SupabaseDataRow {
  TagCategoryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagCategoryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
