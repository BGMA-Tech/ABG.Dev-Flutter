// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_tweet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleTweetResponseModel _$SingleTweetResponseModelFromJson(
        Map<String, dynamic> json) =>
    SingleTweetResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : TweetModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleTweetResponseModelToJson(
        SingleTweetResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
