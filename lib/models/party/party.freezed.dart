// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'party.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Party _$PartyFromJson(Map<String, dynamic> json) {
  return _Party.fromJson(json);
}

/// @nodoc
mixin _$Party {
  String get code => throw _privateConstructorUsedError;
  String get ownerPlayerId => throw _privateConstructorUsedError;
  /**
     * Active players in the party.
     *
     * This list gets reset after every game to the active players.
     * If the party doesn't have an active match (matches.last)
     * players that disconnect from the server will automatically
     * leave the party -> this list does not include historical players.
     *
     * To get historical players query matches and sum up the players
     * accounting for de-duping.
     */
  List<Player> get players => throw _privateConstructorUsedError;
  /**
     * Stack of matches in the party. You can check the active match
     * by querying the last match in the stack and checking if it hasn't ended.
     */
  List<String> get matchesCodes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PartyCopyWith<Party> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartyCopyWith<$Res> {
  factory $PartyCopyWith(Party value, $Res Function(Party) then) =
      _$PartyCopyWithImpl<$Res, Party>;
  @useResult
  $Res call(
      {String code,
      String ownerPlayerId,
      List<Player> players,
      List<String> matchesCodes});
}

/// @nodoc
class _$PartyCopyWithImpl<$Res, $Val extends Party>
    implements $PartyCopyWith<$Res> {
  _$PartyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? ownerPlayerId = null,
    Object? players = null,
    Object? matchesCodes = null,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      ownerPlayerId: null == ownerPlayerId
          ? _value.ownerPlayerId
          : ownerPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value.players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      matchesCodes: null == matchesCodes
          ? _value.matchesCodes
          : matchesCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PartyImplCopyWith<$Res> implements $PartyCopyWith<$Res> {
  factory _$$PartyImplCopyWith(
          _$PartyImpl value, $Res Function(_$PartyImpl) then) =
      __$$PartyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String ownerPlayerId,
      List<Player> players,
      List<String> matchesCodes});
}

/// @nodoc
class __$$PartyImplCopyWithImpl<$Res>
    extends _$PartyCopyWithImpl<$Res, _$PartyImpl>
    implements _$$PartyImplCopyWith<$Res> {
  __$$PartyImplCopyWithImpl(
      _$PartyImpl _value, $Res Function(_$PartyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? ownerPlayerId = null,
    Object? players = null,
    Object? matchesCodes = null,
  }) {
    return _then(_$PartyImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      ownerPlayerId: null == ownerPlayerId
          ? _value.ownerPlayerId
          : ownerPlayerId // ignore: cast_nullable_to_non_nullable
              as String,
      players: null == players
          ? _value._players
          : players // ignore: cast_nullable_to_non_nullable
              as List<Player>,
      matchesCodes: null == matchesCodes
          ? _value._matchesCodes
          : matchesCodes // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PartyImpl implements _Party {
  const _$PartyImpl(
      {required this.code,
      required this.ownerPlayerId,
      required final List<Player> players,
      required final List<String> matchesCodes})
      : _players = players,
        _matchesCodes = matchesCodes;

  factory _$PartyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartyImplFromJson(json);

  @override
  final String code;
  @override
  final String ownerPlayerId;
/**
     * Active players in the party.
     *
     * This list gets reset after every game to the active players.
     * If the party doesn't have an active match (matches.last)
     * players that disconnect from the server will automatically
     * leave the party -> this list does not include historical players.
     *
     * To get historical players query matches and sum up the players
     * accounting for de-duping.
     */
  final List<Player> _players;
/**
     * Active players in the party.
     *
     * This list gets reset after every game to the active players.
     * If the party doesn't have an active match (matches.last)
     * players that disconnect from the server will automatically
     * leave the party -> this list does not include historical players.
     *
     * To get historical players query matches and sum up the players
     * accounting for de-duping.
     */
  @override
  List<Player> get players {
    if (_players is EqualUnmodifiableListView) return _players;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_players);
  }

/**
     * Stack of matches in the party. You can check the active match
     * by querying the last match in the stack and checking if it hasn't ended.
     */
  final List<String> _matchesCodes;
/**
     * Stack of matches in the party. You can check the active match
     * by querying the last match in the stack and checking if it hasn't ended.
     */
  @override
  List<String> get matchesCodes {
    if (_matchesCodes is EqualUnmodifiableListView) return _matchesCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchesCodes);
  }

  @override
  String toString() {
    return 'Party(code: $code, ownerPlayerId: $ownerPlayerId, players: $players, matchesCodes: $matchesCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartyImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.ownerPlayerId, ownerPlayerId) ||
                other.ownerPlayerId == ownerPlayerId) &&
            const DeepCollectionEquality().equals(other._players, _players) &&
            const DeepCollectionEquality()
                .equals(other._matchesCodes, _matchesCodes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      code,
      ownerPlayerId,
      const DeepCollectionEquality().hash(_players),
      const DeepCollectionEquality().hash(_matchesCodes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PartyImplCopyWith<_$PartyImpl> get copyWith =>
      __$$PartyImplCopyWithImpl<_$PartyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartyImplToJson(
      this,
    );
  }
}

abstract class _Party implements Party {
  const factory _Party(
      {required final String code,
      required final String ownerPlayerId,
      required final List<Player> players,
      required final List<String> matchesCodes}) = _$PartyImpl;

  factory _Party.fromJson(Map<String, dynamic> json) = _$PartyImpl.fromJson;

  @override
  String get code;
  @override
  String get ownerPlayerId;
  @override
  /**
     * Active players in the party.
     *
     * This list gets reset after every game to the active players.
     * If the party doesn't have an active match (matches.last)
     * players that disconnect from the server will automatically
     * leave the party -> this list does not include historical players.
     *
     * To get historical players query matches and sum up the players
     * accounting for de-duping.
     */
  List<Player> get players;
  @override
  /**
     * Stack of matches in the party. You can check the active match
     * by querying the last match in the stack and checking if it hasn't ended.
     */
  List<String> get matchesCodes;
  @override
  @JsonKey(ignore: true)
  _$$PartyImplCopyWith<_$PartyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
