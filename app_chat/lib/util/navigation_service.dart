import 'package:flutter/cupertino.dart';

class NavigationSerivce {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> to(
      {required String routeName, bool isBack = true, arguments}) {
    // return navigatorKey.currentState!.pushNamed(routeName);
    return !isBack
        ? navigatorKey.currentState!
            .pushReplacementNamed(routeName, arguments: arguments)
        : navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  void back() {
    return navigatorKey.currentState!.pop();
  }

  Future<dynamic> clearAllTo({required String routeName}) {
    return navigatorKey.currentState!
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
