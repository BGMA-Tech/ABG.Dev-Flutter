import 'package:abgdev_flutter/core/constants/navigation_constants.dart';
import 'package:abgdev_flutter/feature/auth/login/view/login_view.dart';
import 'package:abgdev_flutter/feature/auth/register/view/register.view.dart';
import 'package:abgdev_flutter/feature/comment/view/comment_view.dart';
import 'package:abgdev_flutter/feature/home/view/home_view.dart';
import 'package:abgdev_flutter/product/model/tweet_model.dart';
import 'package:flutter/material.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.register:
        return normalNavigate(RegisterView());
      case NavigationConstants.login:
        return normalNavigate(LoginView());
      case NavigationConstants.home:
        return normalNavigate(const HomeView());
      case NavigationConstants.comment:
        if (args.arguments is TweetModel?) {
          return normalNavigate(CommentView(tweetModel: args.arguments as TweetModel?));
        }
        return normalNavigate(const Scaffold());
      default:
        return normalNavigate(const Scaffold());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
