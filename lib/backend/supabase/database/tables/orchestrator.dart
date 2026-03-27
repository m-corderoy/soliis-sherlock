import '../database.dart';

class OrchestratorTable extends SupabaseTable<OrchestratorRow> {
  @override
  String get tableName => 'orchestrator';

  @override
  OrchestratorRow createRow(Map<String, dynamic> data) => OrchestratorRow(data);
}

class OrchestratorRow extends SupabaseDataRow {
  OrchestratorRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OrchestratorTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  DateTime? get completedAt => getField<DateTime>('completed_at');
  set completedAt(DateTime? value) => setField<DateTime>('completed_at', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get opsId => getField<int>('ops_id');
  set opsId(int? value) => setField<int>('ops_id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get reportId => getField<int>('report_id');
  set reportId(int? value) => setField<int>('report_id', value);

  int? get reportType => getField<int>('report_type');
  set reportType(int? value) => setField<int>('report_type', value);

  int? get opsBoardId => getField<int>('ops_board_id');
  set opsBoardId(int? value) => setField<int>('ops_board_id', value);
}
