// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_response_without_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetResponseWithoutData _$TweetResponseWithoutDataFromJson(
        Map<String, dynamic> json) =>
    TweetResponseWithoutData(
      success: json['success'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$TweetResponseWithoutDataToJson(
        TweetResponseWithoutData instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
    };
