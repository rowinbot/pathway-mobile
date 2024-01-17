import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathway_mobile/models/match/card_object.dart';

part 'match_player_hand.freezed.dart';
part 'match_player_hand.g.dart';

@freezed
class MatchPlayerHand with _$MatchPlayerHand {
  const factory MatchPlayerHand({
    required List<CardObject> cards,
  }) = _MatchPlayerHand;

  factory MatchPlayerHand.fromJson(Map<String, Object?> json) =>
      _$MatchPlayerHandFromJson(json);
}
