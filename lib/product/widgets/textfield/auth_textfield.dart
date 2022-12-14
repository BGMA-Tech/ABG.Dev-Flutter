import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../enums/auth_textfield_type_enum.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({super.key, required this.onChange, required this.textFieldType});

  final void Function(String value) onChange;
  final AuthTextFieldType textFieldType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      cursorColor: context.colorScheme.onSurface,
      obscureText: textFieldType == AuthTextFieldType.password,
      decoration: InputDecoration(
        hintText: textFieldType.value.tr(),
        border: const OutlineInputBorder(),
        enabledBorder: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            width: 2.4,
          ),
        ),
      ),
    );
  }
}
