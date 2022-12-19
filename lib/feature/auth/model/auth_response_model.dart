import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends INetworkModel<AuthResponseModel> with EquatableMixin {
  final bool? success;
  final String? message;
  final UserModel? data;

  AuthResponseModel({
    this.success,
    this.message,
    this.data,
  });

  @override
  AuthResponseModel fromJson(Map<String, dynamic> json) => AuthResponseModel.fromJson(json);

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RegisterResponseModelToJson(this);

  @override
  List<Object?> get props => [success, message, data];
}
