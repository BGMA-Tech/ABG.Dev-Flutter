import 'package:abgdev_flutter/core/init/cache/abstract/cache_service.dart';
import 'package:abgdev_flutter/core/init/cache/concrete/cache_manager.dart';
import 'package:abgdev_flutter/feature/home/model/single_tweet_response_model.dart';
import 'package:abgdev_flutter/feature/home/model/tweet_request_model.dart';
import 'package:abgdev_flutter/feature/home/model/tweet_response_model.dart';
import 'package:abgdev_flutter/feature/home/service/abstract/tweet_service.dart';
import 'package:abgdev_flutter/feature/profile/model/user_response_model.dart';
import 'package:abgdev_flutter/feature/profile/service/abstract/user_service.dart';
import 'package:abgdev_flutter/product/init/singleton/user_singleton.dart';
import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.tweetService, this.userService) : super(const HomeState());
  final TweetService tweetService;
  final UserService userService;
  final TextEditingController tweetController = TextEditingController();
  final UserSingleton _userSingleton = UserSingleton.instance;

  Future<void> getAllTweet() async {
    emit(state.copyWith(isLoading: true));
    if (UserSingleton.instance.userModel?.id == null) {
      final int userId = CacheManager.instance.getIntValue(CacheKeyEnum.userId);
      final UserResponseModel? userResponseModel = await userService.getUserById(userId);
      _userSingleton.userModel = userResponseModel?.data;
    }

    final TweetResponseModel? tweetResponse = await tweetService.getAllTweet();
    if (tweetResponse == null) {
      emit(state.copyWith(hasError: true, error: 'Server error', isLoading: false));
    } else if (!(tweetResponse.success ?? false)) {
      emit(state.copyWith(hasError: true, error: tweetResponse.message, isLoading: false));
    } else {
      emit(state.copyWith(
          hasError: false, error: '', tweetList: tweetResponse.data?.reversed.toList(), isLoading: false));
    }
  }

  Future<void> addTweet() async {
    emit(state.copyWith(isLoading: true));
    final TweetRequestModel requestModel = TweetRequestModel(
      tweet: tweetController.text.trim(),
      user: UserModel.onlyId(UserSingleton.instance.userModel?.id ?? 0),
    );
    final SingleTweetResponseModel? tweetResponse = await tweetService.addTweet(requestModel);
    if (tweetResponse == null) {
      emit(state.copyWith(hasError: true, error: 'Server error', isLoading: false));
    } else if (!(tweetResponse.success ?? false)) {
      emit(state.copyWith(hasError: true, error: tweetResponse.message, isLoading: false));
    } else {
      emit(state.copyWith(hasError: false, error: '', isLoading: false));
    }
    tweetController.text = '';
    await getAllTweet();
  }

  Future<void> deleteTweet(int id) async {
    emit(state.copyWith(isLoading: true));
    final bool tweetResponse = await tweetService.deleteTweetById(id);
    if (!tweetResponse) {
      emit(state.copyWith(hasError: true, error: 'Tweet can\'t delete', isLoading: false));
    } else {
      emit(state.copyWith(hasError: false, error: '', isLoading: false));
    }
    await getAllTweet();
  }
}
