import '../database.dart';

class RecordTypeTable extends SupabaseTable<RecordTypeRow> {
  @override
  String get tableName => 'record_type';

  @override
  RecordTypeRow createRow(Map<String, dynamic> data) => RecordTypeRow(data);
}

class RecordTypeRow extends SupabaseDataRow {
  RecordTypeRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => RecordTypeTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
