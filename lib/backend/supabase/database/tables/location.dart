import '../database.dart';

class LocationTable extends SupabaseTable<LocationRow> {
  @override
  String get tableName => 'location';

  @override
  LocationRow createRow(Map<String, dynamic> data) => LocationRow(data);
}

class LocationRow extends SupabaseDataRow {
  LocationRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get parentId => getField<int>('parent_id');
  set parentId(int? value) => setField<int>('parent_id', value);

  bool get hasChildren => getField<bool>('has_children')!;
  set hasChildren(bool value) => setField<bool>('has_children', value);

  bool get hasLinks => getField<bool>('has_links')!;
  set hasLinks(bool value) => setField<bool>('has_links', value);

  String? get longTerm => getField<String>('long_term');
  set longTerm(String? value) => setField<String>('long_term', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get path => getField<String>('path');
  set path(String? value) => setField<String>('path', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get point => getField<String>('point');
  set point(String? value) => setField<String>('point', value);

  String? get area => getField<String>('area');
  set area(String? value) => setField<String>('area', value);
}
