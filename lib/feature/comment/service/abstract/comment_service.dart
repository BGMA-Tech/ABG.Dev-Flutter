import 'package:abgdev_flutter/feature/comment/model/comment_request_model.dart';
import 'package:abgdev_flutter/feature/comment/model/list_comment_response_model.dart';
import 'package:abgdev_flutter/feature/comment/model/single_comment_response_model.dart';
import 'package:vexana/vexana.dart';

abstract class CommentService {
  final INetworkManager networkManager;

  CommentService(this.networkManager);

  Future<ListCommentResponseModel?> getAllCommentByTweetId(int tweetId);
  Future<bool> deleteCommentById(int commentId);
  Future<SingleCommentResponseModel?> addComment(CommentRequestModel model);
}
