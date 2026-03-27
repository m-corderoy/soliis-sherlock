import '../database.dart';

class PriorityDefTable extends SupabaseTable<PriorityDefRow> {
  @override
  String get tableName => 'priority_def';

  @override
  PriorityDefRow createRow(Map<String, dynamic> data) => PriorityDefRow(data);
}

class PriorityDefRow extends SupabaseDataRow {
  PriorityDefRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PriorityDefTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get reportId => getField<int>('report_id')!;
  set reportId(int value) => setField<int>('report_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  bool? get isRequired => getField<bool>('is_required');
  set isRequired(bool? value) => setField<bool>('is_required', value);
}
