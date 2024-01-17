import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_current_turn.freezed.dart';
part 'match_current_turn.g.dart';

@freezed
class MatchCurrentTurn with _$MatchCurrentTurn {
  const factory MatchCurrentTurn({
    required int turnStartTime,
    required String turnPlayerId,
  }) = _MatchCurrentTurn;

  factory MatchCurrentTurn.fromJson(Map<String, Object?> json) =>
      _$MatchCurrentTurnFromJson(json);
}
