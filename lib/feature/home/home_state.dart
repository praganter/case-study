import 'package:case_study/product/model/exercise_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<ExerciseModel> exerciseList,
    @Default([]) List<String> suggestionList,
    @Default(false) bool isLoading,
    @Default("") String type,
    @Default([]) List<String> selectedMuscleList,
  }) = _HomeState;
}
