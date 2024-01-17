// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_board_cell.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchBoardCell _$MatchBoardCellFromJson(Map<String, dynamic> json) {
  return _MatchBoardCell.fromJson(json);
}

/// @nodoc
mixin _$MatchBoardCell {
  /// The team who owns this cell, or null if it is unowned.
  int? get team => throw _privateConstructorUsedError;
  bool get isPartOfASequence => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchBoardCellCopyWith<MatchBoardCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchBoardCellCopyWith<$Res> {
  factory $MatchBoardCellCopyWith(
          MatchBoardCell value, $Res Function(MatchBoardCell) then) =
      _$MatchBoardCellCopyWithImpl<$Res, MatchBoardCell>;
  @useResult
  $Res call({int? team, bool isPartOfASequence});
}

/// @nodoc
class _$MatchBoardCellCopyWithImpl<$Res, $Val extends MatchBoardCell>
    implements $MatchBoardCellCopyWith<$Res> {
  _$MatchBoardCellCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? isPartOfASequence = null,
  }) {
    return _then(_value.copyWith(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int?,
      isPartOfASequence: null == isPartOfASequence
          ? _value.isPartOfASequence
          : isPartOfASequence // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchBoardCellImplCopyWith<$Res>
    implements $MatchBoardCellCopyWith<$Res> {
  factory _$$MatchBoardCellImplCopyWith(_$MatchBoardCellImpl value,
          $Res Function(_$MatchBoardCellImpl) then) =
      __$$MatchBoardCellImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? team, bool isPartOfASequence});
}

/// @nodoc
class __$$MatchBoardCellImplCopyWithImpl<$Res>
    extends _$MatchBoardCellCopyWithImpl<$Res, _$MatchBoardCellImpl>
    implements _$$MatchBoardCellImplCopyWith<$Res> {
  __$$MatchBoardCellImplCopyWithImpl(
      _$MatchBoardCellImpl _value, $Res Function(_$MatchBoardCellImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? team = freezed,
    Object? isPartOfASequence = null,
  }) {
    return _then(_$MatchBoardCellImpl(
      team: freezed == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int?,
      isPartOfASequence: null == isPartOfASequence
          ? _value.isPartOfASequence
          : isPartOfASequence // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchBoardCellImpl implements _MatchBoardCell {
  const _$MatchBoardCellImpl(
      {required this.team, required this.isPartOfASequence});

  factory _$MatchBoardCellImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchBoardCellImplFromJson(json);

  /// The team who owns this cell, or null if it is unowned.
  @override
  final int? team;
  @override
  final bool isPartOfASequence;

  @override
  String toString() {
    return 'MatchBoardCell(team: $team, isPartOfASequence: $isPartOfASequence)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchBoardCellImpl &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.isPartOfASequence, isPartOfASequence) ||
                other.isPartOfASequence == isPartOfASequence));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, team, isPartOfASequence);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchBoardCellImplCopyWith<_$MatchBoardCellImpl> get copyWith =>
      __$$MatchBoardCellImplCopyWithImpl<_$MatchBoardCellImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchBoardCellImplToJson(
      this,
    );
  }
}

abstract class _MatchBoardCell implements MatchBoardCell {
  const factory _MatchBoardCell(
      {required final int? team,
      required final bool isPartOfASequence}) = _$MatchBoardCellImpl;

  factory _MatchBoardCell.fromJson(Map<String, dynamic> json) =
      _$MatchBoardCellImpl.fromJson;

  @override

  /// The team who owns this cell, or null if it is unowned.
  int? get team;
  @override
  bool get isPartOfASequence;
  @override
  @JsonKey(ignore: true)
  _$$MatchBoardCellImplCopyWith<_$MatchBoardCellImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
