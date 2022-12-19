// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthRequestModel _$RegisterRequestModelFromJson(Map<String, dynamic> json) => AuthRequestModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(AuthRequestModel instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
    };
