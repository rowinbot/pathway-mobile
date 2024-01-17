// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sequence_bounds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SequenceBounds _$SequenceBoundsFromJson(Map<String, dynamic> json) {
  return _SequenceBounds.fromJson(json);
}

/// @nodoc
mixin _$SequenceBounds {
  int get startRow => throw _privateConstructorUsedError;
  int get endRow => throw _privateConstructorUsedError;
  int get startCol => throw _privateConstructorUsedError;
  int get endCol => throw _privateConstructorUsedError;
  int get sequencesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SequenceBoundsCopyWith<SequenceBounds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SequenceBoundsCopyWith<$Res> {
  factory $SequenceBoundsCopyWith(
          SequenceBounds value, $Res Function(SequenceBounds) then) =
      _$SequenceBoundsCopyWithImpl<$Res, SequenceBounds>;
  @useResult
  $Res call(
      {int startRow, int endRow, int startCol, int endCol, int sequencesCount});
}

/// @nodoc
class _$SequenceBoundsCopyWithImpl<$Res, $Val extends SequenceBounds>
    implements $SequenceBoundsCopyWith<$Res> {
  _$SequenceBoundsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startRow = null,
    Object? endRow = null,
    Object? startCol = null,
    Object? endCol = null,
    Object? sequencesCount = null,
  }) {
    return _then(_value.copyWith(
      startRow: null == startRow
          ? _value.startRow
          : startRow // ignore: cast_nullable_to_non_nullable
              as int,
      endRow: null == endRow
          ? _value.endRow
          : endRow // ignore: cast_nullable_to_non_nullable
              as int,
      startCol: null == startCol
          ? _value.startCol
          : startCol // ignore: cast_nullable_to_non_nullable
              as int,
      endCol: null == endCol
          ? _value.endCol
          : endCol // ignore: cast_nullable_to_non_nullable
              as int,
      sequencesCount: null == sequencesCount
          ? _value.sequencesCount
          : sequencesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SequenceBoundsImplCopyWith<$Res>
    implements $SequenceBoundsCopyWith<$Res> {
  factory _$$SequenceBoundsImplCopyWith(_$SequenceBoundsImpl value,
          $Res Function(_$SequenceBoundsImpl) then) =
      __$$SequenceBoundsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int startRow, int endRow, int startCol, int endCol, int sequencesCount});
}

/// @nodoc
class __$$SequenceBoundsImplCopyWithImpl<$Res>
    extends _$SequenceBoundsCopyWithImpl<$Res, _$SequenceBoundsImpl>
    implements _$$SequenceBoundsImplCopyWith<$Res> {
  __$$SequenceBoundsImplCopyWithImpl(
      _$SequenceBoundsImpl _value, $Res Function(_$SequenceBoundsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startRow = null,
    Object? endRow = null,
    Object? startCol = null,
    Object? endCol = null,
    Object? sequencesCount = null,
  }) {
    return _then(_$SequenceBoundsImpl(
      startRow: null == startRow
          ? _value.startRow
          : startRow // ignore: cast_nullable_to_non_nullable
              as int,
      endRow: null == endRow
          ? _value.endRow
          : endRow // ignore: cast_nullable_to_non_nullable
              as int,
      startCol: null == startCol
          ? _value.startCol
          : startCol // ignore: cast_nullable_to_non_nullable
              as int,
      endCol: null == endCol
          ? _value.endCol
          : endCol // ignore: cast_nullable_to_non_nullable
              as int,
      sequencesCount: null == sequencesCount
          ? _value.sequencesCount
          : sequencesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SequenceBoundsImpl implements _SequenceBounds {
  const _$SequenceBoundsImpl(
      {required this.startRow,
      required this.endRow,
      required this.startCol,
      required this.endCol,
      required this.sequencesCount});

  factory _$SequenceBoundsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SequenceBoundsImplFromJson(json);

  @override
  final int startRow;
  @override
  final int endRow;
  @override
  final int startCol;
  @override
  final int endCol;
  @override
  final int sequencesCount;

  @override
  String toString() {
    return 'SequenceBounds(startRow: $startRow, endRow: $endRow, startCol: $startCol, endCol: $endCol, sequencesCount: $sequencesCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SequenceBoundsImpl &&
            (identical(other.startRow, startRow) ||
                other.startRow == startRow) &&
            (identical(other.endRow, endRow) || other.endRow == endRow) &&
            (identical(other.startCol, startCol) ||
                other.startCol == startCol) &&
            (identical(other.endCol, endCol) || other.endCol == endCol) &&
            (identical(other.sequencesCount, sequencesCount) ||
                other.sequencesCount == sequencesCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, startRow, endRow, startCol, endCol, sequencesCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SequenceBoundsImplCopyWith<_$SequenceBoundsImpl> get copyWith =>
      __$$SequenceBoundsImplCopyWithImpl<_$SequenceBoundsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SequenceBoundsImplToJson(
      this,
    );
  }
}

abstract class _SequenceBounds implements SequenceBounds {
  const factory _SequenceBounds(
      {required final int startRow,
      required final int endRow,
      required final int startCol,
      required final int endCol,
      required final int sequencesCount}) = _$SequenceBoundsImpl;

  factory _SequenceBounds.fromJson(Map<String, dynamic> json) =
      _$SequenceBoundsImpl.fromJson;

  @override
  int get startRow;
  @override
  int get endRow;
  @override
  int get startCol;
  @override
  int get endCol;
  @override
  int get sequencesCount;
  @override
  @JsonKey(ignore: true)
  _$$SequenceBoundsImplCopyWith<_$SequenceBoundsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
