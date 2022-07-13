import 'package:app_chat/util/fade_route.dart';
import 'package:app_chat/util/routes.dart';
import 'package:flutter/material.dart';

import '../domain/pages/login/login_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return FadeRoute(
          page: const LoginScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
