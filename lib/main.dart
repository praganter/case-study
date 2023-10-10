import 'package:case_study/core/utils/custom_router.dart';
import 'package:case_study/product/constat/page_routes_constants.dart';
import 'package:case_study/product/model/exercise_model.dart';
import 'package:case_study/product/service/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseAdapter());
  await HiveService.openBoxes();
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
