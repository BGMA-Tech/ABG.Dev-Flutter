import 'package:abgdev_flutter/core/init/network/base_network.dart';
import 'package:abgdev_flutter/core/mixin/navigation_mixin.dart';
import 'package:abgdev_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:abgdev_flutter/feature/auth/model/auth_request_model.dart';
import 'package:abgdev_flutter/feature/auth/service/concrete/auth_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/enums/auth_textfield_type_enum.dart';
import '../../../../product/init/language/locale_keys.g.dart';
import '../../../../product/widgets/circleavatar/logo_circle_avatar.dart';
import '../../../../product/widgets/textfield/auth_textfield.dart';
import '../../cubit/auth_state.dart';

class LoginView extends StatelessWidget with NavigationMixin {
  LoginView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(AuthManager(BaseNetwork().networkManager)),
      child: Scaffold(
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
                controller: emailController,
              ),
              context.emptySizedHeightBoxNormal,
              AuthTextField(
                textFieldType: AuthTextFieldType.password,
                controller: passwordController,
              ),
              context.emptySizedHeightBoxNormal,
              _loginButton(context),
              context.emptySizedHeightBoxLow,
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () async {
            await context.read<AuthCubit>().login(
                  AuthRequestModel(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    userName: '_',
                  ),
                );
            // await navigateToPageClear(NavigationConstants.login);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: context.colorScheme.onSurface,
          ),
          child: _buttonTextPadding(context),
        );
      },
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
