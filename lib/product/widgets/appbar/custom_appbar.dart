import 'package:abgdev_flutter/core/constants/navigation_constants.dart';
import 'package:abgdev_flutter/core/init/cache/concrete/cache_manager.dart';
import 'package:abgdev_flutter/core/mixin/navigation_mixin.dart';
import 'package:abgdev_flutter/product/init/singleton/user_singleton.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget, NavigationMixin {
  CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: context.colorScheme.onSurface),
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: context.textTheme.headline4?.copyWith(color: context.colorScheme.onSurface),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: IconButton(
            onPressed: () async {
              await CacheManager.instance.clearAll();
              UserSingleton.instance.userModel = null;
              await navigateToPageClear(NavigationConstants.login);
            },
            icon: Icon(
              Icons.logout,
              color: context.colorScheme.onSurface,
              size: 30,
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
