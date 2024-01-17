// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sequence_bounds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SequenceBoundsImpl _$$SequenceBoundsImplFromJson(Map<String, dynamic> json) =>
    _$SequenceBoundsImpl(
      startRow: json['startRow'] as int,
      endRow: json['endRow'] as int,
      startCol: json['startCol'] as int,
      endCol: json['endCol'] as int,
      sequencesCount: json['sequencesCount'] as int,
    );

Map<String, dynamic> _$$SequenceBoundsImplToJson(
        _$SequenceBoundsImpl instance) =>
    <String, dynamic>{
      'startRow': instance.startRow,
      'endRow': instance.endRow,
      'startCol': instance.startCol,
      'endCol': instance.endCol,
      'sequencesCount': instance.sequencesCount,
    };
