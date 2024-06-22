import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';
import 'package:uuid/uuid.dart';

part 'card_object.freezed.dart';
part 'card_object.g.dart';

@freezed
class CardObject with _$CardObject {
  const factory CardObject({
    /// The team who owns this cell, or null if it is unowned.
    required String id,
    required String uid,
    required String kind, // spades, clovers, hearts, diamonds
    required String number, // 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, DJ, Q, K
    required String color, // black, red
  }) = _CardObject;

  factory CardObject.fromJson(Map<String, Object?> json) =>
      _$CardObjectFromJson(json);
}

abstract class CardKind {
  static const String spades = 'spades';
  static const String clover = 'clover';
  static const String hearts = 'hearts';
  static const String diamonds = 'diamonds';
}

abstract class CardNumber {
  static const String two = '2';
  static const String three = '3';
  static const String four = '4';
  static const String five = '5';
  static const String six = '6';
  static const String seven = '7';
  static const String eight = '8';
  static const String nine = '9';
  static const String ten = '10';
  static const String ace = 'A';
  static const String jack = 'J';
  static const String doubleJack = 'DJ';
  static const String queen = 'Q';
  static const String king = 'K';
}

const _uuid = Uuid();

String cardId(String kind, String number) => '$kind-$number';

CardObject? getCardAtPos(int row, int col) {
  final cardAtPos = staticBoardRows[row][col];
  final isEmptyCard = cardAtPos == null;

  // Ignore movements to blank cards - blank corners
  if (isEmptyCard) return null;

  return cardAtPos;
}

// export function getMatchingHandCardIndexToPositionInBoard(
//   boardState: BoardState,
//   playerTeam: TeamI,
//   playerHand: MatchPlayerHand | null,
//   row: number,
//   col: number,
//   ignoreJacks = false
// ): number | null {
//   if (!playerHand) return null;

//   const cardAtPos = getCardAtPos(row, col);
//   if (!cardAtPos) return null;

//   const compatibleCardsIndexes = getMatchingPlayerHandCardIndexForCard(
//     playerHand,
//     cardAtPos
//   );

//   if (compatibleCardsIndexes.length === 0) return null;

//   // Jacks have less priority (< direct card match) for placement, so we want to check entire hand before placing a jack.
//   let compatibleJackI: number | null = null;

//   for (const i of compatibleCardsIndexes) {
//     const playerCard = playerHand.cards[i];

//     const matchesCardAtPos = testHandCardToPositionInBoard(
//       boardState,
//       playerTeam,
//       playerCard,
//       row,
//       col
//     );

//     if (matchesCardAtPos) {
//       if (cardIsJack(playerCard)) {
//         if (ignoreJacks) continue;

//         compatibleJackI = i;
//       } else {
//         return i;
//       }
//     }
//   }

//   return compatibleJackI;
// }

bool testHandCardToPositionInBoard(
  List<List<MatchBoardCell>> boardState,
  int playerTeam,
  CardObject playerHandCard,
  int row,
  int col,
) {
  final cardAtPos = getCardAtPos(row, col);
  if (cardAtPos == null) return false;

  final positionState = boardState[row][col];
  final isPositionFree = positionState.team == null;
  final isPartOfASequence = positionState.isPartOfASequence;
  final isPositionOccupiedByPlayerTeam = positionState.team == playerTeam;

  // If player has a card that matches the position and the position is free, pick it.
  if (cardAtPos.id == playerHandCard.id && isPositionFree) {
    return true;
  }

  // Otherwise, store the index of any joker card that matches the position to return it later.
  // But we'll still continue to loop to check for a direct card match.
  else if (playerHandCard.number == CardNumber.doubleJack && isPositionFree) {
    return true;
  } else if (playerHandCard.number == CardNumber.jack &&
      !isPositionFree &&
      !isPartOfASequence &&
      !isPositionOccupiedByPlayerTeam) {
    return true;
  }

  return false;
}

// export function getMatchingPlayerHandCardIndexForCard(
//   playerHand: MatchPlayerHand,
//   matchingCard: Card
// ): number[] {
//   let compatibleCardsIndexes: number[] = [];

//   for (let i = 0; i < playerHand.cards.length; i++) {
//     const card = playerHand.cards[i];

//     if (card.id === matchingCard.id) {
//       compatibleCardsIndexes.push(i);
//     }

//     if (cardIsJack(card)) compatibleCardsIndexes.push(i);
//   }

//   return compatibleCardsIndexes;
// }

List<int> getMatchingPlayerHandCardIndexForCard(
  MatchPlayerHand playerHand,
  CardObject matchingCard,
) {
  final compatibleCardsIndexes = <int>[];

  for (var i = 0; i < playerHand.cards.length; i++) {
    final card = playerHand.cards[i];

    if (card.id == matchingCard.id) {
      compatibleCardsIndexes.add(i);
    }

    if (cardIsJack(card)) compatibleCardsIndexes.add(i);
  }

  return compatibleCardsIndexes;
}

int? getMatchingHandCardIndexToPositionInBoard(
  List<List<MatchBoardCell>> boardState,
  int playerTeam,
  MatchPlayerHand? playerHand,
  int row,
  int col,
  bool ignoreJacks,
) {
  if (playerHand == null) return null;

  final cardAtPos = getCardAtPos(row, col);
  if (cardAtPos == null) return null;

  final compatibleCardsIndexes = getMatchingPlayerHandCardIndexForCard(
    playerHand,
    cardAtPos,
  );

  if (compatibleCardsIndexes.isEmpty) return null;

  // Jacks have less priority (< direct card match) for placement, so we want to check entire hand before placing a jack.
  int? compatibleJackI;

  for (final i in compatibleCardsIndexes) {
    final playerCard = playerHand.cards[i];

    final matchesCardAtPos = testHandCardToPositionInBoard(
      boardState,
      playerTeam,
      playerCard,
      row,
      col,
    );

    if (matchesCardAtPos) {
      if (cardIsJack(playerCard)) {
        if (ignoreJacks) continue;

        compatibleJackI = i;
      } else {
        return i;
      }
    }
  }

  return compatibleJackI;
}

bool isNotAJack(CardObject card) {
  return (card.number != CardNumber.jack &&
      card.number != CardNumber.doubleJack);
}

bool cardIsJack(CardObject card) {
  return !isNotAJack(card);
}

List<List<CardObject?>> staticBoardRows = List<List<CardObject?>>.unmodifiable([
  List<CardObject?>.unmodifiable([
    null,
    _buildCard(CardKind.diamonds, CardNumber.six),
    _buildCard(CardKind.diamonds, CardNumber.seven),
    _buildCard(CardKind.diamonds, CardNumber.eight),
    _buildCard(CardKind.diamonds, CardNumber.nine),
    _buildCard(CardKind.diamonds, CardNumber.ten),
    _buildCard(CardKind.diamonds, CardNumber.queen),
    _buildCard(CardKind.diamonds, CardNumber.king),
    _buildCard(CardKind.diamonds, CardNumber.ace),
    null,
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.diamonds, CardNumber.five),
    _buildCard(CardKind.hearts, CardNumber.three),
    _buildCard(CardKind.hearts, CardNumber.two),
    _buildCard(CardKind.spades, CardNumber.two),
    _buildCard(CardKind.spades, CardNumber.three),
    _buildCard(CardKind.spades, CardNumber.four),
    _buildCard(CardKind.spades, CardNumber.five),
    _buildCard(CardKind.spades, CardNumber.six),
    _buildCard(CardKind.spades, CardNumber.seven),
    _buildCard(CardKind.clover, CardNumber.ace),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.diamonds, CardNumber.four),
    _buildCard(CardKind.hearts, CardNumber.four),
    _buildCard(CardKind.diamonds, CardNumber.queen),
    _buildCard(CardKind.diamonds, CardNumber.ace),
    _buildCard(CardKind.clover, CardNumber.ace),
    _buildCard(CardKind.clover, CardNumber.king),
    _buildCard(CardKind.clover, CardNumber.queen),
    _buildCard(CardKind.clover, CardNumber.ten),
    _buildCard(CardKind.spades, CardNumber.eight),
    _buildCard(CardKind.clover, CardNumber.king),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.diamonds, CardNumber.three),
    _buildCard(CardKind.hearts, CardNumber.five),
    _buildCard(CardKind.diamonds, CardNumber.queen),
    _buildCard(CardKind.hearts, CardNumber.queen),
    _buildCard(CardKind.hearts, CardNumber.ten),
    _buildCard(CardKind.hearts, CardNumber.nine),
    _buildCard(CardKind.hearts, CardNumber.eight),
    _buildCard(CardKind.clover, CardNumber.nine),
    _buildCard(CardKind.spades, CardNumber.nine),
    _buildCard(CardKind.clover, CardNumber.queen),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.diamonds, CardNumber.two),
    _buildCard(CardKind.hearts, CardNumber.six),
    _buildCard(CardKind.diamonds, CardNumber.ten),
    _buildCard(CardKind.hearts, CardNumber.king),
    _buildCard(CardKind.hearts, CardNumber.three),
    _buildCard(CardKind.hearts, CardNumber.two),
    _buildCard(CardKind.hearts, CardNumber.seven),
    _buildCard(CardKind.clover, CardNumber.eight),
    _buildCard(CardKind.spades, CardNumber.ten),
    _buildCard(CardKind.clover, CardNumber.ten),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.spades, CardNumber.ace),
    _buildCard(CardKind.hearts, CardNumber.seven),
    _buildCard(CardKind.diamonds, CardNumber.nine),
    _buildCard(CardKind.hearts, CardNumber.ace),
    _buildCard(CardKind.hearts, CardNumber.four),
    _buildCard(CardKind.hearts, CardNumber.five),
    _buildCard(CardKind.hearts, CardNumber.six),
    _buildCard(CardKind.clover, CardNumber.seven),
    _buildCard(CardKind.spades, CardNumber.queen),
    _buildCard(CardKind.clover, CardNumber.nine),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.spades, CardNumber.king),
    _buildCard(CardKind.hearts, CardNumber.eight),
    _buildCard(CardKind.diamonds, CardNumber.eight),
    _buildCard(CardKind.clover, CardNumber.two),
    _buildCard(CardKind.clover, CardNumber.three),
    _buildCard(CardKind.clover, CardNumber.four),
    _buildCard(CardKind.clover, CardNumber.five),
    _buildCard(CardKind.clover, CardNumber.six),
    _buildCard(CardKind.spades, CardNumber.king),
    _buildCard(CardKind.clover, CardNumber.eight),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.spades, CardNumber.queen),
    _buildCard(CardKind.hearts, CardNumber.nine),
    _buildCard(CardKind.diamonds, CardNumber.seven),
    _buildCard(CardKind.diamonds, CardNumber.six),
    _buildCard(CardKind.diamonds, CardNumber.five),
    _buildCard(CardKind.diamonds, CardNumber.four),
    _buildCard(CardKind.diamonds, CardNumber.three),
    _buildCard(CardKind.diamonds, CardNumber.two),
    _buildCard(CardKind.spades, CardNumber.ace),
    _buildCard(CardKind.clover, CardNumber.seven),
  ]),
  List<CardObject?>.unmodifiable([
    _buildCard(CardKind.spades, CardNumber.ten),
    _buildCard(CardKind.hearts, CardNumber.ten),
    _buildCard(CardKind.hearts, CardNumber.queen),
    _buildCard(CardKind.hearts, CardNumber.king),
    _buildCard(CardKind.hearts, CardNumber.ace),
    _buildCard(CardKind.clover, CardNumber.two),
    _buildCard(CardKind.clover, CardNumber.three),
    _buildCard(CardKind.clover, CardNumber.four),
    _buildCard(CardKind.clover, CardNumber.five),
    _buildCard(CardKind.clover, CardNumber.six),
  ]),
  List<CardObject?>.unmodifiable([
    null,
    _buildCard(CardKind.spades, CardNumber.nine),
    _buildCard(CardKind.spades, CardNumber.eight),
    _buildCard(CardKind.spades, CardNumber.seven),
    _buildCard(CardKind.spades, CardNumber.six),
    _buildCard(CardKind.spades, CardNumber.five),
    _buildCard(CardKind.spades, CardNumber.four),
    _buildCard(CardKind.spades, CardNumber.three),
    _buildCard(CardKind.spades, CardNumber.two),
    null,
  ]),
]);

CardObject _buildCard(String kind, String number) {
  return CardObject(
    id: cardId(kind, number),
    uid: _uuid.v4(),
    kind: kind,
    number: number,
    color: kind == CardKind.spades || kind == CardKind.clover ? 'black' : 'red',
  );
}
