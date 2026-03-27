import '../database.dart';

class AssetRefTable extends SupabaseTable<AssetRefRow> {
  @override
  String get tableName => 'assetRef';

  @override
  AssetRefRow createRow(Map<String, dynamic> data) => AssetRefRow(data);
}

class AssetRefRow extends SupabaseDataRow {
  AssetRefRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AssetRefTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get assetRef => getField<String>('assetRef')!;
  set assetRef(String value) => setField<String>('assetRef', value);

  String? get param1 => getField<String>('param1');
  set param1(String? value) => setField<String>('param1', value);

  String? get param2 => getField<String>('param2');
  set param2(String? value) => setField<String>('param2', value);

  String? get param3 => getField<String>('param3');
  set param3(String? value) => setField<String>('param3', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int? get int1 => getField<int>('int1');
  set int1(int? value) => setField<int>('int1', value);

  int? get int2 => getField<int>('int2');
  set int2(int? value) => setField<int>('int2', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
