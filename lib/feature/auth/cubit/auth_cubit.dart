import 'dart:developer';

import 'package:abgdev_flutter/core/constants/navigation_constants.dart';
import 'package:abgdev_flutter/core/mixin/navigation_mixin.dart';
import 'package:abgdev_flutter/feature/auth/service/abstract/auth_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/auth_request_model.dart';
import '../model/auth_response_model.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with NavigationMixin {
  AuthCubit(this.registerService) : super(const AuthState());

  final RegisterService registerService;

  Future<void> register(AuthRequestModel data) async {
    emit(state.copyWith(isLoading: true));
    final AuthResponseModel? response = await registerService.register(data);
    if (!(response?.success ?? false)) {
      return emit(state.copyWith(isLoading: false, hasError: true, error: response?.message));
    }
    await navigateToPage(NavigationConstants.login);
    emit(state.copyWith(isLoading: false, data: response));
  }

  Future<void> login(AuthRequestModel data) async {
    emit(state.copyWith(isLoading: true));
    final AuthResponseModel? response = await registerService.login(data);
    inspect(response);
    if (!(response?.success ?? false)) {
      return emit(state.copyWith(isLoading: false, hasError: true, error: response?.message));
    }
    emit(state.copyWith(isLoading: false, data: response));
    await navigateToPage(NavigationConstants.login);
  }
}
