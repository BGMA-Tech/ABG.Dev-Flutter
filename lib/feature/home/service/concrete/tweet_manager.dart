import 'package:abgdev_flutter/feature/home/model/tweet_request_model.dart';
import 'package:abgdev_flutter/feature/home/model/tweet_response_model.dart';
import 'package:abgdev_flutter/feature/home/model/tweet_response_without_data_model.dart';
import 'package:abgdev_flutter/feature/home/service/abstract/tweet_service.dart';
import 'package:vexana/vexana.dart';

import '../../model/single_tweet_response_model.dart';

class TweetManager extends TweetService {
  TweetManager(super.networkManager);

  @override
  Future<SingleTweetResponseModel?> addTweet(TweetRequestModel model) async {
    final response = await networkManager.send<SingleTweetResponseModel, SingleTweetResponseModel>(
      _TweetPath.add.path,
      data: model.toJson(),
      parseModel: SingleTweetResponseModel(),
      method: RequestType.POST,
    );
    return response.data;
  }

  @override
  Future<bool> deleteTweetById(int tweetId) async {
    final response = await networkManager.send<TweetResponseWithoutData, TweetResponseWithoutData>(
      _TweetPath.deleteById.path,
      queryParameters: {'id': tweetId},
      parseModel: TweetResponseWithoutData(),
      method: RequestType.DELETE,
    );
    return response.data?.success ?? false;
  }

  @override
  Future<TweetResponseModel?> getAllTweet() async {
    final response = await networkManager.send<TweetResponseModel, TweetResponseModel>(
      _TweetPath.getAll.path,
      parseModel: TweetResponseModel(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<TweetResponseModel?> getAllTweetByUserId(int userId) async {
    final response = await networkManager.send<TweetResponseModel, TweetResponseModel>(
      _TweetPath.getAllByUserId.path,
      queryParameters: {'userId': userId},
      parseModel: TweetResponseModel(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<SingleTweetResponseModel?> getTweetById(int tweetId) async {
    final response = await networkManager.send<SingleTweetResponseModel, SingleTweetResponseModel>(
      _TweetPath.getById.path,
      queryParameters: {'id': tweetId},
      parseModel: SingleTweetResponseModel(),
      method: RequestType.GET,
    );

    return response.data;
  }
}

enum _TweetPath {
  getAll('tweets/getAll'),
  getAllByUserId('tweets/getAllByUserId'),
  getById('tweets/getById'),
  deleteById('tweets/deleteById'),
  add('tweets/add');

  final String path;
  const _TweetPath(this.path);
}
