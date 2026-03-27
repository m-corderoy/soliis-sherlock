import '../database.dart';

class AppComplianceTable extends SupabaseTable<AppComplianceRow> {
  @override
  String get tableName => 'app_compliance';

  @override
  AppComplianceRow createRow(Map<String, dynamic> data) =>
      AppComplianceRow(data);
}

class AppComplianceRow extends SupabaseDataRow {
  AppComplianceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppComplianceTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String get html => getField<String>('html')!;
  set html(String value) => setField<String>('html', value);
}
