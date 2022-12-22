import 'package:abgdev_flutter/core/init/network/base_network.dart';
import 'package:abgdev_flutter/feature/comment/model/comment_request_model.dart';
import 'package:abgdev_flutter/feature/comment/service/concrete/comment_manager.dart';
import 'package:abgdev_flutter/product/init/language/locale_keys.g.dart';
import 'package:abgdev_flutter/product/init/singleton/user_singleton.dart';
import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:abgdev_flutter/product/model/user_model.dart';
import 'package:abgdev_flutter/product/widgets/appbar/custom_appbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../cubit/comment_cubit.dart';
import '../cubit/comment_state.dart';

class CommentView extends StatelessWidget {
  CommentView({super.key, required this.tweetModel});
  final TweetModel? tweetModel;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.comments_title.tr()),
      body: SafeArea(
        child: BlocProvider<CommentCubit>(
          create: (context) =>
              CommentCubit(CommentManager(BaseNetwork().networkManager))..getAllByTweetId(tweetModel?.id ?? 0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(LocaleKeys.comments_tweetTitle.tr(), style: context.textTheme.headline4),
                context.emptySizedHeightBoxLow,
                Card(
                  elevation: 10,
                  child: ListTile(
                    title: Text(
                      tweetModel?.tweet ?? '',
                      style: context.textTheme.headline6,
                    ),
                    subtitle: Text(
                      '@${tweetModel?.user?.userName ?? ''}',
                      style: context.textTheme.subtitle1?.copyWith(
                        color: context.colorScheme.onSurface.withOpacity(0.5),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                context.emptySizedHeightBoxLow,
                const Divider(
                  thickness: 4,
                  height: 50,
                ),
                Text(LocaleKeys.comments_title.tr(), style: context.textTheme.headline4),
                context.emptySizedHeightBoxLow,
                BlocBuilder<CommentCubit, CommentState>(
                  builder: (context, state) {
                    return state.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : state.commentList?.isEmpty ?? true
                            ? _noCommentTextCenter(context)
                            : _commentListExpanded(state.commentList ?? []);
                  },
                ),
                const Divider(
                  thickness: 4,
                  height: 50,
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: context.colorScheme.onSurface.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: context.paddingLow,
                            child: const Icon(Icons.comment),
                          ),
                          Expanded(
                            child: _commentTextField(),
                          ),
                          _commentSendButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextField _commentTextField() {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: LocaleKeys.comments_writeComment.tr(),
        border: InputBorder.none,
      ),
    );
  }

  Widget _commentSendButton() {
    return BlocConsumer<CommentCubit, CommentState>(
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
        return IconButton(
          icon: const Icon(Icons.send),
          onPressed: () async {
            await context.read<CommentCubit>().addComment(
                  CommentRequestModel(
                    comment: _controller.text.trim(),
                    user: UserModel(id: UserSingleton.instance.userModel?.id),
                    tweetId: tweetModel?.id,
                  ),
                );

            _controller.text = '';
          },
        );
      },
    );
  }

  Widget _noCommentTextCenter(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          LocaleKeys.comments_noCommentText.tr(),
          style: context.textTheme.headline5,
        ),
      ),
    );
  }

  Expanded _commentListExpanded(List<CommentModel> commentList) {
    return Expanded(
      child: ListView.builder(
        itemCount: commentList.length,
        itemBuilder: (BuildContext context, int index) {
          final CommentModel comment = commentList[index];
          return _CommentCard(comment: comment, tweetModel: tweetModel ?? TweetModel());
        },
      ),
    );
  }
}

class _CommentCard extends StatelessWidget {
  const _CommentCard({
    Key? key,
    required this.comment,
    required this.tweetModel,
  }) : super(key: key);

  final CommentModel comment;
  final TweetModel tweetModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, CommentState>(
      builder: (context, state) {
        return Stack(
          alignment: AlignmentDirectional.centerEnd,
          children: [
            Text(
              'DELETE',
              style: context.textTheme.headline5?.copyWith(
                color: context.colorScheme.error,
                fontWeight: FontWeight.w500,
              ),
            ),
            Dismissible(
              key: UniqueKey(),
              direction: comment.user?.id != UserSingleton.instance.userModel?.id
                  ? DismissDirection.none
                  : DismissDirection.endToStart,
              onDismissed: (direction) async {
                final CommentCubit commentCubit = context.read<CommentCubit>();
                await commentCubit.deleteCommentById(comment.id ?? 0);
                await commentCubit.getAllByTweetId(tweetModel.id ?? 0);
              },
              child: Card(
                margin: const EdgeInsets.only(bottom: 10),
                color: context.colorScheme.onBackground,
                child: ListTile(
                  title: Text(
                    comment.comment ?? '',
                    style: context.textTheme.headline6,
                  ),
                  subtitle: Text(
                    '@${comment.user?.userName ?? ''}',
                    style: context.textTheme.subtitle1?.copyWith(
                      color: comment.user?.id != UserSingleton.instance.userModel?.id
                          ? context.colorScheme.onSurface.withOpacity(0.5)
                          : context.colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
