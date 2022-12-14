import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../init/language/locale_keys.g.dart';

class LogoCircleAvatar extends StatelessWidget {
  const LogoCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: context.height / 13,
      backgroundColor: context.colorScheme.onSurface,
      child: Text(
        LocaleKeys.app_logoTitle.tr(),
        style: context.textTheme.headline4?.copyWith(
          color: context.colorScheme.onBackground,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
