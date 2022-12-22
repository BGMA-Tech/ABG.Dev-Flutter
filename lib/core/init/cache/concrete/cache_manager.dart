import 'package:abgdev_flutter/core/init/cache/abstract/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }
  static final CacheManager _instance = CacheManager._init();

  SharedPreferences? _preferences;
  static CacheManager get instance => _instance;
  static Future prefrencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  Future<void> setIntValue(CacheKeyEnum key, int value) async {
    await _preferences!.setInt(key.name, value);
  }

  int getIntValue(CacheKeyEnum key) => _preferences!.getInt(key.name) ?? 0;
}
