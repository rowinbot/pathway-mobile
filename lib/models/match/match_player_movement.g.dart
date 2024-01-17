// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_player_movement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchPlayerMovementImpl _$$MatchPlayerMovementImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchPlayerMovementImpl(
      card: CardObject.fromJson(json['card'] as Map<String, dynamic>),
      team: json['team'] as int,
      row: json['row'] as int,
      col: json['col'] as int,
      newSequences: (json['newSequences'] as List<dynamic>)
          .map((e) => SequenceBounds.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchPlayerMovementImplToJson(
        _$MatchPlayerMovementImpl instance) =>
    <String, dynamic>{
      'card': instance.card,
      'team': instance.team,
      'row': instance.row,
      'col': instance.col,
      'newSequences': instance.newSequences,
    };
