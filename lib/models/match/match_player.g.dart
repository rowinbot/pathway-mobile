// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchPlayerImpl _$$MatchPlayerImplFromJson(Map<String, dynamic> json) =>
    _$MatchPlayerImpl(
      id: json['id'] as String,
      nickname: json['nickname'] as String,
      team: json['team'] as int,
      isOwner: json['isOwner'] as bool,
      isConnected: json['isConnected'] as bool,
    );

Map<String, dynamic> _$$MatchPlayerImplToJson(_$MatchPlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nickname': instance.nickname,
      'team': instance.team,
      'isOwner': instance.isOwner,
      'isConnected': instance.isConnected,
    };
