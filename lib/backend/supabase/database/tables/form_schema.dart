import '../database.dart';

class FormSchemaTable extends SupabaseTable<FormSchemaRow> {
  @override
  String get tableName => 'form_schema';

  @override
  FormSchemaRow createRow(Map<String, dynamic> data) => FormSchemaRow(data);
}

class FormSchemaRow extends SupabaseDataRow {
  FormSchemaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => FormSchemaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  String get key => getField<String>('key')!;
  set key(String value) => setField<String>('key', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String get schemaDraft => getField<String>('schema_draft')!;
  set schemaDraft(String value) => setField<String>('schema_draft', value);

  String? get schemaId => getField<String>('schema_id');
  set schemaId(String? value) => setField<String>('schema_id', value);

  bool get additionalProperties => getField<bool>('additional_properties')!;
  set additionalProperties(bool value) =>
      setField<bool>('additional_properties', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  DateTime get updatedAt => getField<DateTime>('updated_at')!;
  set updatedAt(DateTime value) => setField<DateTime>('updated_at', value);

  dynamic get schemaJson => getField<dynamic>('schema_json');
  set schemaJson(dynamic value) => setField<dynamic>('schema_json', value);

  String? get publishedVersion => getField<String>('published_version');
  set publishedVersion(String? value) =>
      setField<String>('published_version', value);

  DateTime? get publishedAt => getField<DateTime>('published_at');
  set publishedAt(DateTime? value) => setField<DateTime>('published_at', value);

  String? get publishedBy => getField<String>('published_by');
  set publishedBy(String? value) => setField<String>('published_by', value);

  String? get schemaHash => getField<String>('schema_hash');
  set schemaHash(String? value) => setField<String>('schema_hash', value);

  String? get schemaType => getField<String>('schema_type');
  set schemaType(String? value) => setField<String>('schema_type', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String? get parentBoardId => getField<String>('parent_board_id');
  set parentBoardId(String? value) =>
      setField<String>('parent_board_id', value);
}
