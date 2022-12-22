import 'package:abgdev_flutter/core/init/navigation/abstract/navigation_service.dart';
import 'package:abgdev_flutter/core/init/navigation/concrete/navigation_manager.dart';

mixin NavigationMixin {
  final INavigationService _navigationService = NavigationManager.instance;

  Future<void> navigateToPage(String path, {Object? data}) async {
    await _navigationService.navigateToPage(path, data: data);
  }

  Future<void> navigateToPageClear(String path, {Object? data}) async {
    await _navigationService.navigateToPageClear(path, data: data);
  }

  void goBack() {
    _navigationService.goBack();
  }

  bool canGoBack() {
    return _navigationService.canGoBack();
  }
}
