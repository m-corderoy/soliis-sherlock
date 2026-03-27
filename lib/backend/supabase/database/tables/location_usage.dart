import '../database.dart';

class LocationUsageTable extends SupabaseTable<LocationUsageRow> {
  @override
  String get tableName => 'locationUsage';

  @override
  LocationUsageRow createRow(Map<String, dynamic> data) =>
      LocationUsageRow(data);
}

class LocationUsageRow extends SupabaseDataRow {
  LocationUsageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LocationUsageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  int get reportId => getField<int>('report_id')!;
  set reportId(int value) => setField<int>('report_id', value);

  int? get locationId => getField<int>('location_id');
  set locationId(int? value) => setField<int>('location_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
