import '../database.dart';

class OpsBoardTable extends SupabaseTable<OpsBoardRow> {
  @override
  String get tableName => 'ops_board';

  @override
  OpsBoardRow createRow(Map<String, dynamic> data) => OpsBoardRow(data);
}

class OpsBoardRow extends SupabaseDataRow {
  OpsBoardRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OpsBoardTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get tenantId => getField<int>('tenant_id')!;
  set tenantId(int value) => setField<int>('tenant_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  dynamic get btp => getField<dynamic>('BTP');
  set btp(dynamic value) => setField<dynamic>('BTP', value);

  dynamic get bTCSchema => getField<dynamic>('BTC_schema');
  set bTCSchema(dynamic value) => setField<dynamic>('BTC_schema', value);

  int? get bTCId => getField<int>('BTC_id');
  set bTCId(int? value) => setField<int>('BTC_id', value);

  int? get signalId => getField<int>('signal_id');
  set signalId(int? value) => setField<int>('signal_id', value);
}
