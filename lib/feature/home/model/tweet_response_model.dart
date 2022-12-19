import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tweet_response_model.g.dart';

@JsonSerializable()
class TweetResponseModel extends INetworkModel<TweetResponseModel> {
  final bool? success;
  final String? message;
  final List<TweetModel>? data;

  TweetResponseModel({
    this.success,
    this.message,
    this.data,
  });

  @override
  TweetResponseModel fromJson(Map<String, dynamic> json) => TweetResponseModel.fromJson(json);

  factory TweetResponseModel.fromJson(Map<String, dynamic> json) => _$TweetResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TweetResponseModelToJson(this);
}
