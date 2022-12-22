import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_comment_response_model.g.dart';

@JsonSerializable()
class ListCommentResponseModel extends INetworkModel<ListCommentResponseModel> {
  final bool? success;
  final String? message;
  final List<CommentModel>? data;

  ListCommentResponseModel({
    this.success,
    this.message,
    this.data,
  });

  @override
  ListCommentResponseModel fromJson(Map<String, dynamic> json) => ListCommentResponseModel.fromJson(json);

  factory ListCommentResponseModel.fromJson(Map<String, dynamic> json) => _$ListCommentResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$ListCommentResponseModelToJson(this);
}
