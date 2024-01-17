// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_object.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CardObject _$CardObjectFromJson(Map<String, dynamic> json) {
  return _CardObject.fromJson(json);
}

/// @nodoc
mixin _$CardObject {
  /// The team who owns this cell, or null if it is unowned.
  String get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get kind =>
      throw _privateConstructorUsedError; // spades, clovers, hearts, diamonds
  String get number =>
      throw _privateConstructorUsedError; // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, DJ, Q, K
  String get color => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardObjectCopyWith<CardObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardObjectCopyWith<$Res> {
  factory $CardObjectCopyWith(
          CardObject value, $Res Function(CardObject) then) =
      _$CardObjectCopyWithImpl<$Res, CardObject>;
  @useResult
  $Res call({String id, String uid, String kind, String number, String color});
}

/// @nodoc
class _$CardObjectCopyWithImpl<$Res, $Val extends CardObject>
    implements $CardObjectCopyWith<$Res> {
  _$CardObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? kind = null,
    Object? number = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardObjectImplCopyWith<$Res>
    implements $CardObjectCopyWith<$Res> {
  factory _$$CardObjectImplCopyWith(
          _$CardObjectImpl value, $Res Function(_$CardObjectImpl) then) =
      __$$CardObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String uid, String kind, String number, String color});
}

/// @nodoc
class __$$CardObjectImplCopyWithImpl<$Res>
    extends _$CardObjectCopyWithImpl<$Res, _$CardObjectImpl>
    implements _$$CardObjectImplCopyWith<$Res> {
  __$$CardObjectImplCopyWithImpl(
      _$CardObjectImpl _value, $Res Function(_$CardObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? kind = null,
    Object? number = null,
    Object? color = null,
  }) {
    return _then(_$CardObjectImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      kind: null == kind
          ? _value.kind
          : kind // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardObjectImpl implements _CardObject {
  const _$CardObjectImpl(
      {required this.id,
      required this.uid,
      required this.kind,
      required this.number,
      required this.color});

  factory _$CardObjectImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardObjectImplFromJson(json);

  /// The team who owns this cell, or null if it is unowned.
  @override
  final String id;
  @override
  final String uid;
  @override
  final String kind;
// spades, clovers, hearts, diamonds
  @override
  final String number;
// 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, DJ, Q, K
  @override
  final String color;

  @override
  String toString() {
    return 'CardObject(id: $id, uid: $uid, kind: $kind, number: $number, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardObjectImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.kind, kind) || other.kind == kind) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, uid, kind, number, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardObjectImplCopyWith<_$CardObjectImpl> get copyWith =>
      __$$CardObjectImplCopyWithImpl<_$CardObjectImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardObjectImplToJson(
      this,
    );
  }
}

abstract class _CardObject implements CardObject {
  const factory _CardObject(
      {required final String id,
      required final String uid,
      required final String kind,
      required final String number,
      required final String color}) = _$CardObjectImpl;

  factory _CardObject.fromJson(Map<String, dynamic> json) =
      _$CardObjectImpl.fromJson;

  @override

  /// The team who owns this cell, or null if it is unowned.
  String get id;
  @override
  String get uid;
  @override
  String get kind;
  @override // spades, clovers, hearts, diamonds
  String get number;
  @override // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, DJ, Q, K
  String get color;
  @override
  @JsonKey(ignore: true)
  _$$CardObjectImplCopyWith<_$CardObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
