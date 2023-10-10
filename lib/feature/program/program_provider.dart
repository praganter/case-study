import 'package:case_study/feature/program/program_state.dart';
import 'package:case_study/product/model/exercise_model.dart';
import 'package:case_study/product/service/hive_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final programProvider = StateNotifierProvider<ProgramProvider, ProgramState>((ref) {
  return ProgramProvider();
});

class ProgramProvider extends StateNotifier<ProgramState> {
  ProgramProvider() : super(const ProgramState());

  fetchProgramList(String boxName) async {
    state = state.copyWith(isLoading: true);
    var programList = await HiveService.getListByBoxName<String>(boxName);
    state = state.copyWith(programList: programList, isLoading: false);
  }

  fetchExerciseMapList(String boxName) async {
    state = state.copyWith(isLoading: true);
    List<Map<String, List<ExerciseModel>>> exerciseMapList = HiveService.getExerciseList(boxName);
    state = state.copyWith(exerciseMapList: exerciseMapList.cast<Map<String, List<ExerciseModel>>>(), isLoading: false);
  }

  addProgram(String boxName, String item) async {
    if (state.programList.contains(item)) {
      return;
    }
    await HiveService.addNewProgram(boxName, item);
    await fetchProgramList(boxName);
  }

  addExerciseToProgram(String programName, ExerciseModel item) async {
    await HiveService.addExerciseToProgram(programName, item);
  }

  setTitle(int index) {
    String title = state.programList[index];
    List<ExerciseModel> selectedList = _setExerciseList(title);
    state = state.copyWith(title: title, selectedExerciseList: selectedList);
  }

  _setExerciseList(String name) {
    List<ExerciseModel> selectedList = [];
    var exerciseList = state.exerciseMapList;
    for (var element in exerciseList) {
      if (element.containsKey(name)) {
        selectedList = element[name] ?? [];
        break;
      }
    }
    return selectedList;
  }
}
