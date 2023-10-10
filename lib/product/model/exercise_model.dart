import 'package:case_study/product/constat/string_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
@HiveType(typeId: 0, adapterName: StringConstants.exerciseAdapter)
class ExerciseModel extends HiveObject with _$ExerciseModel {
  ExerciseModel._();
  factory ExerciseModel({
    @Default("") @HiveField(0) String name,
    @Default("") @HiveField(1) String type,
    @Default("") @HiveField(2) String muscle,
    @Default("") @HiveField(3) String equipment,
    @Default("") @HiveField(4) String difficulty,
    @Default("") @HiveField(5) String instructions,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => _$ExerciseModelFromJson(json);
}
