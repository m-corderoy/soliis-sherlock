import '../database.dart';

class LocationLinkTable extends SupabaseTable<LocationLinkRow> {
  @override
  String get tableName => 'location_link';

  @override
  LocationLinkRow createRow(Map<String, dynamic> data) => LocationLinkRow(data);
}

class LocationLinkRow extends SupabaseDataRow {
  LocationLinkRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationLinkTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get nodeId => getField<int>('node_id')!;
  set nodeId(int value) => setField<int>('node_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);
}
