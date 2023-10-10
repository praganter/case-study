// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseAdapter extends TypeAdapter<ExerciseModel> {
  @override
  final int typeId = 0;

  @override
  ExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseModel(
      name: fields[0] as String,
      type: fields[1] as String,
      muscle: fields[2] as String,
      equipment: fields[3] as String,
      difficulty: fields[4] as String,
      instructions: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.muscle)
      ..writeByte(3)
      ..write(obj.equipment)
      ..writeByte(4)
      ..write(obj.difficulty)
      ..writeByte(5)
      ..write(obj.instructions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseModelImpl _$$ExerciseModelImplFromJson(Map<String, dynamic> json) =>
    _$ExerciseModelImpl(
      name: json['name'] as String? ?? "",
      type: json['type'] as String? ?? "",
      muscle: json['muscle'] as String? ?? "",
      equipment: json['equipment'] as String? ?? "",
      difficulty: json['difficulty'] as String? ?? "",
      instructions: json['instructions'] as String? ?? "",
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
