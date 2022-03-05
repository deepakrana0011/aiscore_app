import 'package:ai_score/views/category_screen.dart';
import 'package:ai_score/views/login_screen.dart';
import 'package:ai_score/views/score_analytics.dart';
import 'package:ai_score/views/sign_up_screen.dart';
import 'package:ai_score/views/smile_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/route_constants.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesConstants.logInScreen:
        return MaterialPageRoute(
            builder: (_) => LoginScreen(), settings: settings);
      case RoutesConstants.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => SignUpScreen(), settings: settings);
      case RoutesConstants.categoryScreen:
        return MaterialPageRoute(
            builder: (_) => CategoryScreen(), settings: settings);
      case RoutesConstants.scoreAnalytics:
        return MaterialPageRoute(
            builder: (_) => ScoreAnalytics(), settings: settings);
      case RoutesConstants.smileScreen:
        return MaterialPageRoute(
            builder: (_) => SmileScreen(), settings: settings);

      default:
        //return MaterialPageRoute(builder: (_) =>  Testing());
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
