abstract class CacheService {
  Future<void> loadPref();
  int? getInt(CacheKeyEnum key);
  void setInt(CacheKeyEnum key, int data);
}

enum CacheKeyEnum {
  userId;
}
