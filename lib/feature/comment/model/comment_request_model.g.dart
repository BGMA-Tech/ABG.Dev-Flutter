// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentRequestModel _$CommentRequestModelFromJson(Map<String, dynamic> json) =>
    CommentRequestModel(
      comment: json['comment'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      tweetId: json['tweetId'] as int?,
    );

Map<String, dynamic> _$CommentRequestModelToJson(
        CommentRequestModel instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'user': instance.user,
      'tweetId': instance.tweetId,
    };
