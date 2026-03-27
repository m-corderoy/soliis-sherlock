import '../database.dart';

class BoardProfileTable extends SupabaseTable<BoardProfileRow> {
  @override
  String get tableName => 'board_profile';

  @override
  BoardProfileRow createRow(Map<String, dynamic> data) => BoardProfileRow(data);
}

class BoardProfileRow extends SupabaseDataRow {
  BoardProfileRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => BoardProfileTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  int get boardId => getField<int>('board_id')!;
  set boardId(int value) => setField<int>('board_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  dynamic get profile => getField<dynamic>('profile')!;
  set profile(dynamic value) => setField<dynamic>('profile', value);

  int get version => getField<int>('version')!;
  set version(int value) => setField<int>('version', value);

  bool get isActive => getField<bool>('is_active')!;
  set isActive(bool value) => setField<bool>('is_active', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);
}
