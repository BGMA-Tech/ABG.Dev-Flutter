import 'package:abgdev_flutter/product/model/comment_model.dart';
import 'package:equatable/equatable.dart';

class CommentState extends Equatable {
  final String? error;
  final bool hasError;
  final List<CommentModel>? commentList;
  final bool isLoading;

  const CommentState({
    this.error,
    this.hasError = false,
    this.commentList,
    this.isLoading = false,
  });

  CommentState copyWith({
    String? error,
    bool? hasError,
    List<CommentModel>? commentList,
    bool? isLoading,
  }) {
    return CommentState(
      error: error ?? this.error,
      hasError: hasError ?? this.hasError,
      commentList: commentList ?? this.commentList,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [error, hasError, commentList, isLoading];
}
