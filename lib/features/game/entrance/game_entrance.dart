import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/game/entrance/player_entrance_row.dart';
import 'package:pathway_mobile/models/match/match_player.dart';
import 'package:pathway_mobile/services/game/game_utils.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

class GameEntrance extends StatelessWidget {
  final MatchPlayer? currentMatchPlayer;
  final List<MatchPlayer> matchPlayers;
  final void Function() startGame;
  final void Function(String playerId, int team) setPlayerToTeam;

  const GameEntrance({
    Key? key,
    required this.currentMatchPlayer,
    required this.matchPlayers,
    required this.startGame,
    required this.setPlayerToTeam,
  }) : super(key: key);

  Map<int, List<MatchPlayer>> get matchTeams {
    Map<int, List<MatchPlayer>> teams = {0: [], 1: [], 2: []};

    for (var i = 0; i < matchPlayers.length; i++) {
      final player = matchPlayers[i];

      if (teams[player.team] == null) {
        teams[player.team] = [];
      }

      teams[player.team]!.add(player);
    }

    return teams;
  }

  get isOwner {
    return currentMatchPlayer?.isOwner ?? false;
  }

  void movePlayerToTeamIndirection(MatchPlayer player, int direction) {
    var currentTeam = player.team;
    var nextTeam = (currentTeam + direction) % matchTeams.length;

    setPlayerToTeam(player.id, nextTeam);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Game Entrance'),
        Wrap(
          spacing: 20.0,
          runSpacing: 20.0,
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...matchTeams.entries.map(
              (mapEntry) {
                return Container(
                  constraints: const BoxConstraints(
                    minWidth: 300.0,
                    minHeight: 60.0,
                  ),
                  key: Key('team-${mapEntry.key}'),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: PartyTeamColors.of(mapEntry.key),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        margin: mapEntry.value.isEmpty
                            ? null
                            : const EdgeInsets.only(bottom: 10.0),
                        padding: EdgeInsets.all(
                          InsetsTheme.of(context)
                              .containers
                              .padding(InsetScalar.extraSmall4),
                        ),
                        child: Text(
                          'Team ${mapEntry.key}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      ...mapEntry.value
                          .map(
                            (player) => PlayerEntranceRow(
                              key: Key('team-${player.nickname}'),
                              player: player,
                              isCurrentPlayer:
                                  currentMatchPlayer?.id == player.id,
                              currentPlayerIsOwner: isOwner,
                              movePlayerToTeamInDirection:
                                  movePlayerToTeamIndirection,
                            ),
                          )
                          .toList()
                    ],
                  ),
                );
              },
            ).toList(),
          ],
        ),
        if (isOwner)
          TextButton(
            onPressed: startGame,
            child: const Text('Start Game'),
          ),
      ],
    );
  }
}
