import 'package:abgdev_flutter/feature/home/model/tweet_response_model.dart';
import 'package:abgdev_flutter/feature/home/service/abstract/tweet_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.tweetService) : super(const HomeState());
  final TweetService tweetService;

  Future<void> getAllTweet() async {
    emit(state.copyWith(isLoading: true));
    final TweetResponseModel? tweetResponse = await tweetService.getAllTweet();
    if (tweetResponse == null) {
      emit(state.copyWith(hasError: true, error: 'Server error', isLoading: false));
    } else if (!(tweetResponse.success ?? false)) {
      emit(state.copyWith(hasError: true, error: tweetResponse.message, isLoading: false));
    } else {
      emit(state.copyWith(hasError: false, error: '', tweetList: tweetResponse.data, isLoading: false));
    }
  }
}
