import 'package:abgdev_flutter/core/init/cache/abstract/cache_service.dart';
import 'package:abgdev_flutter/core/init/cache/concrete/cache_manager.dart';

mixin CacheMixin {
  final CacheService cacheService = CacheManager();
}
