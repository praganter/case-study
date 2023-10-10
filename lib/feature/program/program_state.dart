import 'package:case_study/product/model/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_state.freezed.dart';

@freezed
class ProgramState with _$ProgramState {
  const factory ProgramState({
    @Default([{}]) List<Map<String, List<ExerciseModel>>> exerciseMapList,
    @Default([]) List<String> programList,
    @Default("") String title,
    @Default(false) bool isLoading,
    @Default([]) List<ExerciseModel> selectedExerciseList,
  }) = _ProgramState;
}
