// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleCommentResponseModel _$SingleCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    SingleCommentResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CommentModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleCommentResponseModelToJson(
        SingleCommentResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
