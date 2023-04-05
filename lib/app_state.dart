import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
    _userId = await secureStorage.getInt('ff_userId') ?? _userId;
    _profileId = await secureStorage.getInt('ff_profileId') ?? _profileId;
    _profileType =
        await secureStorage.getString('ff_profileType') ?? _profileType;
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String _value) {
    _authToken = _value;
    secureStorage.setString('ff_authToken', _value);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }

  int _userId = 0;
  int get userId => _userId;
  set userId(int _value) {
    _userId = _value;
    secureStorage.setInt('ff_userId', _value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  int _profileId = 0;
  int get profileId => _profileId;
  set profileId(int _value) {
    _profileId = _value;
    secureStorage.setInt('ff_profileId', _value);
  }

  void deleteProfileId() {
    secureStorage.delete(key: 'ff_profileId');
  }

  String _profileType = '';
  String get profileType => _profileType;
  set profileType(String _value) {
    _profileType = _value;
    secureStorage.setString('ff_profileType', _value);
  }

  void deleteProfileType() {
    secureStorage.delete(key: 'ff_profileType');
  }

  bool _searchActive = false;
  bool get searchActive => _searchActive;
  set searchActive(bool _value) {
    _searchActive = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await write(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await write(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await write(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await write(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await write(key: key, value: ListToCsvConverter().convert([value]));
}
