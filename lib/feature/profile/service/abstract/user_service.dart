import 'package:vexana/vexana.dart';

import '../../model/user_response_model.dart';

abstract class UserService {
  final INetworkManager networkManager;

  UserService(this.networkManager);

  Future<UserResponseModel?> getUserById(int userId);
}
