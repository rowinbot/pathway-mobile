import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/sequence_bounds.dart';

part 'match_player_movement.freezed.dart';
part 'match_player_movement.g.dart';

@freezed
class MatchPlayerMovement with _$MatchPlayerMovement {
  const factory MatchPlayerMovement({
    required CardObject card,
    required int team,
    required int row,
    required int col,
    required List<SequenceBounds> newSequences,
  }) = _MatchPlayerMovement;

  factory MatchPlayerMovement.fromJson(Map<String, Object?> json) =>
      _$MatchPlayerMovementFromJson(json);
}
