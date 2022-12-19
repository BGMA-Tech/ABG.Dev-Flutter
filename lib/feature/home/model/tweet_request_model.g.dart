// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetRequestModel _$TweetRequestModelFromJson(Map<String, dynamic> json) =>
    TweetRequestModel(
      tweet: json['tweet'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$TweetRequestModelToJson(TweetRequestModel instance) =>
    <String, dynamic>{
      'tweet': instance.tweet,
      'userId': instance.userId,
    };
