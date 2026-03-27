import '../database.dart';

class ListEntryTable extends SupabaseTable<ListEntryRow> {
  @override
  String get tableName => 'list_entry';

  @override
  ListEntryRow createRow(Map<String, dynamic> data) => ListEntryRow(data);
}

class ListEntryRow extends SupabaseDataRow {
  ListEntryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ListEntryTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get listId => getField<int>('list_id');
  set listId(int? value) => setField<int>('list_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get param1 => getField<int>('param1');
  set param1(int? value) => setField<int>('param1', value);

  String? get param2 => getField<String>('param2');
  set param2(String? value) => setField<String>('param2', value);

  int? get order => getField<int>('order');
  set order(int? value) => setField<int>('order', value);
}
