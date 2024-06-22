import 'package:flutter/material.dart';
import 'package:pathway_mobile/features/game/started/card_content/empty_card_content.dart';
import 'package:pathway_mobile/features/game/started/game_card.dart';
import 'package:pathway_mobile/features/game/started/game_card_container.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';
import 'package:pathway_mobile/theme/insets_theme.dart';

class GamePlayerHand extends StatelessWidget {
  final int playerTeam;
  final MatchPlayerHand playerHand;
  final CardObject? lastPlayedCard;
  final CardObject? showHintsForCard;
  final bool showAllHints;
  final void Function(CardObject? card) onShowHintsForCard;
  final void Function(bool show) onToggleShowAllHints;

  const GamePlayerHand({
    super.key,
    required this.playerTeam,
    required this.playerHand,
    required this.lastPlayedCard,
    required this.showHintsForCard,
    required this.showAllHints,
    required this.onShowHintsForCard,
    required this.onToggleShowAllHints,
  });

  void onPickHandCard(CardObject? card, int row, int col) {
    if (card == null) {
      return;
    }

    if (card.id == showHintsForCard?.id) {
      onShowHintsForCard(null);
    } else {
      onShowHintsForCard(card);
    }
  }

  void onClickShowAllHints() {
    onToggleShowAllHints(!showAllHints);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: InsetsTheme.of(context).containers.margin(InsetScalar.extraSmall3),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...playerHand.cards
                  .map(
                    (card) => GameCard(
                      card: card,
                      row: 0,
                      col: 0,
                      disabled: false,
                      occupiedByTeam: null,
                      isPartOfASequence: false,
                      onPlayCard: onPickHandCard,
                    ),
                  )
                  .toList(),
              GameCardContainer(
                disabled: false,
                highlightBorder: false,
                onTap: onClickShowAllHints,
                children: const [
                  Align(
                    alignment: Alignment.center,
                    child: EmptyCardContent(),
                  ),
                ],
              ),
              if (lastPlayedCard != null)
                GameCard(
                  card: lastPlayedCard!,
                  row: 0,
                  col: 0,
                  disabled: true,
                  occupiedByTeam: null,
                  isPartOfASequence: false,
                  onPlayCard: (a, b, c) => (),
                )
            ],
          )
        ],
      ),
    );
  }
}
