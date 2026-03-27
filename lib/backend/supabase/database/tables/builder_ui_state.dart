import '../database.dart';

class BuilderUiStateTable extends SupabaseTable<BuilderUiStateRow> {
  @override
  String get tableName => 'builder_ui_state';

  @override
  BuilderUiStateRow createRow(Map<String, dynamic> data) =>
      BuilderUiStateRow(data);
}

class BuilderUiStateRow extends SupabaseDataRow {
  BuilderUiStateRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BuilderUiStateTable();

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  dynamic get blueprint => getField<dynamic>('blueprint')!;
  set blueprint(dynamic value) => setField<dynamic>('blueprint', value);

  String? get mode => getField<String>('mode');
  set mode(String? value) => setField<String>('mode', value);

  String? get progressSummary => getField<String>('progress_summary');
  set progressSummary(String? value) =>
      setField<String>('progress_summary', value);

  bool get undoAvailable => getField<bool>('undo_available')!;
  set undoAvailable(bool value) => setField<bool>('undo_available', value);

  bool get redoAvailable => getField<bool>('redo_available')!;
  set redoAvailable(bool value) => setField<bool>('redo_available', value);

  String? get suggestedNext => getField<String>('suggested_next');
  set suggestedNext(String? value) => setField<String>('suggested_next', value);

  dynamic get crossSectionFlags => getField<dynamic>('cross_section_flags')!;
  set crossSectionFlags(dynamic value) =>
      setField<dynamic>('cross_section_flags', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
