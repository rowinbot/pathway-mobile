// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'party.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PartyImpl _$$PartyImplFromJson(Map<String, dynamic> json) => _$PartyImpl(
      code: json['code'] as String,
      ownerPlayerId: json['ownerPlayerId'] as String,
      players: (json['players'] as List<dynamic>)
          .map((e) => Player.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchesCodes: (json['matchesCodes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$PartyImplToJson(_$PartyImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'ownerPlayerId': instance.ownerPlayerId,
      'players': instance.players,
      'matchesCodes': instance.matchesCodes,
    };
