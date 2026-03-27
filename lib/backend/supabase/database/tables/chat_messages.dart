import '../database.dart';

class ChatMessagesTable extends SupabaseTable<ChatMessagesRow> {
  @override
  String get tableName => 'chat_messages';

  @override
  ChatMessagesRow createRow(Map<String, dynamic> data) => ChatMessagesRow(data);
}

class ChatMessagesRow extends SupabaseDataRow {
  ChatMessagesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ChatMessagesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  String get sessionId => getField<String>('session_id')!;
  set sessionId(String value) => setField<String>('session_id', value);

  String get userEmail => getField<String>('user_email')!;
  set userEmail(String value) => setField<String>('user_email', value);

  String get messageType => getField<String>('message_type')!;
  set messageType(String value) => setField<String>('message_type', value);

  dynamic get content => getField<dynamic>('content')!;
  set content(dynamic value) => setField<dynamic>('content', value);

  String get contentType => getField<String>('content_type')!;
  set contentType(String value) => setField<String>('content_type', value);

  String? get mimeType => getField<String>('mime_type');
  set mimeType(String? value) => setField<String>('mime_type', value);

  String? get filename => getField<String>('filename');
  set filename(String? value) => setField<String>('filename', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
