import 'package:flutter/material.dart';
import 'package:pathway_mobile/models/match/match_player.dart';

class PlayerEntranceRow extends StatelessWidget {
  final MatchPlayer player;
  final bool isCurrentPlayer;
  final bool currentPlayerIsOwner;
  final void Function(
    MatchPlayer matchPlayer,
    int direction,
  ) movePlayerToTeamInDirection;

  const PlayerEntranceRow({
    super.key,
    required this.player,
    required this.isCurrentPlayer,
    required this.currentPlayerIsOwner,
    required this.movePlayerToTeamInDirection,
  });

  void movePlayerToPreviousTeam() {
    movePlayerToTeamInDirection(player, -1);
  }

  void movePlayerToNextTeam() {
    movePlayerToTeamInDirection(player, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0).copyWith(top: 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (player.isOwner) const Text("🛡️"),
          switch (player.isConnected) {
            true => const Text("🟢"),
            false => const Text("🟡"),
          },
          const SizedBox(width: 10.0),
          Flexible(
            child: Text(
              player.nickname,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          if (currentPlayerIsOwner || isCurrentPlayer)
            IconButton(
              padding: const EdgeInsets.all(6.0),
              constraints: const BoxConstraints(),
              onPressed: movePlayerToPreviousTeam,
              icon: const Icon(Icons.arrow_drop_up),
            ),
          if (currentPlayerIsOwner || isCurrentPlayer)
            IconButton(
              padding: const EdgeInsets.all(6.0),
              constraints: const BoxConstraints(),
              onPressed: movePlayerToNextTeam,
              icon: const Icon(Icons.arrow_drop_down),
            ),
        ],
      ),
    );
  }
}
