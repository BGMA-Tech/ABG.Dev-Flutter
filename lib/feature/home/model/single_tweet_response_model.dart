import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_tweet_response_model.g.dart';

@JsonSerializable()
class SingleTweetResponseModel extends INetworkModel<SingleTweetResponseModel> {
  final bool? success;
  final String? message;
  final TweetModel? data;

  SingleTweetResponseModel({
    this.success,
    this.message,
    this.data,
  });

  @override
  SingleTweetResponseModel fromJson(Map<String, dynamic> json) => SingleTweetResponseModel.fromJson(json);

  factory SingleTweetResponseModel.fromJson(Map<String, dynamic> json) => _$SingleTweetResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SingleTweetResponseModelToJson(this);
}
