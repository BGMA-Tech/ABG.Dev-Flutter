import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment_response_without_data_model.g.dart';

@JsonSerializable()
class CommentResponseWithoutDataModel extends INetworkModel<CommentResponseWithoutDataModel> {
  final bool? success;
  final String? message;

  CommentResponseWithoutDataModel({
    this.success,
    this.message,
  });

  @override
  CommentResponseWithoutDataModel fromJson(Map<String, dynamic> json) => CommentResponseWithoutDataModel.fromJson(json);

  factory CommentResponseWithoutDataModel.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseWithoutDataModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$CommentResponseWithoutDataModelToJson(this);
}
