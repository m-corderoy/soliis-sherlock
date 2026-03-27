import '../database.dart';

class AlertTable extends SupabaseTable<AlertRow> {
  @override
  String get tableName => 'alert';

  @override
  AlertRow createRow(Map<String, dynamic> data) => AlertRow(data);
}

class AlertRow extends SupabaseDataRow {
  AlertRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AlertTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);
}
