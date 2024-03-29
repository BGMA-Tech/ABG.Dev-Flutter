// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetModel _$TweetModelFromJson(Map<String, dynamic> json) => TweetModel(
      id: json['id'] as int?,
      tweet: json['tweet'] as String?,
      createdAt: json['createdAt'] as String?,
      likeCount: json['likeCount'] as int?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      commentList: (json['commentList'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TweetModelToJson(TweetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tweet': instance.tweet,
      'createdAt': instance.createdAt,
      'likeCount': instance.likeCount,
      'user': instance.user,
      'commentList': instance.commentList,
    };
