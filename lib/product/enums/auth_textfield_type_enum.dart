import 'package:abgdev_flutter/product/init/language/locale_keys.g.dart';

enum AuthTextFieldType {
  email(LocaleKeys.register_email),
  password(LocaleKeys.register_password),
  username(LocaleKeys.register_username);

  final String value;
  const AuthTextFieldType(this.value);
}
