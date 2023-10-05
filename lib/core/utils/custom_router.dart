import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomRouter {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static pushNamed(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamed(route, arguments: arguments);
  }

  static pushNamedRemoveUntil(String route, {dynamic arguments}) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(route, (_) => false);
  }

  static pop() {
    return navigatorKey.currentState?.pop();
  }
}
