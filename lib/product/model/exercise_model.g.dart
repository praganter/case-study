// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      name: json['name'] as String?,
      type: json['type'] as String?,
      muscle: json['muscle'] as String?,
      equipment: json['equipment'] as String?,
      difficulty: json['difficulty'] as String?,
      instructions: json['instructions'] as String?,
    );

Map<String, dynamic> _$$ExerciseModelImplToJson(_$ExerciseModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'muscle': instance.muscle,
      'equipment': instance.equipment,
      'difficulty': instance.difficulty,
      'instructions': instance.instructions,
    };
