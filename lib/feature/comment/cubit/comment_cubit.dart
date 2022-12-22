import 'package:abgdev_flutter/feature/comment/cubit/comment_state.dart';
import 'package:abgdev_flutter/feature/comment/model/comment_request_model.dart';
import 'package:abgdev_flutter/feature/comment/service/abstract/comment_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/list_comment_response_model.dart';
import '../model/single_comment_response_model.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit(this.commentService) : super(const CommentState());
  final CommentService commentService;

  Future<void> getAllByTweetId(int tweetId) async {
    emit(state.copyWith(isLoading: true));

    final ListCommentResponseModel? commentResponse = await commentService.getAllCommentByTweetId(tweetId);
    if (commentResponse == null) {
      emit(state.copyWith(hasError: true, error: 'Server error', isLoading: false));
    } else if (!(commentResponse.success ?? false)) {
      emit(state.copyWith(hasError: true, error: commentResponse.message, isLoading: false));
    } else {
      emit(state.copyWith(
          hasError: false, error: '', commentList: commentResponse.data?.reversed.toList(), isLoading: false));
    }
  }

  Future<void> deleteCommentById(int id) async {
    emit(state.copyWith(isLoading: true));

    final bool commentResponse = await commentService.deleteCommentById(id);
    if (!commentResponse) {
      emit(state.copyWith(hasError: true, error: 'Comment can\'t delete', isLoading: false));
    } else {
      emit(state.copyWith(hasError: false, error: '', isLoading: false));
    }
  }

  Future<void> addComment(CommentRequestModel requestModel) async {
    emit(state.copyWith(isLoading: true));

    final SingleCommentResponseModel? commentResponse = await commentService.addComment(requestModel);
    if (commentResponse == null) {
      emit(state.copyWith(hasError: true, error: 'Server error', isLoading: false));
    } else if (!(commentResponse.success ?? false)) {
      emit(state.copyWith(hasError: true, error: commentResponse.message, isLoading: false));
    } else {
      emit(state.copyWith(hasError: false, error: '', isLoading: false));
    }

    await getAllByTweetId(requestModel.tweetId ?? 0);
  }
}
