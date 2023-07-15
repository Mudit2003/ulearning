import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/values/constants.dart';

class StorageService {
  late final SharedPreferences _preferences;

  Future<StorageService> init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _preferences.setString(key, value);
  }

  bool getDeviceFirstOpen() =>
      _preferences.getBool(AppConstants.storageDeviceOpenFirstTime) ?? false;

  bool get isLoggedIn {
    return _preferences.getString(AppConstants.storageUserTokenKey) == null
        ? false
        : true;
  }

  Future<bool> remove(String key) {
    return _preferences.remove(key);
  }
}
