// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchConfigImpl _$$MatchConfigImplFromJson(Map<String, dynamic> json) =>
    _$MatchConfigImpl(
      turnTimeLimitSeconds: json['turnTimeLimitSeconds'] as int,
      maxPlayers: json['maxPlayers'] as int,
      enableHints: json['enableHints'] as bool,
      enableRematch: json['enableRematch'] as bool,
    );

Map<String, dynamic> _$$MatchConfigImplToJson(_$MatchConfigImpl instance) =>
    <String, dynamic>{
      'turnTimeLimitSeconds': instance.turnTimeLimitSeconds,
      'maxPlayers': instance.maxPlayers,
      'enableHints': instance.enableHints,
      'enableRematch': instance.enableRematch,
    };
