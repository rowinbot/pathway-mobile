import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_config.freezed.dart';
part 'match_config.g.dart';

@freezed
class MatchConfig with _$MatchConfig {
  const factory MatchConfig({
    required int turnTimeLimitSeconds,
    required int maxPlayers,
    required bool enableHints,
    required bool enableRematch,
  }) = _MatchConfig;

  factory MatchConfig.fromJson(Map<String, Object?> json) =>
      _$MatchConfigFromJson(json);
}
