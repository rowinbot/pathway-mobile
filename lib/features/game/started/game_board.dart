import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/game/started/game_card.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';
import 'package:pathway_mobile/models/match/match_player.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';

class GameBoard extends StatelessWidget {
  final List<List<MatchBoardCell>> boardState;
  final MatchPlayerHand? playerHand;
  final MatchPlayer? currentMatchPlayer;
  final CardObject? showHintsForCard;
  final bool showAllHints;
  final void Function(CardObject? card, int row, int col) onPlayCard;

  const GameBoard({
    Key? key,
    required this.boardState,
    required this.playerHand,
    required this.currentMatchPlayer,
    required this.showHintsForCard,
    required this.showAllHints,
    required this.onPlayCard,
  }) : super(key: key);

  Widget buildRow(
    List<CardObject?> row, {
    required int rowI,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: row.asMap().entries.map((cardEntry) {
        var card = cardEntry.value;
        var colI = cardEntry.key;
        bool isDisabled = false;

        if (card == null) {
          return GameCard(
            card: null,
            row: rowI,
            col: colI,
            disabled: true,
            occupiedByTeam: null,
            isPartOfASequence: false,
            borderColor: null,
            onPlayCard: onPlayCard,
          );
        }

        if (currentMatchPlayer != null) {
          if (showAllHints) {
            isDisabled = getMatchingHandCardIndexToPositionInBoard(boardState,
                    currentMatchPlayer!.team, playerHand, rowI, colI, true) ==
                null;
          } else if (showHintsForCard != null) {
            isDisabled = testHandCardToPositionInBoard(boardState,
                    currentMatchPlayer!.team, showHintsForCard!, rowI, colI) ==
                false;
          }
        }

        return GameCard(
          card: card,
          row: rowI,
          col: colI,
          disabled: isDisabled,
          occupiedByTeam: boardState[rowI][colI].team,
          isPartOfASequence: boardState[rowI][colI].isPartOfASequence,
          borderColor: null,
          onPlayCard: onPlayCard,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: staticBoardRows
          .asMap()
          .entries
          .map((rowEntry) => buildRow(rowEntry.value, rowI: rowEntry.key))
          .toList(),
    );
  }
}
