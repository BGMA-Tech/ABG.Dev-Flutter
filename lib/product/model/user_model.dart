import 'package:equatable/equatable.dart';
import 'package:vexana/vexana.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends INetworkModel<UserModel> with EquatableMixin {
  final int? id;
  final String? email;
  final String? userName;

  UserModel({
    this.id,
    this.email,
    this.userName,
  });

  @override
  UserModel fromJson(Map<String, dynamic> json) => UserModel.fromJson(json);

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
  factory UserModel.onlyId(int id) => UserModel(id: id);

  @override
  Map<String, dynamic>? toJson() => _$UserModelToJson(this);

  @override
  List<Object?> get props => [id, email, userName];
}
