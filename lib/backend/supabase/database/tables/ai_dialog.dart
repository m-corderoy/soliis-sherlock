import '../database.dart';

class AiDialogTable extends SupabaseTable<AiDialogRow> {
  @override
  String get tableName => 'ai_dialog';

  @override
  AiDialogRow createRow(Map<String, dynamic> data) => AiDialogRow(data);
}

class AiDialogRow extends SupabaseDataRow {
  AiDialogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AiDialogTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  bool? get sourceAI => getField<bool>('sourceAI');
  set sourceAI(bool? value) => setField<bool>('sourceAI', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  String get dialogId => getField<String>('dialog_id')!;
  set dialogId(String value) => setField<String>('dialog_id', value);
}
