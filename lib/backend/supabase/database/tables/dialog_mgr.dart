import '../database.dart';

class DialogMgrTable extends SupabaseTable<DialogMgrRow> {
  @override
  String get tableName => 'dialogMgr';

  @override
  DialogMgrRow createRow(Map<String, dynamic> data) => DialogMgrRow(data);
}

class DialogMgrRow extends SupabaseDataRow {
  DialogMgrRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => DialogMgrTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get dialogId => getField<String>('dialog_id')!;
  set dialogId(String value) => setField<String>('dialog_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);
}
