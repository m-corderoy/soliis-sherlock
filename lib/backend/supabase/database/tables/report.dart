import '../database.dart';

class ReportTable extends SupabaseTable<ReportRow> {
  @override
  String get tableName => 'report';

  @override
  ReportRow createRow(Map<String, dynamic> data) => ReportRow(data);
}

class ReportRow extends SupabaseDataRow {
  ReportRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ReportTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get tenantId => getField<int>('tenant_id');
  set tenantId(int? value) => setField<int>('tenant_id', value);

  int? get opsBoardId => getField<int>('ops_board_id');
  set opsBoardId(int? value) => setField<int>('ops_board_id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get uiDescription => getField<String>('ui_description');
  set uiDescription(String? value) => setField<String>('ui_description', value);

  String? get urlIcon => getField<String>('url_icon');
  set urlIcon(String? value) => setField<String>('url_icon', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get helptext => getField<String>('helptext');
  set helptext(String? value) => setField<String>('helptext', value);

  String? get helpImage => getField<String>('helpImage');
  set helpImage(String? value) => setField<String>('helpImage', value);

  int? get reportType => getField<int>('report_type');
  set reportType(int? value) => setField<int>('report_type', value);

  int? get useageTracker => getField<int>('useage_tracker');
  set useageTracker(int? value) => setField<int>('useage_tracker', value);

  String? get prompt => getField<String>('prompt');
  set prompt(String? value) => setField<String>('prompt', value);

  String? get teamPath => getField<String>('team_path');
  set teamPath(String? value) => setField<String>('team_path', value);

  String? get locationPath => getField<String>('location_path');
  set locationPath(String? value) => setField<String>('location_path', value);

  List<int> get roleIds => getListField<int>('role_ids');
  set roleIds(List<int> value) => setListField<int>('role_ids', value);

  int? get status => getField<int>('status');
  set status(int? value) => setField<int>('status', value);

  bool? get assetAware => getField<bool>('assetAware');
  set assetAware(bool? value) => setField<bool>('assetAware', value);

  bool? get locationAware => getField<bool>('locationAware');
  set locationAware(bool? value) => setField<bool>('locationAware', value);

  int? get assetValue => getField<int>('assetValue');
  set assetValue(int? value) => setField<int>('assetValue', value);

  int? get locationValue => getField<int>('locationValue');
  set locationValue(int? value) => setField<int>('locationValue', value);

  int? get locationSelectedLocation =>
      getField<int>('location_selectedLocation');
  set locationSelectedLocation(int? value) =>
      setField<int>('location_selectedLocation', value);

  int? get teamSelectedTeam => getField<int>('team_selectedTeam');
  set teamSelectedTeam(int? value) => setField<int>('team_selectedTeam', value);

  String? get assetNameDescription => getField<String>('assetNameDescription');
  set assetNameDescription(String? value) =>
      setField<String>('assetNameDescription', value);

  String? get locationNameDescription =>
      getField<String>('locationNameDescription');
  set locationNameDescription(String? value) =>
      setField<String>('locationNameDescription', value);

  String? get locationSelectedTitle =>
      getField<String>('location_selectedTitle');
  set locationSelectedTitle(String? value) =>
      setField<String>('location_selectedTitle', value);

  bool? get showCounter => getField<bool>('showCounter');
  set showCounter(bool? value) => setField<bool>('showCounter', value);

  int? get counterThreshold => getField<int>('counterThreshold');
  set counterThreshold(int? value) => setField<int>('counterThreshold', value);

  int? get paramInt1 => getField<int>('paramInt1');
  set paramInt1(int? value) => setField<int>('paramInt1', value);

  dynamic get categories => getField<dynamic>('categories');
  set categories(dynamic value) => setField<dynamic>('categories', value);

  dynamic get priorities => getField<dynamic>('priorities');
  set priorities(dynamic value) => setField<dynamic>('priorities', value);

  int? get cTDSchema => getField<int>('CTD_schema');
  set cTDSchema(int? value) => setField<int>('CTD_schema', value);

  String? get cardType => getField<String>('card_type');
  set cardType(String? value) => setField<String>('card_type', value);
}
