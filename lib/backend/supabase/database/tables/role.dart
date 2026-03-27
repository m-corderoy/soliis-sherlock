import '../database.dart';

class RoleTable extends SupabaseTable<RoleRow> {
  @override
  String get tableName => 'role';

  @override
  RoleRow createRow(Map<String, dynamic> data) => RoleRow(data);
}

class RoleRow extends SupabaseDataRow {
  RoleRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RoleTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get parentId => getField<int>('parent_id');
  set parentId(int? value) => setField<int>('parent_id', value);

  String? get longTerm => getField<String>('long_term');
  set longTerm(String? value) => setField<String>('long_term', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);
}
