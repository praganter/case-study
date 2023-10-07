import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
class ExerciseModel with _$ExerciseModel {
  const factory ExerciseModel({
    final String? name,
    final String? type,
    final String? muscle,
    final String? equipment,
    final String? difficulty,
    final String? instructions,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}
