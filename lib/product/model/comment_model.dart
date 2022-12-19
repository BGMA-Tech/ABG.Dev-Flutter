import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel extends INetworkModel<CommentModel> with EquatableMixin {
  final int? id;
  final String? comment;
  final String? createdAt;
  final int? likeCount;
  final int? userId;
  final int? tweetId;

  CommentModel({
    this.id,
    this.comment,
    this.createdAt,
    this.likeCount,
    this.userId,
    this.tweetId,
  });

  @override
  CommentModel fromJson(Map<String, dynamic> json) => CommentModel.fromJson(json);

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CommentModelToJson(this);

  @override
  List<Object?> get props => [id, comment, createdAt, likeCount, userId, tweetId];
}
