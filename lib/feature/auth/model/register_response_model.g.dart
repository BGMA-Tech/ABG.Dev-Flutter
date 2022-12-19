// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseModel _$RegisterResponseModelFromJson(Map<String, dynamic> json) => AuthResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null ? null : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RegisterResponseModelToJson(AuthResponseModel instance) => <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
