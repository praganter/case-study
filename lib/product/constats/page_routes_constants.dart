import 'package:flutter/material.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/program/program_screen.dart';

class PageRoutesConstant {
  final BuildContext context;
  PageRoutesConstant({required this.context});
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const HomeScreen(),
    '/program': (context) => const ProgramScreen(),
  };

  static String get homeScreenPath => '/';
  static String get programPath => '/program';
}
