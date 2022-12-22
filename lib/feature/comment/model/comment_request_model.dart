import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_request_model.g.dart';

@JsonSerializable()
class CommentRequestModel {
  CommentRequestModel({this.comment, this.user, this.tweetId});

  final String? comment;
  final UserModel? user;
  final int? tweetId;

  factory CommentRequestModel.fromJson(Map<String, dynamic> json) => _$CommentRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$CommentRequestModelToJson(this);
}
