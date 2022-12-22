import 'package:abgdev_flutter/product/model/user_model.dart';

class UserSingleton {
  static UserSingleton? _instance;
  static UserSingleton get instance => _instance ??= UserSingleton._init();
  UserSingleton._init();

  UserModel? userModel = UserModel();
}
