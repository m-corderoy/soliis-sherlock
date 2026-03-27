import '../database.dart';

class SessionUserTable extends SupabaseTable<SessionUserRow> {
  @override
  String get tableName => 'session_user';

  @override
  SessionUserRow createRow(Map<String, dynamic> data) => SessionUserRow(data);
}

class SessionUserRow extends SupabaseDataRow {
  SessionUserRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SessionUserTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get sessionId => getField<int>('session_id');
  set sessionId(int? value) => setField<int>('session_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);
}
