import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _menuOpen = prefs.getBool('ff_menuOpen') ?? _menuOpen;
    });
    _safeInit(() {
      _darkMode = prefs.getBool('ff_darkMode') ?? _darkMode;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_session')) {
        try {
          final serializedData = prefs.getString('ff_session') ?? '{}';
          _session =
              SessionStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _defaultOpsBoard = prefs.getInt('ff_defaultOpsBoard') ?? _defaultOpsBoard;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _supabaseAuthToken = '';
  String get supabaseAuthToken => _supabaseAuthToken;
  set supabaseAuthToken(String value) {
    _supabaseAuthToken = value;
  }

  bool _selfRegister = false;
  bool get selfRegister => _selfRegister;
  set selfRegister(bool value) {
    _selfRegister = value;
  }

  dynamic _blankJSONtree = jsonDecode('{\"name\":\"\"}');
  dynamic get blankJSONtree => _blankJSONtree;
  set blankJSONtree(dynamic value) {
    _blankJSONtree = value;
  }

  bool _menuOpen = true;
  bool get menuOpen => _menuOpen;
  set menuOpen(bool value) {
    _menuOpen = value;
    prefs.setBool('ff_menuOpen', value);
  }

  bool _darkMode = false;
  bool get darkMode => _darkMode;
  set darkMode(bool value) {
    _darkMode = value;
    prefs.setBool('ff_darkMode', value);
  }

  bool _OrgSettingsInView = true;
  bool get OrgSettingsInView => _OrgSettingsInView;
  set OrgSettingsInView(bool value) {
    _OrgSettingsInView = value;
  }

  SessionStruct _session = SessionStruct.fromSerializableMap(jsonDecode(
      '{\"tenantID\":\"0\",\"tenantName\":\"tenant\",\"locationTreeIDStart\":\"-1\",\"teamTreeIDStart\":\"-1\",\"roleTreeIDStart\":\"-1\",\"adminRole\":\"100\",\"accessControl\":\"100\",\"userAdmin\":\"100\",\"dispatchAdmin\":\"100\",\"orgAdmin\":\"100\",\"tenantPrompt\":\"prompt\"}'));
  SessionStruct get session => _session;
  set session(SessionStruct value) {
    _session = value;
    prefs.setString('ff_session', value.serialize());
  }

  void updateSessionStruct(Function(SessionStruct) updateFn) {
    updateFn(_session);
    prefs.setString('ff_session', _session.serialize());
  }

  TenantMgmtStruct _dashboardTenantMgmt = TenantMgmtStruct.fromSerializableMap(
      jsonDecode('{\"tenantName\":\"\",\"ownerName\":\"\",\"status\":\"\"}'));
  TenantMgmtStruct get dashboardTenantMgmt => _dashboardTenantMgmt;
  set dashboardTenantMgmt(TenantMgmtStruct value) {
    _dashboardTenantMgmt = value;
  }

  void updateDashboardTenantMgmtStruct(Function(TenantMgmtStruct) updateFn) {
    updateFn(_dashboardTenantMgmt);
  }

  DispatchUIStruct _dispatchUIcontrol = DispatchUIStruct();
  DispatchUIStruct get dispatchUIcontrol => _dispatchUIcontrol;
  set dispatchUIcontrol(DispatchUIStruct value) {
    _dispatchUIcontrol = value;
  }

  void updateDispatchUIcontrolStruct(Function(DispatchUIStruct) updateFn) {
    updateFn(_dispatchUIcontrol);
  }

  int _selectedLocation = 0;
  int get selectedLocation => _selectedLocation;
  set selectedLocation(int value) {
    _selectedLocation = value;
  }

  DispatchUIStruct _dispatchUIedit = DispatchUIStruct();
  DispatchUIStruct get dispatchUIedit => _dispatchUIedit;
  set dispatchUIedit(DispatchUIStruct value) {
    _dispatchUIedit = value;
  }

  void updateDispatchUIeditStruct(Function(DispatchUIStruct) updateFn) {
    updateFn(_dispatchUIedit);
  }

  int _selectedTeam = 0;
  int get selectedTeam => _selectedTeam;
  set selectedTeam(int value) {
    _selectedTeam = value;
  }

  List<dynamic> _treeTeam = [];
  List<dynamic> get treeTeam => _treeTeam;
  set treeTeam(List<dynamic> value) {
    _treeTeam = value;
  }

  void addToTreeTeam(dynamic value) {
    treeTeam.add(value);
  }

  void removeFromTreeTeam(dynamic value) {
    treeTeam.remove(value);
  }

  void removeAtIndexFromTreeTeam(int index) {
    treeTeam.removeAt(index);
  }

  void updateTreeTeamAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    treeTeam[index] = updateFn(_treeTeam[index]);
  }

  void insertAtIndexInTreeTeam(int index, dynamic value) {
    treeTeam.insert(index, value);
  }

  int _testvar = 0;
  int get testvar => _testvar;
  set testvar(int value) {
    _testvar = value;
  }

  int _selectedTreeNodeID = 0;
  int get selectedTreeNodeID => _selectedTreeNodeID;
  set selectedTreeNodeID(int value) {
    _selectedTreeNodeID = value;
  }

  bool _selectedTreeUpdate = false;
  bool get selectedTreeUpdate => _selectedTreeUpdate;
  set selectedTreeUpdate(bool value) {
    _selectedTreeUpdate = value;
  }

  int _selectedTreeOperation = 0;
  int get selectedTreeOperation => _selectedTreeOperation;
  set selectedTreeOperation(int value) {
    _selectedTreeOperation = value;
  }

  int _defaultOpsBoard = -1;
  int get defaultOpsBoard => _defaultOpsBoard;
  set defaultOpsBoard(int value) {
    _defaultOpsBoard = value;
    prefs.setInt('ff_defaultOpsBoard', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
