import 'package:abgdev_flutter/feature/comment/model/comment_request_model.dart';
import 'package:abgdev_flutter/feature/comment/model/comment_response_without_data_model.dart';
import 'package:abgdev_flutter/feature/comment/model/list_comment_response_model.dart';
import 'package:abgdev_flutter/feature/comment/model/single_comment_response_model.dart';
import 'package:abgdev_flutter/feature/comment/service/abstract/comment_service.dart';
import 'package:vexana/vexana.dart';

class CommentManager extends CommentService {
  CommentManager(super.networkManager);

  @override
  Future<bool> deleteCommentById(int commentId) async {
    final response = await networkManager.send<CommentResponseWithoutDataModel, CommentResponseWithoutDataModel>(
      _CommentPath.deleteCommentById.path,
      queryParameters: {'id': commentId},
      parseModel: CommentResponseWithoutDataModel(),
      method: RequestType.DELETE,
    );
    return response.data?.success ?? false;
  }

  @override
  Future<ListCommentResponseModel?> getAllCommentByTweetId(int tweetId) async {
    final response = await networkManager.send<ListCommentResponseModel, ListCommentResponseModel>(
      _CommentPath.getAllCommentByTweetId.path,
      queryParameters: {'tweetId': tweetId},
      parseModel: ListCommentResponseModel(),
      method: RequestType.GET,
    );
    return response.data;
  }

  @override
  Future<SingleCommentResponseModel?> addComment(CommentRequestModel model) async {
    final response = await networkManager.send<SingleCommentResponseModel, SingleCommentResponseModel>(
      _CommentPath.addComment.path,
      data: model.toJson(),
      parseModel: SingleCommentResponseModel(),
      method: RequestType.POST,
    );
    return response.data;
  }
}

enum _CommentPath {
  deleteCommentById('comments/deleteById'),
  getAllCommentByTweetId('comments/getAllByTweetId'),
  addComment('comments/add');

  final String path;
  const _CommentPath(this.path);
}
