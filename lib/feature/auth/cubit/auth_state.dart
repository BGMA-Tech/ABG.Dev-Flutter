import 'package:equatable/equatable.dart';

import '../model/auth_response_model.dart';

class AuthState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final AuthResponseModel? data;
  final String? error;

  const AuthState({this.isLoading = false, this.hasError = false, this.data, this.error});

  @override
  List<Object?> get props => [isLoading, hasError, data, error];

  AuthState copyWith({bool? isLoading, bool? hasError, AuthResponseModel? data, String? error}) {
    return AuthState(
        isLoading: isLoading ?? this.isLoading,
        hasError: hasError ?? this.hasError,
        data: data ?? this.data,
        error: error ?? this.error);
  }
}
