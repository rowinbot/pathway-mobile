// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_current_turn.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchCurrentTurn _$MatchCurrentTurnFromJson(Map<String, dynamic> json) {
  return _MatchCurrentTurn.fromJson(json);
}

/// @nodoc
mixin _$MatchCurrentTurn {
  int get turnStartTime => throw _privateConstructorUsedError;
  String get turnPlayerId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCurrentTurnCopyWith<MatchCurrentTurn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCurrentTurnCopyWith<$Res> {
  factory $MatchCurrentTurnCopyWith(
          MatchCurrentTurn value, $Res Function(MatchCurrentTurn) then) =
      _$MatchCurrentTurnCopyWithImpl<$Res, MatchCurrentTurn>;
  @useResult
  $Res call({int turnStartTime, String turnPlayerId});
}

/// @nodoc
class _$MatchCurrentTurnCopyWithImpl<$Res, $Val extends MatchCurrentTurn>
    implements $MatchCurrentTurnCopyWith<$Res> {
  _$MatchCurrentTurnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnStartTime = null,
    Object? turnPlayerId = null,
  }) {
    return _then(_value.copyWith(
      turnStartTime: null == turnStartTime
          ? _value.turnStartTime
          : turnStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      turnPlayerId: null == turnPlayerId
          ? _value.turnPlayerId
          : turnPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchCurrentTurnImplCopyWith<$Res>
    implements $MatchCurrentTurnCopyWith<$Res> {
  factory _$$MatchCurrentTurnImplCopyWith(_$MatchCurrentTurnImpl value,
          $Res Function(_$MatchCurrentTurnImpl) then) =
      __$$MatchCurrentTurnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int turnStartTime, String turnPlayerId});
}

/// @nodoc
class __$$MatchCurrentTurnImplCopyWithImpl<$Res>
    extends _$MatchCurrentTurnCopyWithImpl<$Res, _$MatchCurrentTurnImpl>
    implements _$$MatchCurrentTurnImplCopyWith<$Res> {
  __$$MatchCurrentTurnImplCopyWithImpl(_$MatchCurrentTurnImpl _value,
      $Res Function(_$MatchCurrentTurnImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnStartTime = null,
    Object? turnPlayerId = null,
  }) {
    return _then(_$MatchCurrentTurnImpl(
      turnStartTime: null == turnStartTime
          ? _value.turnStartTime
          : turnStartTime // ignore: cast_nullable_to_non_nullable
              as int,
      turnPlayerId: null == turnPlayerId
          ? _value.turnPlayerId
          : turnPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchCurrentTurnImpl implements _MatchCurrentTurn {
  const _$MatchCurrentTurnImpl(
      {required this.turnStartTime, required this.turnPlayerId});

  factory _$MatchCurrentTurnImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchCurrentTurnImplFromJson(json);

  @override
  final int turnStartTime;
  @override
  final String turnPlayerId;

  @override
  String toString() {
    return 'MatchCurrentTurn(turnStartTime: $turnStartTime, turnPlayerId: $turnPlayerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchCurrentTurnImpl &&
            (identical(other.turnStartTime, turnStartTime) ||
                other.turnStartTime == turnStartTime) &&
            (identical(other.turnPlayerId, turnPlayerId) ||
                other.turnPlayerId == turnPlayerId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, turnStartTime, turnPlayerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchCurrentTurnImplCopyWith<_$MatchCurrentTurnImpl> get copyWith =>
      __$$MatchCurrentTurnImplCopyWithImpl<_$MatchCurrentTurnImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchCurrentTurnImplToJson(
      this,
    );
  }
}

abstract class _MatchCurrentTurn implements MatchCurrentTurn {
  const factory _MatchCurrentTurn(
      {required final int turnStartTime,
      required final String turnPlayerId}) = _$MatchCurrentTurnImpl;

  factory _MatchCurrentTurn.fromJson(Map<String, dynamic> json) =
      _$MatchCurrentTurnImpl.fromJson;

  @override
  int get turnStartTime;
  @override
  String get turnPlayerId;
  @override
  @JsonKey(ignore: true)
  _$$MatchCurrentTurnImplCopyWith<_$MatchCurrentTurnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
