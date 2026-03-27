import '../database.dart';

class PriorityItemTable extends SupabaseTable<PriorityItemRow> {
  @override
  String get tableName => 'priority_item';

  @override
  PriorityItemRow createRow(Map<String, dynamic> data) => PriorityItemRow(data);
}

class PriorityItemRow extends SupabaseDataRow {
  PriorityItemRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PriorityItemTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get priorityDefId => getField<int>('priority_def_id')!;
  set priorityDefId(int value) => setField<int>('priority_def_id', value);

  String get slug => getField<String>('slug')!;
  set slug(String value) => setField<String>('slug', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  List<String> get keywords => getListField<String>('keywords');
  set keywords(List<String>? value) => setListField<String>('keywords', value);

  int? get responseMinutes => getField<int>('response_minutes');
  set responseMinutes(int? value) => setField<int>('response_minutes', value);

  int? get escalationMinutes => getField<int>('escalation_minutes');
  set escalationMinutes(int? value) =>
      setField<int>('escalation_minutes', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  int? get sortOrder => getField<int>('sort_order');
  set sortOrder(int? value) => setField<int>('sort_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);
}
