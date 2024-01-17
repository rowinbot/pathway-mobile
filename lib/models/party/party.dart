import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathway_mobile/models/player/player.dart';

part 'party.freezed.dart';
part 'party.g.dart';

@freezed
class Party with _$Party {
  const factory Party({
    required String code,
    required String ownerPlayerId,
    /**
     * Active players in the party.
     *
     * This list gets reset after every game to the active players.
     * If the party doesn't have an active match (matches.last)
     * players that disconnect from the server will automatically
     * leave the party -> this list does not include historical players.
     *
     * To get historical players query matches and sum up the players
     * accounting for de-duping.
     */
    required List<Player> players,
    /**
     * Stack of matches in the party. You can check the active match
     * by querying the last match in the stack and checking if it hasn't ended.
     */
    required List<String> matchesCodes,
  }) = _Party;

  factory Party.fromJson(Map<String, Object?> json) => _$PartyFromJson(json);
}
