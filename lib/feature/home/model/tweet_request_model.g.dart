// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetRequestModel _$TweetRequestModelFromJson(Map<String, dynamic> json) =>
    TweetRequestModel(
      tweet: json['tweet'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TweetRequestModelToJson(TweetRequestModel instance) =>
    <String, dynamic>{
      'tweet': instance.tweet,
      'user': instance.user,
    };
