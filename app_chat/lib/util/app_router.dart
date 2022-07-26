import 'package:app_chat/domain/pages/chat_room/chat_room_screen.dart';
import 'package:app_chat/domain/pages/contact/contact_screen.dart';
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
      case Routes.contactScreen:
        return FadeRoute(
          page: const ContactScreen(),
        );
      case Routes.chatRoomScreen:
        final toId = settings.arguments as String;
        return FadeRoute(
          page: ChatRoomScreen(
            toId: toId,
          ),
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
