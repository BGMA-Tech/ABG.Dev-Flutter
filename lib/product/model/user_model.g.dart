// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      userName: json['userName'] as String?,
      tweetList: (json['tweetList'] as List<dynamic>?)
          ?.map((e) => TweetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentList: (json['commentList'] as List<dynamic>?)
          ?.map((e) => CommentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'userName': instance.userName,
      'tweetList': instance.tweetList,
      'commentList': instance.commentList,
    };
