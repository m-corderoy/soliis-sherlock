import '../database.dart';

class BuilderSessionsTable extends SupabaseTable<BuilderSessionsRow> {
  @override
  String get tableName => 'builder_sessions';

  @override
  BuilderSessionsRow createRow(Map<String, dynamic> data) =>
      BuilderSessionsRow(data);
}

class BuilderSessionsRow extends SupabaseDataRow {
  BuilderSessionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BuilderSessionsTable();

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String get schemaType => getField<String>('schema_type')!;
  set schemaType(String value) => setField<String>('schema_type', value);

  String get mode => getField<String>('mode')!;
  set mode(String value) => setField<String>('mode', value);

  String? get sectionFocus => getField<String>('section_focus');
  set sectionFocus(String? value) => setField<String>('section_focus', value);

  dynamic get guidedProgress => getField<dynamic>('guided_progress')!;
  set guidedProgress(dynamic value) =>
      setField<dynamic>('guided_progress', value);

  dynamic get hierarchy => getField<dynamic>('hierarchy')!;
  set hierarchy(dynamic value) => setField<dynamic>('hierarchy', value);

  dynamic get redoStack => getField<dynamic>('redo_stack')!;
  set redoStack(dynamic value) => setField<dynamic>('redo_stack', value);

  dynamic get attentionFlags => getField<dynamic>('attention_flags')!;
  set attentionFlags(dynamic value) =>
      setField<dynamic>('attention_flags', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
