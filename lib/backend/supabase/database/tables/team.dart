import '../database.dart';

class TeamTable extends SupabaseTable<TeamRow> {
  @override
  String get tableName => 'team';

  @override
  TeamRow createRow(Map<String, dynamic> data) => TeamRow(data);
}

class TeamRow extends SupabaseDataRow {
  TeamRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TeamTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  int? get parentId => getField<int>('parent_id');
  set parentId(int? value) => setField<int>('parent_id', value);

  bool get hasChildren => getField<bool>('has_children')!;
  set hasChildren(bool value) => setField<bool>('has_children', value);

  bool get hasLinks => getField<bool>('has_links')!;
  set hasLinks(bool value) => setField<bool>('has_links', value);

  String? get longTerm => getField<String>('long_term');
  set longTerm(String? value) => setField<String>('long_term', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get path => getField<String>('path');
  set path(String? value) => setField<String>('path', value);

  int? get channelType => getField<int>('channelType');
  set channelType(int? value) => setField<int>('channelType', value);

  String? get channelName => getField<String>('channelName');
  set channelName(String? value) => setField<String>('channelName', value);

  String? get teamLead => getField<String>('teamLead');
  set teamLead(String? value) => setField<String>('teamLead', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);
}
