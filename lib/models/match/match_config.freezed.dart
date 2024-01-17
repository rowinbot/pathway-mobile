// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchConfig _$MatchConfigFromJson(Map<String, dynamic> json) {
  return _MatchConfig.fromJson(json);
}

/// @nodoc
mixin _$MatchConfig {
  int get turnTimeLimitSeconds => throw _privateConstructorUsedError;
  int get maxPlayers => throw _privateConstructorUsedError;
  bool get enableHints => throw _privateConstructorUsedError;
  bool get enableRematch => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchConfigCopyWith<MatchConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchConfigCopyWith<$Res> {
  factory $MatchConfigCopyWith(
          MatchConfig value, $Res Function(MatchConfig) then) =
      _$MatchConfigCopyWithImpl<$Res, MatchConfig>;
  @useResult
  $Res call(
      {int turnTimeLimitSeconds,
      int maxPlayers,
      bool enableHints,
      bool enableRematch});
}

/// @nodoc
class _$MatchConfigCopyWithImpl<$Res, $Val extends MatchConfig>
    implements $MatchConfigCopyWith<$Res> {
  _$MatchConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnTimeLimitSeconds = null,
    Object? maxPlayers = null,
    Object? enableHints = null,
    Object? enableRematch = null,
  }) {
    return _then(_value.copyWith(
      turnTimeLimitSeconds: null == turnTimeLimitSeconds
          ? _value.turnTimeLimitSeconds
          : turnTimeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      enableHints: null == enableHints
          ? _value.enableHints
          : enableHints // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRematch: null == enableRematch
          ? _value.enableRematch
          : enableRematch // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchConfigImplCopyWith<$Res>
    implements $MatchConfigCopyWith<$Res> {
  factory _$$MatchConfigImplCopyWith(
          _$MatchConfigImpl value, $Res Function(_$MatchConfigImpl) then) =
      __$$MatchConfigImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int turnTimeLimitSeconds,
      int maxPlayers,
      bool enableHints,
      bool enableRematch});
}

/// @nodoc
class __$$MatchConfigImplCopyWithImpl<$Res>
    extends _$MatchConfigCopyWithImpl<$Res, _$MatchConfigImpl>
    implements _$$MatchConfigImplCopyWith<$Res> {
  __$$MatchConfigImplCopyWithImpl(
      _$MatchConfigImpl _value, $Res Function(_$MatchConfigImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? turnTimeLimitSeconds = null,
    Object? maxPlayers = null,
    Object? enableHints = null,
    Object? enableRematch = null,
  }) {
    return _then(_$MatchConfigImpl(
      turnTimeLimitSeconds: null == turnTimeLimitSeconds
          ? _value.turnTimeLimitSeconds
          : turnTimeLimitSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      maxPlayers: null == maxPlayers
          ? _value.maxPlayers
          : maxPlayers // ignore: cast_nullable_to_non_nullable
              as int,
      enableHints: null == enableHints
          ? _value.enableHints
          : enableHints // ignore: cast_nullable_to_non_nullable
              as bool,
      enableRematch: null == enableRematch
          ? _value.enableRematch
          : enableRematch // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchConfigImpl implements _MatchConfig {
  const _$MatchConfigImpl(
      {required this.turnTimeLimitSeconds,
      required this.maxPlayers,
      required this.enableHints,
      required this.enableRematch});

  factory _$MatchConfigImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchConfigImplFromJson(json);

  @override
  final int turnTimeLimitSeconds;
  @override
  final int maxPlayers;
  @override
  final bool enableHints;
  @override
  final bool enableRematch;

  @override
  String toString() {
    return 'MatchConfig(turnTimeLimitSeconds: $turnTimeLimitSeconds, maxPlayers: $maxPlayers, enableHints: $enableHints, enableRematch: $enableRematch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchConfigImpl &&
            (identical(other.turnTimeLimitSeconds, turnTimeLimitSeconds) ||
                other.turnTimeLimitSeconds == turnTimeLimitSeconds) &&
            (identical(other.maxPlayers, maxPlayers) ||
                other.maxPlayers == maxPlayers) &&
            (identical(other.enableHints, enableHints) ||
                other.enableHints == enableHints) &&
            (identical(other.enableRematch, enableRematch) ||
                other.enableRematch == enableRematch));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, turnTimeLimitSeconds, maxPlayers,
      enableHints, enableRematch);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchConfigImplCopyWith<_$MatchConfigImpl> get copyWith =>
      __$$MatchConfigImplCopyWithImpl<_$MatchConfigImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchConfigImplToJson(
      this,
    );
  }
}

abstract class _MatchConfig implements MatchConfig {
  const factory _MatchConfig(
      {required final int turnTimeLimitSeconds,
      required final int maxPlayers,
      required final bool enableHints,
      required final bool enableRematch}) = _$MatchConfigImpl;

  factory _MatchConfig.fromJson(Map<String, dynamic> json) =
      _$MatchConfigImpl.fromJson;

  @override
  int get turnTimeLimitSeconds;
  @override
  int get maxPlayers;
  @override
  bool get enableHints;
  @override
  bool get enableRematch;
  @override
  @JsonKey(ignore: true)
  _$$MatchConfigImplCopyWith<_$MatchConfigImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
