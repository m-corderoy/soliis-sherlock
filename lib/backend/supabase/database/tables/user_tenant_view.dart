import '../database.dart';

class UserTenantViewTable extends SupabaseTable<UserTenantViewRow> {
  @override
  String get tableName => 'user_tenant_view';

  @override
  UserTenantViewRow createRow(Map<String, dynamic> data) =>
      UserTenantViewRow(data);
}

class UserTenantViewRow extends SupabaseDataRow {
  UserTenantViewRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserTenantViewTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get knownas => getField<String>('knownas');
  set knownas(String? value) => setField<String>('knownas', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get forename => getField<String>('forename');
  set forename(String? value) => setField<String>('forename', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get compoundname => getField<String>('compoundname');
  set compoundname(String? value) => setField<String>('compoundname', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get mobile => getField<String>('mobile');
  set mobile(String? value) => setField<String>('mobile', value);

  String? get photoUrl => getField<String>('photo_url');
  set photoUrl(String? value) => setField<String>('photo_url', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get tenantName => getField<String>('tenant_name');
  set tenantName(String? value) => setField<String>('tenant_name', value);

  DateTime? get expiryDate => getField<DateTime>('expiry_date');
  set expiryDate(DateTime? value) => setField<DateTime>('expiry_date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get firstLangList => getField<int>('first_lang_list');
  set firstLangList(int? value) => setField<int>('first_lang_list', value);

  int? get locationStartID => getField<int>('locationStartID');
  set locationStartID(int? value) => setField<int>('locationStartID', value);

  int? get teamStartID => getField<int>('teamStartID');
  set teamStartID(int? value) => setField<int>('teamStartID', value);

  int? get rolesID => getField<int>('rolesID');
  set rolesID(int? value) => setField<int>('rolesID', value);

  int? get authAdmin => getField<int>('auth_admin');
  set authAdmin(int? value) => setField<int>('auth_admin', value);

  int? get accessControl => getField<int>('accessControl');
  set accessControl(int? value) => setField<int>('accessControl', value);

  int? get userAdmin => getField<int>('userAdmin');
  set userAdmin(int? value) => setField<int>('userAdmin', value);

  int? get dispatchAdmin => getField<int>('dispatchAdmin');
  set dispatchAdmin(int? value) => setField<int>('dispatchAdmin', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  String? get profile => getField<String>('profile');
  set profile(String? value) => setField<String>('profile', value);
}
