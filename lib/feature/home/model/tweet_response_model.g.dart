// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetResponseModel _$TweetResponseModelFromJson(Map<String, dynamic> json) =>
    TweetResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TweetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TweetResponseModelToJson(TweetResponseModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };
