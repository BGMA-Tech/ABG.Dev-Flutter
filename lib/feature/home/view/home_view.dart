import 'package:abgdev_flutter/core/init/network/base_network.dart';
import 'package:abgdev_flutter/feature/home/cubit/home_cubit.dart';
import 'package:abgdev_flutter/feature/home/service/concrete/tweet_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomeCubit(TweetManager(BaseNetwork().networkManager))..getAllTweet(),
        child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            if (state.hasError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error ?? ''),
                ),
              );
            }
          },
          builder: (context, state) {
            return state.isLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: state.tweetList?.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(state.tweetList?[index].tweet ?? ''),
                    ),
                  );
          },
        ),
      ),
    );
  }
}
