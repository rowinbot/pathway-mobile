// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_current_turn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchCurrentTurnImpl _$$MatchCurrentTurnImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchCurrentTurnImpl(
      turnStartTime: json['turnStartTime'] as int,
      turnPlayerId: json['turnPlayerId'] as String,
    );

Map<String, dynamic> _$$MatchCurrentTurnImplToJson(
        _$MatchCurrentTurnImpl instance) =>
    <String, dynamic>{
      'turnStartTime': instance.turnStartTime,
      'turnPlayerId': instance.turnPlayerId,
    };
