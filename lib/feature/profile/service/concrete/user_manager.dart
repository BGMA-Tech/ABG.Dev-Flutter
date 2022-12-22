import 'package:abgdev_flutter/feature/profile/model/user_response_model.dart';
import 'package:abgdev_flutter/feature/profile/service/abstract/user_service.dart';
import 'package:vexana/vexana.dart';

class UserManager extends UserService {
  UserManager(super.networkManager);

  @override
  Future<UserResponseModel?> getUserById(int userId) async {
    final response = await networkManager.send<UserResponseModel, UserResponseModel>(
      _UserPath.getById.path,
      queryParameters: {'id': userId},
      parseModel: UserResponseModel(),
      method: RequestType.GET,
    );
    return response.data;
  }
}

enum _UserPath {
  getById('users/getbyid');

  final String path;
  const _UserPath(this.path);
}
