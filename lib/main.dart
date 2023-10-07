import 'package:case_study/core/utils/custom_router.dart';
import 'package:case_study/product/constat/page_routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: PageRoutesConstant.routes,
      navigatorKey: CustomRouter.navigatorKey,
      theme: ThemeData.dark(useMaterial3: true),
    );
  }
}
