import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:live_share/modules/live/presentation/live_screen.dart';
import 'package:live_share/utils/app_config.dart';
import 'package:live_share/utils/string_utils.dart';

class RouteServices {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments;



    switch (routeSettings.name) {
      case '/live':
        if (args is Map) {
          return CupertinoPageRoute(builder: (_) {
            return LiveScreenView(
              liveID: args["userID"],
              isHost: false,
              userID: userId,
            );
          });
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            AppString.pageNot,
          ),
        ),
      );
    });
  }
}
