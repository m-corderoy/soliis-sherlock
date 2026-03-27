import '../database.dart';

class ConfigDraftSnapshotsTable extends SupabaseTable<ConfigDraftSnapshotsRow> {
  @override
  String get tableName => 'config_draft_snapshots';

  @override
  ConfigDraftSnapshotsRow createRow(Map<String, dynamic> data) =>
      ConfigDraftSnapshotsRow(data);
}

class ConfigDraftSnapshotsRow extends SupabaseDataRow {
  ConfigDraftSnapshotsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfigDraftSnapshotsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  dynamic get snapshotJson => getField<dynamic>('snapshot_json')!;
  set snapshotJson(dynamic value) => setField<dynamic>('snapshot_json', value);

  String get snapshotType => getField<String>('snapshot_type')!;
  set snapshotType(String value) => setField<String>('snapshot_type', value);

  int get version => getField<int>('version')!;
  set version(int value) => setField<int>('version', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
