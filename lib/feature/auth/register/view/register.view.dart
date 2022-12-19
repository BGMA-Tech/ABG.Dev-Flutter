import 'package:abgdev_flutter/core/init/network/base_network.dart';
import 'package:abgdev_flutter/feature/auth/cubit/auth_cubit.dart';
import 'package:abgdev_flutter/feature/auth/service/concrete/auth_manager.dart';
import 'package:abgdev_flutter/product/enums/auth_textfield_type_enum.dart';
import 'package:abgdev_flutter/product/init/language/locale_keys.g.dart';
import 'package:abgdev_flutter/product/widgets/circleavatar/logo_circle_avatar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/mixin/navigation_mixin.dart';
import '../../../../product/widgets/textfield/auth_textfield.dart';
import '../../model/auth_request_model.dart';
import '../../cubit/auth_state.dart';

class RegisterView extends StatelessWidget with NavigationMixin {
  RegisterView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

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
              AuthTextField(
                textFieldType: AuthTextFieldType.username,
                controller: userNameController,
              ),
              context.emptySizedHeightBoxNormal,
              _registerButton(),
              context.emptySizedHeightBoxLow,
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _registerButton() {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? ''),
            ),
          );
        }
      },
      builder: (context, state) {
        return state.isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: () async {
                  await context.read<AuthCubit>().register(
                        AuthRequestModel(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                          userName: userNameController.text.trim(),
                        ),
                      );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: state.hasError ? Colors.red : context.colorScheme.onSurface,
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
        LocaleKeys.register_registerButton.tr(),
        style: context.textTheme.headline5?.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}
