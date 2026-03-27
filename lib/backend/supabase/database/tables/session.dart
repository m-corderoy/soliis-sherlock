import '../database.dart';

class SessionTable extends SupabaseTable<SessionRow> {
  @override
  String get tableName => 'session';

  @override
  SessionRow createRow(Map<String, dynamic> data) => SessionRow(data);
}

class SessionRow extends SupabaseDataRow {
  SessionRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SessionTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get sessionClosed => getField<bool>('sessionClosed');
  set sessionClosed(bool? value) => setField<bool>('sessionClosed', value);

  DateTime? get closeTimestamp => getField<DateTime>('closeTimestamp');
  set closeTimestamp(DateTime? value) =>
      setField<DateTime>('closeTimestamp', value);
}
