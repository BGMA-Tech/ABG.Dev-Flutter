import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> with EquatableMixin {
  final int? id;
  final String? email;
  final String? password;
  final String? userName;
  final List<TweetModel>? tweetList;
  final List<CommentModel>? commentList;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.userName,
    this.tweetList,
    this.commentList,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, email, password, userName, tweetList, commentList];
}
