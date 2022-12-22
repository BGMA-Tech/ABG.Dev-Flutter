// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_response_without_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentResponseWithoutDataModel _$CommentResponseWithoutDataModelFromJson(
        Map<String, dynamic> json) =>
    CommentResponseWithoutDataModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommentResponseWithoutDataModelToJson(
        CommentResponseWithoutDataModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
