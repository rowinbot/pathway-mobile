// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_player_movement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchPlayerMovement _$MatchPlayerMovementFromJson(Map<String, dynamic> json) {
  return _MatchPlayerMovement.fromJson(json);
}

/// @nodoc
mixin _$MatchPlayerMovement {
  CardObject get card => throw _privateConstructorUsedError;
  int get team => throw _privateConstructorUsedError;
  int get row => throw _privateConstructorUsedError;
  int get col => throw _privateConstructorUsedError;
  List<SequenceBounds> get newSequences => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchPlayerMovementCopyWith<MatchPlayerMovement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPlayerMovementCopyWith<$Res> {
  factory $MatchPlayerMovementCopyWith(
          MatchPlayerMovement value, $Res Function(MatchPlayerMovement) then) =
      _$MatchPlayerMovementCopyWithImpl<$Res, MatchPlayerMovement>;
  @useResult
  $Res call(
      {CardObject card,
      int team,
      int row,
      int col,
      List<SequenceBounds> newSequences});

  $CardObjectCopyWith<$Res> get card;
}

/// @nodoc
class _$MatchPlayerMovementCopyWithImpl<$Res, $Val extends MatchPlayerMovement>
    implements $MatchPlayerMovementCopyWith<$Res> {
  _$MatchPlayerMovementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? team = null,
    Object? row = null,
    Object? col = null,
    Object? newSequences = null,
  }) {
    return _then(_value.copyWith(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardObject,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      newSequences: null == newSequences
          ? _value.newSequences
          : newSequences // ignore: cast_nullable_to_non_nullable
              as List<SequenceBounds>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CardObjectCopyWith<$Res> get card {
    return $CardObjectCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MatchPlayerMovementImplCopyWith<$Res>
    implements $MatchPlayerMovementCopyWith<$Res> {
  factory _$$MatchPlayerMovementImplCopyWith(_$MatchPlayerMovementImpl value,
          $Res Function(_$MatchPlayerMovementImpl) then) =
      __$$MatchPlayerMovementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {CardObject card,
      int team,
      int row,
      int col,
      List<SequenceBounds> newSequences});

  @override
  $CardObjectCopyWith<$Res> get card;
}

/// @nodoc
class __$$MatchPlayerMovementImplCopyWithImpl<$Res>
    extends _$MatchPlayerMovementCopyWithImpl<$Res, _$MatchPlayerMovementImpl>
    implements _$$MatchPlayerMovementImplCopyWith<$Res> {
  __$$MatchPlayerMovementImplCopyWithImpl(_$MatchPlayerMovementImpl _value,
      $Res Function(_$MatchPlayerMovementImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? card = null,
    Object? team = null,
    Object? row = null,
    Object? col = null,
    Object? newSequences = null,
  }) {
    return _then(_$MatchPlayerMovementImpl(
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as CardObject,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      col: null == col
          ? _value.col
          : col // ignore: cast_nullable_to_non_nullable
              as int,
      newSequences: null == newSequences
          ? _value._newSequences
          : newSequences // ignore: cast_nullable_to_non_nullable
              as List<SequenceBounds>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPlayerMovementImpl implements _MatchPlayerMovement {
  const _$MatchPlayerMovementImpl(
      {required this.card,
      required this.team,
      required this.row,
      required this.col,
      required final List<SequenceBounds> newSequences})
      : _newSequences = newSequences;

  factory _$MatchPlayerMovementImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPlayerMovementImplFromJson(json);

  @override
  final CardObject card;
  @override
  final int team;
  @override
  final int row;
  @override
  final int col;
  final List<SequenceBounds> _newSequences;
  @override
  List<SequenceBounds> get newSequences {
    if (_newSequences is EqualUnmodifiableListView) return _newSequences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newSequences);
  }

  @override
  String toString() {
    return 'MatchPlayerMovement(card: $card, team: $team, row: $row, col: $col, newSequences: $newSequences)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPlayerMovementImpl &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.col, col) || other.col == col) &&
            const DeepCollectionEquality()
                .equals(other._newSequences, _newSequences));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, card, team, row, col,
      const DeepCollectionEquality().hash(_newSequences));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPlayerMovementImplCopyWith<_$MatchPlayerMovementImpl> get copyWith =>
      __$$MatchPlayerMovementImplCopyWithImpl<_$MatchPlayerMovementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPlayerMovementImplToJson(
      this,
    );
  }
}

abstract class _MatchPlayerMovement implements MatchPlayerMovement {
  const factory _MatchPlayerMovement(
          {required final CardObject card,
          required final int team,
          required final int row,
          required final int col,
          required final List<SequenceBounds> newSequences}) =
      _$MatchPlayerMovementImpl;

  factory _MatchPlayerMovement.fromJson(Map<String, dynamic> json) =
      _$MatchPlayerMovementImpl.fromJson;

  @override
  CardObject get card;
  @override
  int get team;
  @override
  int get row;
  @override
  int get col;
  @override
  List<SequenceBounds> get newSequences;
  @override
  @JsonKey(ignore: true)
  _$$MatchPlayerMovementImplCopyWith<_$MatchPlayerMovementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
