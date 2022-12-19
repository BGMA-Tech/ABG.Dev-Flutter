// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      id: json['id'] as int?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] as String?,
      likeCount: json['likeCount'] as int?,
      userId: json['userId'] as int?,
      tweetId: json['tweetId'] as int?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'createdAt': instance.createdAt,
      'likeCount': instance.likeCount,
      'userId': instance.userId,
      'tweetId': instance.tweetId,
    };
