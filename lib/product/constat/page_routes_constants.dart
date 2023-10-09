import 'package:flutter/material.dart';

import '../../feature/home/home_screen.dart';
import '../../feature/home/searchDetail/search_detail_screen.dart';
import '../../feature/program/program_screen.dart';

class PageRoutesConstant {
  final BuildContext context;
  PageRoutesConstant({required this.context});
  static Map<String, Widget Function(BuildContext)> routes = {
    homeScreenPath: (context) => const HomeScreen(),
    programPath: (context) => const ProgramScreen(),
    searchdetailsPath: (context) => const SearchDetailScreen(),
  };

  static String get homeScreenPath => '/';
  static String get programPath => '/program';
  static String get searchdetailsPath => '/searchDetails';
}
