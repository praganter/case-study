import 'package:case_study/feature/home/home_state.dart';
import 'package:case_study/product/model/exercise_model.dart';
import 'package:case_study/product/service/exercise_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeProvider = StateNotifierProvider<HomeProvider, HomeState>((ref) {
  return HomeProvider();
});

class HomeProvider extends StateNotifier<HomeState> {
  HomeProvider() : super(const HomeState());

  fetctExerciseList(String name) async {
    state = state.copyWith(isLoading: true);
    var exerciseList = await ExerciseService.fetchExerciseList(name, state.type);
    if (state.selectedMuscleList.isNotEmpty) {
      _filterList(exerciseList);
    } else {
      state = state.copyWith(exerciseList: exerciseList);
    }
    _suggestionList(exerciseList);
    state = state.copyWith(isLoading: false);
  }

  _filterList(List<ExerciseModel> exerciseList) {
    var filteredList = exerciseList.where((exercise) => state.selectedMuscleList.contains(exercise.muscle)).toList();
    state = state.copyWith(exerciseList: filteredList);
  }

  _suggestionList(List<ExerciseModel> exerciseList) {
    List<String> suggestionList = [];
    for (var item in exerciseList) {
      if (item.muscle != null) {
        suggestionList.add(item.name!);
      }
    }
    state = state.copyWith(suggestionList: suggestionList);
  }

  addSelectedMuscle(String selected) {
    List<String> list = [];
    list.addAll(state.selectedMuscleList);
    list.add(selected);
    state = state.copyWith(selectedMuscleList: list);
  }

  removeSelectedMuscle(String removed) {
    List<String> list = [];
    list.addAll(state.selectedMuscleList);
    list.remove(removed);
    state = state.copyWith(selectedMuscleList: list);
  }

  setType(String type) {
    state = state.copyWith(type: type);
  }

  clearAllFilters() {
    state = state.copyWith(type: "", selectedMuscleList: []);
  }
}
