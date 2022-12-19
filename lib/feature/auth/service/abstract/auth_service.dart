import 'package:vexana/vexana.dart';

import '../../model/auth_request_model.dart';
import '../../model/auth_response_model.dart';

abstract class RegisterService {
  final INetworkManager networkManager;

  RegisterService(this.networkManager);

  Future<AuthResponseModel?> register(AuthRequestModel? registerRequestModel);
  Future<AuthResponseModel?> login(AuthRequestModel? registerRequestModel);
}
