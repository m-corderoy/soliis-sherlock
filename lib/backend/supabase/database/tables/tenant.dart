import '../database.dart';

class TenantTable extends SupabaseTable<TenantRow> {
  @override
  String get tableName => 'tenant';

  @override
  TenantRow createRow(Map<String, dynamic> data) => TenantRow(data);
}

class TenantRow extends SupabaseDataRow {
  TenantRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TenantTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get owner => getField<String>('owner');
  set owner(String? value) => setField<String>('owner', value);

  DateTime? get expiryDate => getField<DateTime>('expiry_date');
  set expiryDate(DateTime? value) => setField<DateTime>('expiry_date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get logoUrl => getField<String>('logo_url');
  set logoUrl(String? value) => setField<String>('logo_url', value);

  int? get locationStartID => getField<int>('locationStartID');
  set locationStartID(int? value) => setField<int>('locationStartID', value);

  int? get rolesID => getField<int>('rolesID');
  set rolesID(int? value) => setField<int>('rolesID', value);

  int? get teamStartID => getField<int>('teamStartID');
  set teamStartID(int? value) => setField<int>('teamStartID', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  int? get firstLangList => getField<int>('first_lang_list');
  set firstLangList(int? value) => setField<int>('first_lang_list', value);
}
