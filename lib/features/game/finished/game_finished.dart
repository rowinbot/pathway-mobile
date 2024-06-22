import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/game/finished/game_winner_banner.dart';

class GameFinished extends StatelessWidget {
  final int? matchWinner;
  const GameFinished({
    super.key,
    required this.matchWinner,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GameWinnerBanner(matchWinner: matchWinner),
      ],
    );
  }
}
