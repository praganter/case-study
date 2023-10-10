// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) {
  return _ExerciseModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseModel {
  @HiveField(0)
  String get name => throw _privateConstructorUsedError;
  @HiveField(1)
  String get type => throw _privateConstructorUsedError;
  @HiveField(2)
  String get muscle => throw _privateConstructorUsedError;
  @HiveField(3)
  String get equipment => throw _privateConstructorUsedError;
  @HiveField(4)
  String get difficulty => throw _privateConstructorUsedError;
  @HiveField(5)
  String get instructions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseModelCopyWith<ExerciseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseModelCopyWith<$Res> {
  factory $ExerciseModelCopyWith(
          ExerciseModel value, $Res Function(ExerciseModel) then) =
      _$ExerciseModelCopyWithImpl<$Res, ExerciseModel>;
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String type,
      @HiveField(2) String muscle,
      @HiveField(3) String equipment,
      @HiveField(4) String difficulty,
      @HiveField(5) String instructions});
}

/// @nodoc
class _$ExerciseModelCopyWithImpl<$Res, $Val extends ExerciseModel>
    implements $ExerciseModelCopyWith<$Res> {
  _$ExerciseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? muscle = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: null == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseModelImplCopyWith<$Res>
    implements $ExerciseModelCopyWith<$Res> {
  factory _$$ExerciseModelImplCopyWith(
          _$ExerciseModelImpl value, $Res Function(_$ExerciseModelImpl) then) =
      __$$ExerciseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String name,
      @HiveField(1) String type,
      @HiveField(2) String muscle,
      @HiveField(3) String equipment,
      @HiveField(4) String difficulty,
      @HiveField(5) String instructions});
}

/// @nodoc
class __$$ExerciseModelImplCopyWithImpl<$Res>
    extends _$ExerciseModelCopyWithImpl<$Res, _$ExerciseModelImpl>
    implements _$$ExerciseModelImplCopyWith<$Res> {
  __$$ExerciseModelImplCopyWithImpl(
      _$ExerciseModelImpl _value, $Res Function(_$ExerciseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? muscle = null,
    Object? equipment = null,
    Object? difficulty = null,
    Object? instructions = null,
  }) {
    return _then(_$ExerciseModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      muscle: null == muscle
          ? _value.muscle
          : muscle // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      difficulty: null == difficulty
          ? _value.difficulty
          : difficulty // ignore: cast_nullable_to_non_nullable
              as String,
      instructions: null == instructions
          ? _value.instructions
          : instructions // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseModelImpl extends _ExerciseModel {
  _$ExerciseModelImpl(
      {@HiveField(0) this.name = "",
      @HiveField(1) this.type = "",
      @HiveField(2) this.muscle = "",
      @HiveField(3) this.equipment = "",
      @HiveField(4) this.difficulty = "",
      @HiveField(5) this.instructions = ""})
      : super._();

  factory _$ExerciseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseModelImplFromJson(json);

  @override
  @JsonKey()
  @HiveField(0)
  final String name;
  @override
  @JsonKey()
  @HiveField(1)
  final String type;
  @override
  @JsonKey()
  @HiveField(2)
  final String muscle;
  @override
  @JsonKey()
  @HiveField(3)
  final String equipment;
  @override
  @JsonKey()
  @HiveField(4)
  final String difficulty;
  @override
  @JsonKey()
  @HiveField(5)
  final String instructions;

  @override
  String toString() {
    return 'ExerciseModel(name: $name, type: $type, muscle: $muscle, equipment: $equipment, difficulty: $difficulty, instructions: $instructions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.muscle, muscle) || other.muscle == muscle) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.difficulty, difficulty) ||
                other.difficulty == difficulty) &&
            (identical(other.instructions, instructions) ||
                other.instructions == instructions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, name, type, muscle, equipment, difficulty, instructions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      __$$ExerciseModelImplCopyWithImpl<_$ExerciseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseModel extends ExerciseModel {
  factory _ExerciseModel(
      {@HiveField(0) final String name,
      @HiveField(1) final String type,
      @HiveField(2) final String muscle,
      @HiveField(3) final String equipment,
      @HiveField(4) final String difficulty,
      @HiveField(5) final String instructions}) = _$ExerciseModelImpl;
  _ExerciseModel._() : super._();

  factory _ExerciseModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseModelImpl.fromJson;

  @override
  @HiveField(0)
  String get name;
  @override
  @HiveField(1)
  String get type;
  @override
  @HiveField(2)
  String get muscle;
  @override
  @HiveField(3)
  String get equipment;
  @override
  @HiveField(4)
  String get difficulty;
  @override
  @HiveField(5)
  String get instructions;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseModelImplCopyWith<_$ExerciseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
