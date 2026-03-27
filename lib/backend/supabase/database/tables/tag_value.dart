import '../database.dart';

class TagValueTable extends SupabaseTable<TagValueRow> {
  @override
  String get tableName => 'tag_value';

  @override
  TagValueRow createRow(Map<String, dynamic> data) => TagValueRow(data);
}

class TagValueRow extends SupabaseDataRow {
  TagValueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TagValueTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int get tagCategoryId => getField<int>('tag_category_id')!;
  set tagCategoryId(int value) => setField<int>('tag_category_id', value);

  String get value => getField<String>('value')!;
  set value(String value) => setField<String>('value', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
