import 'package:abgdev_flutter/core/constants/navigation_constants.dart';
import 'package:abgdev_flutter/core/init/network/base_network.dart';
import 'package:abgdev_flutter/core/mixin/navigation_mixin.dart';
import 'package:abgdev_flutter/feature/home/cubit/home_cubit.dart';
import 'package:abgdev_flutter/feature/home/service/concrete/tweet_manager.dart';
import 'package:abgdev_flutter/feature/profile/service/concrete/user_manager.dart';
import 'package:abgdev_flutter/product/init/language/locale_keys.g.dart';
import 'package:abgdev_flutter/product/init/singleton/user_singleton.dart';
import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../../product/widgets/appbar/custom_appbar.dart';
import '../cubit/home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.tweets_title.tr()),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocProvider(
          create: (context) => HomeCubit(
            TweetManager(BaseNetwork().networkManager),
            UserManager(BaseNetwork().networkManager),
          )..getAllTweet(),
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
                  : Column(
                      children: [
                        ListTile(
                          leading: UserLogo(
                            title: UserSingleton.instance.userModel?.userName?[0].toUpperCase() ?? '',
                            color: context.colorScheme.primary.withOpacity(0.5),
                          ),
                          title: _tweetTextField(context),
                          trailing: _addTweetIconButton(context),
                        ),
                        context.emptySizedHeightBoxNormal,
                        Expanded(
                          child: RefreshIndicator(
                            onRefresh: () => context.read<HomeCubit>().getAllTweet(),
                            child: ListView.builder(
                              itemCount: state.tweetList?.length,
                              itemBuilder: (context, index) => _TweetListTile(
                                tweetModel: state.tweetList?[index],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
            },
          ),
        ),
      ),
    );
  }

  IconButton _addTweetIconButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.send,
        color: context.colorScheme.onSurface.withOpacity(0.5),
      ),
      onPressed: () async {
        await context.read<HomeCubit>().addTweet();
      },
    );
  }

  TextField _tweetTextField(BuildContext context) {
    return TextField(
      controller: context.read<HomeCubit>().tweetController,
      cursorColor: context.colorScheme.onSurface,
      decoration: InputDecoration(
        hintText: LocaleKeys.tweets_writeTweet.tr(),
        border: InputBorder.none,
      ),
    );
  }
}

class _TweetListTile extends StatelessWidget with NavigationMixin {
  _TweetListTile({required this.tweetModel});

  final TweetModel? tweetModel;
  final AppSizes _appSizes = AppSizes();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: UserLogo(
        title: tweetModel?.user?.userName?[0].toUpperCase() ?? 'U',
        color: context.colorScheme.onSurface,
      ),
      title: Text(
        '${tweetModel?.tweet}',
      ),
      subtitle: Text(
        '@${tweetModel?.user?.userName}',
      ),
      trailing: SizedBox(
        width: context.width / 3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: UserSingleton.instance.userModel?.id == tweetModel?.user?.id,
              child: IconButton(
                icon: Icon(
                  Icons.delete,
                  color: context.colorScheme.error,
                ),
                onPressed: () async {
                  await context.read<HomeCubit>().deleteTweet(tweetModel?.id ?? 0);
                },
              ),
            ),
            context.emptySizedWidthBoxLow,
            IconButton(
              icon: Icon(
                Icons.comment,
                color: context.colorScheme.onSurface,
                size: _appSizes._commentIconSize,
              ),
              onPressed: () async {
                await navigateToPage(NavigationConstants.comment, data: tweetModel);
              },
            ),
            context.emptySizedWidthBoxLow,
            context.emptySizedWidthBoxLow,
            SizedBox(
              width: 25,
              child: Text(
                '${tweetModel?.commentList?.length ?? 0}',
                style: context.textTheme.headline6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserLogo extends StatelessWidget {
  const UserLogo({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      child: Text(
        title,
        style: context.textTheme.headline5?.copyWith(
          color: context.colorScheme.onBackground,
        ),
      ),
    );
  }
}

class AppSizes {
  final double _commentIconSize = 25;
}
