import '../database.dart';

class ImageUrlTable extends SupabaseTable<ImageUrlRow> {
  @override
  String get tableName => 'image_url';

  @override
  ImageUrlRow createRow(Map<String, dynamic> data) => ImageUrlRow(data);
}

class ImageUrlRow extends SupabaseDataRow {
  ImageUrlRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ImageUrlTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int? get userMessageId => getField<int>('user_message_id');
  set userMessageId(int? value) => setField<int>('user_message_id', value);

  String get url => getField<String>('url')!;
  set url(String value) => setField<String>('url', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
