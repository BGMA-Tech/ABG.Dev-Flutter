import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel extends INetworkModel<UserResponseModel> {
  final bool? success;
  final String? message;
  final UserModel? data;

  UserResponseModel({this.success, this.message, this.data});

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);
  @override
  UserResponseModel fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserResponseModelToJson(this);
}
