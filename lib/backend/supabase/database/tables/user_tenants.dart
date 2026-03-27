import '../database.dart';

class UserTenantsTable extends SupabaseTable<UserTenantsRow> {
  @override
  String get tableName => 'user_tenants';

  @override
  UserTenantsRow createRow(Map<String, dynamic> data) => UserTenantsRow(data);
}

class UserTenantsRow extends SupabaseDataRow {
  UserTenantsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTenantsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get authAdmin => getField<int>('auth_admin');
  set authAdmin(int? value) => setField<int>('auth_admin', value);

  int? get userAdmin => getField<int>('userAdmin');
  set userAdmin(int? value) => setField<int>('userAdmin', value);

  int? get accessControl => getField<int>('accessControl');
  set accessControl(int? value) => setField<int>('accessControl', value);

  int? get dispatchAdmin => getField<int>('dispatchAdmin');
  set dispatchAdmin(int? value) => setField<int>('dispatchAdmin', value);
}
