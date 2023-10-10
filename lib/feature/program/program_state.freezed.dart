// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProgramState {
  List<Map<String, List<ExerciseModel>>> get exerciseMapList =>
      throw _privateConstructorUsedError;
  List<String> get programList => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  List<ExerciseModel> get selectedExerciseList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProgramStateCopyWith<ProgramState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgramStateCopyWith<$Res> {
  factory $ProgramStateCopyWith(
          ProgramState value, $Res Function(ProgramState) then) =
      _$ProgramStateCopyWithImpl<$Res, ProgramState>;
  @useResult
  $Res call(
      {List<Map<String, List<ExerciseModel>>> exerciseMapList,
      List<String> programList,
      String title,
      bool isLoading,
      List<ExerciseModel> selectedExerciseList});
}

/// @nodoc
class _$ProgramStateCopyWithImpl<$Res, $Val extends ProgramState>
    implements $ProgramStateCopyWith<$Res> {
  _$ProgramStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseMapList = null,
    Object? programList = null,
    Object? title = null,
    Object? isLoading = null,
    Object? selectedExerciseList = null,
  }) {
    return _then(_value.copyWith(
      exerciseMapList: null == exerciseMapList
          ? _value.exerciseMapList
          : exerciseMapList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, List<ExerciseModel>>>,
      programList: null == programList
          ? _value.programList
          : programList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedExerciseList: null == selectedExerciseList
          ? _value.selectedExerciseList
          : selectedExerciseList // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgramStateImplCopyWith<$Res>
    implements $ProgramStateCopyWith<$Res> {
  factory _$$ProgramStateImplCopyWith(
          _$ProgramStateImpl value, $Res Function(_$ProgramStateImpl) then) =
      __$$ProgramStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Map<String, List<ExerciseModel>>> exerciseMapList,
      List<String> programList,
      String title,
      bool isLoading,
      List<ExerciseModel> selectedExerciseList});
}

/// @nodoc
class __$$ProgramStateImplCopyWithImpl<$Res>
    extends _$ProgramStateCopyWithImpl<$Res, _$ProgramStateImpl>
    implements _$$ProgramStateImplCopyWith<$Res> {
  __$$ProgramStateImplCopyWithImpl(
      _$ProgramStateImpl _value, $Res Function(_$ProgramStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseMapList = null,
    Object? programList = null,
    Object? title = null,
    Object? isLoading = null,
    Object? selectedExerciseList = null,
  }) {
    return _then(_$ProgramStateImpl(
      exerciseMapList: null == exerciseMapList
          ? _value._exerciseMapList
          : exerciseMapList // ignore: cast_nullable_to_non_nullable
              as List<Map<String, List<ExerciseModel>>>,
      programList: null == programList
          ? _value._programList
          : programList // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedExerciseList: null == selectedExerciseList
          ? _value._selectedExerciseList
          : selectedExerciseList // ignore: cast_nullable_to_non_nullable
              as List<ExerciseModel>,
    ));
  }
}

/// @nodoc

class _$ProgramStateImpl implements _ProgramState {
  const _$ProgramStateImpl(
      {final List<Map<String, List<ExerciseModel>>> exerciseMapList = const [
        {}
      ],
      final List<String> programList = const [],
      this.title = "",
      this.isLoading = false,
      final List<ExerciseModel> selectedExerciseList = const []})
      : _exerciseMapList = exerciseMapList,
        _programList = programList,
        _selectedExerciseList = selectedExerciseList;

  final List<Map<String, List<ExerciseModel>>> _exerciseMapList;
  @override
  @JsonKey()
  List<Map<String, List<ExerciseModel>>> get exerciseMapList {
    if (_exerciseMapList is EqualUnmodifiableListView) return _exerciseMapList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exerciseMapList);
  }

  final List<String> _programList;
  @override
  @JsonKey()
  List<String> get programList {
    if (_programList is EqualUnmodifiableListView) return _programList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_programList);
  }

  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final bool isLoading;
  final List<ExerciseModel> _selectedExerciseList;
  @override
  @JsonKey()
  List<ExerciseModel> get selectedExerciseList {
    if (_selectedExerciseList is EqualUnmodifiableListView)
      return _selectedExerciseList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedExerciseList);
  }

  @override
  String toString() {
    return 'ProgramState(exerciseMapList: $exerciseMapList, programList: $programList, title: $title, isLoading: $isLoading, selectedExerciseList: $selectedExerciseList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgramStateImpl &&
            const DeepCollectionEquality()
                .equals(other._exerciseMapList, _exerciseMapList) &&
            const DeepCollectionEquality()
                .equals(other._programList, _programList) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._selectedExerciseList, _selectedExerciseList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_exerciseMapList),
      const DeepCollectionEquality().hash(_programList),
      title,
      isLoading,
      const DeepCollectionEquality().hash(_selectedExerciseList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      __$$ProgramStateImplCopyWithImpl<_$ProgramStateImpl>(this, _$identity);
}

abstract class _ProgramState implements ProgramState {
  const factory _ProgramState(
      {final List<Map<String, List<ExerciseModel>>> exerciseMapList,
      final List<String> programList,
      final String title,
      final bool isLoading,
      final List<ExerciseModel> selectedExerciseList}) = _$ProgramStateImpl;

  @override
  List<Map<String, List<ExerciseModel>>> get exerciseMapList;
  @override
  List<String> get programList;
  @override
  String get title;
  @override
  bool get isLoading;
  @override
  List<ExerciseModel> get selectedExerciseList;
  @override
  @JsonKey(ignore: true)
  _$$ProgramStateImplCopyWith<_$ProgramStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
