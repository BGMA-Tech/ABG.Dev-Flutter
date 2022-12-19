import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'register_request_model.g.dart';

@JsonSerializable()
class AuthRequestModel extends INetworkModel<AuthRequestModel> with EquatableMixin {
  final String? email;
  final String? password;
  final String? userName;

  AuthRequestModel({
    this.email,
    this.password,
    this.userName,
  });

  @override
  AuthRequestModel fromJson(Map<String, dynamic> json) => AuthRequestModel.fromJson(json);

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$RegisterRequestModelToJson(this);

  @override
  List<Object?> get props => [email, password, userName];
}
