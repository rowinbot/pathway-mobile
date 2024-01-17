import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_player.freezed.dart';
part 'match_player.g.dart';

@freezed
class MatchPlayer with _$MatchPlayer {
  const factory MatchPlayer({
    required String id,
    required String nickname,
    required int team,
    required bool isOwner,
    required bool isConnected,
  }) = _MatchPlayer;

  factory MatchPlayer.fromJson(Map<String, Object?> json) =>
      _$MatchPlayerFromJson(json);
}
