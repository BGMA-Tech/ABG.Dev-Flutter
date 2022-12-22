import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_comment_response_model.g.dart';

@JsonSerializable()
class SingleCommentResponseModel extends INetworkModel<SingleCommentResponseModel> {
  final bool? success;
  final String? message;
  final CommentModel? data;

  SingleCommentResponseModel({
    this.success,
    this.message,
    this.data,
  });

  @override
  SingleCommentResponseModel fromJson(Map<String, dynamic> json) => SingleCommentResponseModel.fromJson(json);

  factory SingleCommentResponseModel.fromJson(Map<String, dynamic> json) => _$SingleCommentResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$SingleCommentResponseModelToJson(this);
}
