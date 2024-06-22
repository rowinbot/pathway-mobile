import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathway_mobile/features/game/started/card_content/clover_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/diamond_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/double_jack_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/empty_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/heart_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/jack_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/king_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/queen_card_content.dart';
import 'package:pathway_mobile/features/game/started/card_content/spades_card_content.dart';
import 'package:pathway_mobile/features/game/started/game_card_container.dart';
import 'package:pathway_mobile/models/match/card_object.dart';

class GameCard extends StatelessWidget {
  static const redKindColor = Colors.red;
  static const blackKindColor = MaterialColor(0x000000, {
    50: Colors.black,
    100: Colors.black,
    200: Colors.black,
    300: Colors.black,
    400: Colors.black,
    500: Colors.black,
    600: Colors.black,
    700: Colors.black,
    800: Colors.black,
    900: Colors.black,
  });

  final CardObject card;
  final int row;
  final int col;
  final bool disabled;
  final int? occupiedByTeam;
  final bool isPartOfASequence;
  final void Function(CardObject? cardObject, int row, int col) onPlayCard;

  const GameCard({
    super.key,
    required this.card,
    required this.row,
    required this.col,
    required this.disabled,
    required this.occupiedByTeam,
    required this.isPartOfASequence,
    required this.onPlayCard,
  });

  void onTap() {
    if (disabled) {
      return;
    }

    onPlayCard(card, row, col);
  }

  double get cardKindOpacity => disabled ? 0.25 : 1;

  MaterialColor get cardColor {
    if (card.color == "red") {
      return redKindColor;
    }

    return blackKindColor;
  }

  Widget buildCardSymbol(BuildContext context) {
    return switch (card.kind) {
      CardKind.clover =>
        CloverCardContent(color: cardColor, opacity: cardKindOpacity),
      CardKind.diamonds =>
        DiamondCardContent(color: cardColor, opacity: cardKindOpacity),
      CardKind.hearts =>
        HeartCardContent(color: cardColor, opacity: cardKindOpacity),
      CardKind.spades =>
        SpadesCardContent(color: cardColor, opacity: cardKindOpacity),
      (_) => throw Exception('Invalid card kind'),
    };
  }

  @override
  Widget build(BuildContext context) {
    return GameCardContainer(
      disabled: disabled,
      highlightBorder: isPartOfASequence,
      onTap: onTap,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 2.0, top: 1.0),
          alignment: Alignment.topLeft,
          child: Text(
            card.number,
            style: TextStyle(
              fontFamily: GoogleFonts.notoSansMono().fontFamily,
              fontSize: 12,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: switch (occupiedByTeam) {
            0 => const Text('🔴', style: TextStyle(fontSize: 22)),
            1 => const Text('🔵', style: TextStyle(fontSize: 22)),
            2 => const Text('🟢', style: TextStyle(fontSize: 22)),
            (_) => switch (card.number) {
                CardNumber.jack =>
                  JackCardContent(color: cardColor, opacity: cardKindOpacity),
                CardNumber.doubleJack => DoubleJackCardContent(
                    color: cardColor, opacity: cardKindOpacity),
                CardNumber.queen =>
                  QueenCardContent(color: cardColor, opacity: cardKindOpacity),
                CardNumber.king =>
                  KingCardContent(color: cardColor, opacity: cardKindOpacity),
                (_) => buildCardSymbol(context),
              },
          },
        ),
      ],
    );
  }
}

class GameCardEmpty extends StatelessWidget {
  final bool disabled;
  final void Function()? onTap;

  const GameCardEmpty({
    super.key,
    this.disabled = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GameCardContainer(
      disabled: true,
      highlightBorder: false,
      onTap: onTap,
      children: const [
        Align(
          alignment: Alignment.center,
          child: EmptyCardContent(),
        ),
      ],
    );
  }
}
