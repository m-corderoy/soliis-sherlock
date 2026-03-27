import '../database.dart';

class OpsTable extends SupabaseTable<OpsRow> {
  @override
  String get tableName => 'ops';

  @override
  OpsRow createRow(Map<String, dynamic> data) => OpsRow(data);
}

class OpsRow extends SupabaseDataRow {
  OpsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => OpsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get opsBoardId => getField<int>('ops_board_id')!;
  set opsBoardId(int value) => setField<int>('ops_board_id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageurl => getField<String>('imageurl');
  set imageurl(String? value) => setField<String>('imageurl', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  int? get reportId => getField<int>('report_id');
  set reportId(int? value) => setField<int>('report_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  dynamic get payload => getField<dynamic>('payload');
  set payload(dynamic value) => setField<dynamic>('payload', value);

  int? get reportType => getField<int>('report_type');
  set reportType(int? value) => setField<int>('report_type', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  dynamic get postedData => getField<dynamic>('postedData');
  set postedData(dynamic value) => setField<dynamic>('postedData', value);

  String? get assetGroupRef => getField<String>('assetGroupRef');
  set assetGroupRef(String? value) => setField<String>('assetGroupRef', value);

  String? get assetGroupParam1 => getField<String>('assetGroupParam1');
  set assetGroupParam1(String? value) =>
      setField<String>('assetGroupParam1', value);

  String? get assetGroupParam2 => getField<String>('assetGroupParam2');
  set assetGroupParam2(String? value) =>
      setField<String>('assetGroupParam2', value);

  String? get assetGroupParam3 => getField<String>('assetGroupParam3');
  set assetGroupParam3(String? value) =>
      setField<String>('assetGroupParam3', value);

  int? get assetGroupint1 => getField<int>('assetGroupint1');
  set assetGroupint1(int? value) => setField<int>('assetGroupint1', value);

  int? get assetGroupint2 => getField<int>('assetGroupint2');
  set assetGroupint2(int? value) => setField<int>('assetGroupint2', value);

  String? get locationGroupRef => getField<String>('locationGroupRef');
  set locationGroupRef(String? value) =>
      setField<String>('locationGroupRef', value);

  String? get locationGroupParam1 => getField<String>('locationGroupParam1');
  set locationGroupParam1(String? value) =>
      setField<String>('locationGroupParam1', value);

  String? get locationGroupParam2 => getField<String>('locationGroupParam2');
  set locationGroupParam2(String? value) =>
      setField<String>('locationGroupParam2', value);

  String? get locationGroupParam3 => getField<String>('locationGroupParam3');
  set locationGroupParam3(String? value) =>
      setField<String>('locationGroupParam3', value);

  int? get locationGroupint1 => getField<int>('locationGroupint1');
  set locationGroupint1(int? value) =>
      setField<int>('locationGroupint1', value);

  int? get locationGroupint2 => getField<int>('locationGroupint2');
  set locationGroupint2(int? value) =>
      setField<int>('locationGroupint2', value);

  bool? get schemaExtraction => getField<bool>('schemaExtraction');
  set schemaExtraction(bool? value) =>
      setField<bool>('schemaExtraction', value);

  String? get headline => getField<String>('headline');
  set headline(String? value) => setField<String>('headline', value);

  int? get multicardRef => getField<int>('multicardRef');
  set multicardRef(int? value) => setField<int>('multicardRef', value);

  dynamic get utp => getField<dynamic>('utp');
  set utp(dynamic value) => setField<dynamic>('utp', value);

  dynamic get signalView => getField<dynamic>('signal_view');
  set signalView(dynamic value) => setField<dynamic>('signal_view', value);
}
