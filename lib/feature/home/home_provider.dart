import 'package:case_study/feature/home/home_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider.autoDispose<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState());
}
