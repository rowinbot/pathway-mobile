// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_player_hand.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchPlayerHand _$MatchPlayerHandFromJson(Map<String, dynamic> json) {
  return _MatchPlayerHand.fromJson(json);
}

/// @nodoc
mixin _$MatchPlayerHand {
  List<CardObject> get cards => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchPlayerHandCopyWith<MatchPlayerHand> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchPlayerHandCopyWith<$Res> {
  factory $MatchPlayerHandCopyWith(
          MatchPlayerHand value, $Res Function(MatchPlayerHand) then) =
      _$MatchPlayerHandCopyWithImpl<$Res, MatchPlayerHand>;
  @useResult
  $Res call({List<CardObject> cards});
}

/// @nodoc
class _$MatchPlayerHandCopyWithImpl<$Res, $Val extends MatchPlayerHand>
    implements $MatchPlayerHandCopyWith<$Res> {
  _$MatchPlayerHandCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_value.copyWith(
      cards: null == cards
          ? _value.cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardObject>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchPlayerHandImplCopyWith<$Res>
    implements $MatchPlayerHandCopyWith<$Res> {
  factory _$$MatchPlayerHandImplCopyWith(_$MatchPlayerHandImpl value,
          $Res Function(_$MatchPlayerHandImpl) then) =
      __$$MatchPlayerHandImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CardObject> cards});
}

/// @nodoc
class __$$MatchPlayerHandImplCopyWithImpl<$Res>
    extends _$MatchPlayerHandCopyWithImpl<$Res, _$MatchPlayerHandImpl>
    implements _$$MatchPlayerHandImplCopyWith<$Res> {
  __$$MatchPlayerHandImplCopyWithImpl(
      _$MatchPlayerHandImpl _value, $Res Function(_$MatchPlayerHandImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cards = null,
  }) {
    return _then(_$MatchPlayerHandImpl(
      cards: null == cards
          ? _value._cards
          : cards // ignore: cast_nullable_to_non_nullable
              as List<CardObject>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchPlayerHandImpl implements _MatchPlayerHand {
  const _$MatchPlayerHandImpl({required final List<CardObject> cards})
      : _cards = cards;

  factory _$MatchPlayerHandImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchPlayerHandImplFromJson(json);

  final List<CardObject> _cards;
  @override
  List<CardObject> get cards {
    if (_cards is EqualUnmodifiableListView) return _cards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cards);
  }

  @override
  String toString() {
    return 'MatchPlayerHand(cards: $cards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchPlayerHandImpl &&
            const DeepCollectionEquality().equals(other._cards, _cards));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cards));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchPlayerHandImplCopyWith<_$MatchPlayerHandImpl> get copyWith =>
      __$$MatchPlayerHandImplCopyWithImpl<_$MatchPlayerHandImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchPlayerHandImplToJson(
      this,
    );
  }
}

abstract class _MatchPlayerHand implements MatchPlayerHand {
  const factory _MatchPlayerHand({required final List<CardObject> cards}) =
      _$MatchPlayerHandImpl;

  factory _MatchPlayerHand.fromJson(Map<String, dynamic> json) =
      _$MatchPlayerHandImpl.fromJson;

  @override
  List<CardObject> get cards;
  @override
  @JsonKey(ignore: true)
  _$$MatchPlayerHandImplCopyWith<_$MatchPlayerHandImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
