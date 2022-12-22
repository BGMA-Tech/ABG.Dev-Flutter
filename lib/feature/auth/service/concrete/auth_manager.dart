import 'package:abgdev_flutter/feature/auth/service/abstract/auth_service.dart';
import 'package:vexana/vexana.dart';

import '../../model/auth_request_model.dart';
import '../../model/auth_response_model.dart';

class AuthManager extends RegisterService {
  AuthManager(super.networkManager);

  @override
  Future<AuthResponseModel?> register(AuthRequestModel? registerRequestModel) async {
    final response = await networkManager.send<AuthResponseModel, AuthResponseModel>(
      _RegisterPath.register.path,
      parseModel: AuthResponseModel(),
      method: RequestType.POST,
      data: registerRequestModel,
    );

    return response.data;
  }

  @override
  Future<AuthResponseModel?> login(AuthRequestModel? registerRequestModel) async {
    final response = await networkManager.send<AuthResponseModel, AuthResponseModel>(
      _RegisterPath.login.path,
      parseModel: AuthResponseModel(),
      method: RequestType.POST,
      data: registerRequestModel,
    );

    return response.data;
  }
}

enum _RegisterPath {
  register('users/add'),
  login('users/login');

  final String path;
  const _RegisterPath(this.path);
}
