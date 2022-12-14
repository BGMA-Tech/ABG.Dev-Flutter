import 'package:abgdev_flutter/core/mixin/navigation_mixin.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/navigation_constants.dart';
import '../../../../product/enums/auth_textfield_type_enum.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widgets/circleavatar/logo_circle_avatar.dart';
import '../../../../product/widgets/textfield/auth_textfield.dart';

class LoginView extends StatelessWidget with NavigationMixin {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: context.paddingNormal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const LogoCircleAvatar(),
            context.emptySizedHeightBoxHigh,
            AuthTextField(
              textFieldType: AuthTextFieldType.email,
              onChange: (String value) {},
            ),
            context.emptySizedHeightBoxNormal,
            AuthTextField(
              textFieldType: AuthTextFieldType.password,
              onChange: (String value) {},
            ),
            context.emptySizedHeightBoxNormal,
            _loginButton(context),
            context.emptySizedHeightBoxLow,
            const Spacer(),
          ],
        ),
      ),
    );
  }

  ElevatedButton _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await navigateToPageClear(NavigationConstants.login);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colorScheme.onSurface,
      ),
      child: _buttonTextPadding(context),
    );
  }

  Padding _buttonTextPadding(BuildContext context) {
    return Padding(
      padding: context.paddingLow,
      child: Text(
        LocaleKeys.login_loginButton.tr(),
        style: context.textTheme.headline5?.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}
