import 'package:case_study/feature/home/home_state.dart';
import 'package:case_study/product/model/exercise_model.dart';
import 'package:case_study/product/service/exercise_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState());

  fetctExerciseList(String name, {String type = ""}) async {
    state = state.copyWith(isLoading: true);
    var tempList = await ExerciseService.fetchExerciseList(name, type);
    if (state.selectedMuscleList.isNotEmpty) {
      _filteredList(tempList);
    }
    _suggestionList();
    state = state.copyWith(isLoading: false);
  }

  _filteredList(List<ExerciseModel> exerciseList) {
    exerciseList.where((exercise) => state.selectedMuscleList.contains(exercise.muscle)).toList();
    state = state.copyWith(exerciseList: exerciseList);
  }

  _suggestionList() {
    List<String> suggestionList = [];
    for (var item in state.exerciseList) {
      if (item.muscle != null) {
        suggestionList.add(item.muscle!);
      }
    }
    state = state.copyWith(suggestionList: suggestionList);
  }
}
