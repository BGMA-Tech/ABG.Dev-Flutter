import 'package:abgdev_flutter/core/init/cache/abstract/cache_service.dart';
import 'package:abgdev_flutter/core/init/cache/mixin/cache_mixin.dart';
import 'package:abgdev_flutter/feature/auth/login/view/login_view.dart';
import 'package:abgdev_flutter/feature/home/view/home_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'core/init/navigation/concrete/navigation_manager.dart';
import 'core/init/navigation/navigation_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget with CacheMixin {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABG.DEV-Flutter',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationManager.instance.navigatorKey,
      home: cacheService.getInt(CacheKeyEnum.userId) != null ? const HomeView() : LoginView(),
    );
  }
}
