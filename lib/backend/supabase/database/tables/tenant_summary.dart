import '../database.dart';

class TenantSummaryTable extends SupabaseTable<TenantSummaryRow> {
  @override
  String get tableName => 'tenant_summary';

  @override
  TenantSummaryRow createRow(Map<String, dynamic> data) =>
      TenantSummaryRow(data);
}

class TenantSummaryRow extends SupabaseDataRow {
  TenantSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TenantSummaryTable();

  String? get knownas => getField<String>('knownas');
  set knownas(String? value) => setField<String>('knownas', value);

  String? get forename => getField<String>('forename');
  set forename(String? value) => setField<String>('forename', value);

  String? get surname => getField<String>('surname');
  set surname(String? value) => setField<String>('surname', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get expiry => getField<DateTime>('expiry');
  set expiry(DateTime? value) => setField<DateTime>('expiry', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get logoPath => getField<String>('logo_path');
  set logoPath(String? value) => setField<String>('logo_path', value);
}
