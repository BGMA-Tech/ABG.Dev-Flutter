import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../product/model/user_model.dart';
part 'tweet_request_model.g.dart';

@JsonSerializable()
class TweetRequestModel extends INetworkModel<TweetRequestModel> {
  final String? tweet;
  final UserModel? user;

  TweetRequestModel({
    this.tweet,
    this.user,
  });

  @override
  TweetRequestModel fromJson(Map<String, dynamic> json) => TweetRequestModel.fromJson(json);

  factory TweetRequestModel.fromJson(Map<String, dynamic> json) => _$TweetRequestModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TweetRequestModelToJson(this);

  TweetRequestModel copyWith({
    String? tweet,
    UserModel? userModel,
  }) {
    return TweetRequestModel(
      tweet: tweet ?? this.tweet,
      user: userModel ?? user,
    );
  }
}
