// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shared_preferences/shared_preferences.dart';

import 'package:abgdev_flutter/core/init/cache/abstract/cache_service.dart';

class CacheManager extends CacheService {
  late final SharedPreferences _preferences;
  CacheManager() {
    loadPref();
  }

  @override
  Future<void> loadPref() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  int? getInt(CacheKeyEnum key) {
    return _preferences.getInt(key.name) ?? 0;
  }

  @override
  void setInt(CacheKeyEnum key, int data) {
    _preferences.setInt(key.name, data);
  }
}
