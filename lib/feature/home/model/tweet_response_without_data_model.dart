import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tweet_response_without_data_model.g.dart';

@JsonSerializable()
class TweetResponseWithoutData extends INetworkModel<TweetResponseWithoutData> {
  final bool? success;
  final String? message;

  TweetResponseWithoutData({
    this.success,
    this.message,
  });

  @override
  TweetResponseWithoutData fromJson(Map<String, dynamic> json) => TweetResponseWithoutData.fromJson(json);

  factory TweetResponseWithoutData.fromJson(Map<String, dynamic> json) => _$TweetResponseWithoutDataFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TweetResponseWithoutDataToJson(this);
}
