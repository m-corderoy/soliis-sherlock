import '../database.dart';

class AssetUsageTable extends SupabaseTable<AssetUsageRow> {
  @override
  String get tableName => 'assetUsage';

  @override
  AssetUsageRow createRow(Map<String, dynamic> data) => AssetUsageRow(data);
}

class AssetUsageRow extends SupabaseDataRow {
  AssetUsageRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AssetUsageTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  int get reportId => getField<int>('report_id')!;
  set reportId(int value) => setField<int>('report_id', value);

  int get assetId => getField<int>('asset_id')!;
  set assetId(int value) => setField<int>('asset_id', value);

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);
}
