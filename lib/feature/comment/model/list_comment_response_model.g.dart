// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_comment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListCommentResponseModel _$ListCommentResponseModelFromJson(
        Map<String, dynamic> json) =>
    ListCommentResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListCommentResponseModelToJson(
        ListCommentResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
