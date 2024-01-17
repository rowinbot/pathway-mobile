// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_player_hand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchPlayerHandImpl _$$MatchPlayerHandImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchPlayerHandImpl(
      cards: (json['cards'] as List<dynamic>)
          .map((e) => CardObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchPlayerHandImplToJson(
        _$MatchPlayerHandImpl instance) =>
    <String, dynamic>{
      'cards': instance.cards,
    };
