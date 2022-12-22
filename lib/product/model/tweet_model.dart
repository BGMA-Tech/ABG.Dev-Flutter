import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'tweet_model.g.dart';

@JsonSerializable()
class TweetModel extends INetworkModel<TweetModel> with EquatableMixin {
  final int? id;
  final String? tweet;
  final String? createdAt;
  final int? likeCount;
  final UserModel? user;
  final List<CommentModel>? commentList;

  TweetModel({
    this.id,
    this.tweet,
    this.createdAt,
    this.likeCount,
    this.user,
    this.commentList,
  });

  @override
  TweetModel fromJson(Map<String, dynamic> json) => TweetModel.fromJson(json);

  factory TweetModel.fromJson(Map<String, dynamic> json) => _$TweetModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$TweetModelToJson(this);

  @override
  List<Object?> get props => [id, tweet, createdAt, likeCount, user, commentList];
}
