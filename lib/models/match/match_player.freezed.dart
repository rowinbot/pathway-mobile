// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchPlayer _$MatchPlayerFromJson(Map<String, dynamic> json) {
  return _MatchPlayer.fromJson(json);
}

/// @nodoc
mixin _$MatchPlayer {
  String get id => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  int get team => throw _privateConstructorUsedError;
  bool get isOwner => throw _privateConstructorUsedError;
  bool get isConnected => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchPlayerCopyWith<MatchPlayer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPlayerCopyWith<$Res> {
  factory $MatchPlayerCopyWith(
          MatchPlayer value, $Res Function(MatchPlayer) then) =
      _$MatchPlayerCopyWithImpl<$Res, MatchPlayer>;
  @useResult
  $Res call(
      {String id, String nickname, int team, bool isOwner, bool isConnected});
}

/// @nodoc
class _$MatchPlayerCopyWithImpl<$Res, $Val extends MatchPlayer>
    implements $MatchPlayerCopyWith<$Res> {
  _$MatchPlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? team = null,
    Object? isOwner = null,
    Object? isConnected = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchPlayerImplCopyWith<$Res>
    implements $MatchPlayerCopyWith<$Res> {
  factory _$$MatchPlayerImplCopyWith(
          _$MatchPlayerImpl value, $Res Function(_$MatchPlayerImpl) then) =
      __$$MatchPlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String nickname, int team, bool isOwner, bool isConnected});
}

/// @nodoc
class __$$MatchPlayerImplCopyWithImpl<$Res>
    extends _$MatchPlayerCopyWithImpl<$Res, _$MatchPlayerImpl>
    implements _$$MatchPlayerImplCopyWith<$Res> {
  __$$MatchPlayerImplCopyWithImpl(
      _$MatchPlayerImpl _value, $Res Function(_$MatchPlayerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nickname = null,
    Object? team = null,
    Object? isOwner = null,
    Object? isConnected = null,
  }) {
    return _then(_$MatchPlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      team: null == team
          ? _value.team
          : team // ignore: cast_nullable_to_non_nullable
              as int,
      isOwner: null == isOwner
          ? _value.isOwner
          : isOwner // ignore: cast_nullable_to_non_nullable
              as bool,
      isConnected: null == isConnected
          ? _value.isConnected
          : isConnected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPlayerImpl implements _MatchPlayer {
  const _$MatchPlayerImpl(
      {required this.id,
      required this.nickname,
      required this.team,
      required this.isOwner,
      required this.isConnected});

  factory _$MatchPlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPlayerImplFromJson(json);

  @override
  final String id;
  @override
  final String nickname;
  @override
  final int team;
  @override
  final bool isOwner;
  @override
  final bool isConnected;

  @override
  String toString() {
    return 'MatchPlayer(id: $id, nickname: $nickname, team: $team, isOwner: $isOwner, isConnected: $isConnected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.team, team) || other.team == team) &&
            (identical(other.isOwner, isOwner) || other.isOwner == isOwner) &&
            (identical(other.isConnected, isConnected) ||
                other.isConnected == isConnected));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nickname, team, isOwner, isConnected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPlayerImplCopyWith<_$MatchPlayerImpl> get copyWith =>
      __$$MatchPlayerImplCopyWithImpl<_$MatchPlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPlayerImplToJson(
      this,
    );
  }
}

abstract class _MatchPlayer implements MatchPlayer {
  const factory _MatchPlayer(
      {required final String id,
      required final String nickname,
      required final int team,
      required final bool isOwner,
      required final bool isConnected}) = _$MatchPlayerImpl;

  factory _MatchPlayer.fromJson(Map<String, dynamic> json) =
      _$MatchPlayerImpl.fromJson;

  @override
  String get id;
  @override
  String get nickname;
  @override
  int get team;
  @override
  bool get isOwner;
  @override
  bool get isConnected;
  @override
  @JsonKey(ignore: true)
  _$$MatchPlayerImplCopyWith<_$MatchPlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
