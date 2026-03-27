import '../database.dart';

class ConfigDraftsTable extends SupabaseTable<ConfigDraftsRow> {
  @override
  String get tableName => 'config_drafts';

  @override
  ConfigDraftsRow createRow(Map<String, dynamic> data) => ConfigDraftsRow(data);
}

class ConfigDraftsRow extends SupabaseDataRow {
  ConfigDraftsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ConfigDraftsTable();

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  String get configType => getField<String>('config_type')!;
  set configType(String value) => setField<String>('config_type', value);

  dynamic get draftJson => getField<dynamic>('draft_json')!;
  set draftJson(dynamic value) => setField<dynamic>('draft_json', value);

  int? get version => getField<int>('version');
  set version(int? value) => setField<int>('version', value);

  String? get sourceCtdId => getField<String>('source_ctd_id');
  set sourceCtdId(String? value) => setField<String>('source_ctd_id', value);

  String? get sourceVersion => getField<String>('source_version');
  set sourceVersion(String? value) => setField<String>('source_version', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
