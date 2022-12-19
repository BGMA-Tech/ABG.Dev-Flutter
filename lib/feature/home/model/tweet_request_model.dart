import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tweet_request_model.g.dart';

@JsonSerializable()
class TweetRequestModel extends INetworkModel<TweetRequestModel> {
  final String? tweet;
  final int? userId;

  TweetRequestModel({
    this.tweet,
    this.userId,
  });

  @override
  TweetRequestModel fromJson(Map<String, dynamic> json) => TweetRequestModel.fromJson(json);

  factory TweetRequestModel.fromJson(Map<String, dynamic> json) => _$TweetRequestModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TweetRequestModelToJson(this);

  TweetRequestModel copyWith({
    String? tweet,
    int? userId,
  }) {
    return TweetRequestModel(
      tweet: tweet ?? this.tweet,
      userId: userId ?? this.userId,
    );
  }
}
