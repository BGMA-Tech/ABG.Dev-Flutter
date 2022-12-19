import 'package:equatable/equatable.dart';

import 'package:abgdev_flutter/product/model/tweet_model.dart';

class HomeState extends Equatable {
  final String? error;
  final bool hasError;
  final List<TweetModel>? tweetList;
  final bool isLoading;

  const HomeState({
    this.error,
    this.hasError = false,
    this.tweetList,
    this.isLoading = false,
  });

  HomeState copyWith({
    String? error,
    bool? hasError,
    List<TweetModel>? tweetList,
    bool? isLoading,
  }) {
    return HomeState(
      error: error ?? this.error,
      hasError: hasError ?? this.hasError,
      tweetList: tweetList ?? this.tweetList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [error, hasError, tweetList, isLoading];
}
