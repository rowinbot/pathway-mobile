import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/game/started/game_board.dart';
import 'package:pathway_mobile/features/game/started/game_player_hand.dart';
import 'package:pathway_mobile/features/game/started/game_timer.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';
import 'package:pathway_mobile/models/match/match_config.dart';
import 'package:pathway_mobile/models/match/match_current_turn.dart';
import 'package:pathway_mobile/models/match/match_player.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

class GameStarted extends StatefulWidget {
  final List<List<MatchBoardCell>> boardState;
  final MatchCurrentTurn? matchCurrentTurn;
  final MatchPlayer? matchCurrentTurnPlayer;
  final MatchPlayer? currentMatchPlayer;
  final List<MatchPlayer> matchPlayers;
  final int? matchWinner;
  final MatchConfig? matchConfig;
  final MatchPlayerHand? playerHand;
  final CardObject? lastPlayedCard;
  final void Function(CardObject card, int row, int col) onPlayCard;

  const GameStarted({
    super.key,
    required this.boardState,
    required this.matchCurrentTurn,
    required this.matchCurrentTurnPlayer,
    required this.currentMatchPlayer,
    required this.matchPlayers,
    required this.matchWinner,
    required this.matchConfig,
    required this.playerHand,
    required this.lastPlayedCard,
    required this.onPlayCard,
  });

  @override
  State<GameStarted> createState() => _GameStarted();
}

class _GameStarted extends State<GameStarted> {
  bool showAllHints = false;
  CardObject? showHintsForCard;

  get isCurrentPlayerTurn {
    return widget.currentMatchPlayer?.id == widget.matchCurrentTurnPlayer?.id;
  }

  void onPlayCard(CardObject? card, int row, int col) {
    if (card == null) return;
    setState(() {
      showHintsForCard = null;
    });
    widget.onPlayCard(card, row, col);
  }

  void onShowHintsForCard(CardObject? card) {
    setState(() {
      showAllHints = false;
      showHintsForCard = card;
    });
  }

  void onToggleShowAllHints(bool value) {
    setState(() {
      showHintsForCard = null;
      showAllHints = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: InsetsTheme.of(context)
                .containers
                .margin(InsetScalar.extraSmall4),
          ),
          GameTimer(
            turnStartTime: widget.matchCurrentTurn?.turnStartTime ?? 0,
            turnTimeLimitSeconds:
                widget.matchConfig?.turnTimeLimitSeconds ?? 30,
            currentTurnPlayer: widget.matchCurrentTurnPlayer,
            isCurrentPlayerTurn: isCurrentPlayerTurn,
          ),
          SizedBox(
            height: InsetsTheme.of(context)
                .containers
                .margin(InsetScalar.extraSmall4),
          ),
          Container(
            color: (isCurrentPlayerTurn ? Colors.deepPurple : Colors.white)
                .withAlpha(60),
            padding: EdgeInsets.symmetric(
              vertical: InsetsTheme.of(context)
                  .containers
                  .padding(InsetScalar.extraSmall4),
            ),
            child: GameBoard(
              boardState: widget.boardState,
              playerHand: widget.playerHand,
              currentMatchPlayer: widget.currentMatchPlayer,
              showHintsForCard: showHintsForCard,
              showAllHints: showAllHints,
              onPlayCard: onPlayCard,
            ),
          ),
          if (widget.currentMatchPlayer != null && widget.playerHand != null)
            GamePlayerHand(
              playerTeam: widget.currentMatchPlayer!.team,
              playerHand: widget.playerHand!,
              lastPlayedCard: widget.lastPlayedCard,
              showHintsForCard: showHintsForCard,
              showAllHints: showAllHints,
              onShowHintsForCard: onShowHintsForCard,
              onToggleShowAllHints: onToggleShowAllHints,
            ),
          SizedBox(
            height: InsetsTheme.of(context)
                .containers
                .margin(InsetScalar.extraSmall4),
          ),
        ],
      ),
    );
  }
}
