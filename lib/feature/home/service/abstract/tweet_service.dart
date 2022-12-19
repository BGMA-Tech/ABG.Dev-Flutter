import 'package:abgdev_flutter/feature/home/model/tweet_request_model.dart';
import 'package:abgdev_flutter/feature/home/model/tweet_response_model.dart';
import 'package:vexana/vexana.dart';

import '../../model/single_tweet_response_model.dart';

abstract class TweetService {
  final INetworkManager networkManager;

  TweetService(this.networkManager);

  Future<TweetResponseModel?> getAllTweet();
  Future<TweetResponseModel?> getAllTweetByUserId(int userId);
  Future<SingleTweetResponseModel?> getTweetById(int tweetId);
  Future<bool> deleteTweetById(int tweetId);
  Future<SingleTweetResponseModel?> addTweet(TweetRequestModel model);
}
