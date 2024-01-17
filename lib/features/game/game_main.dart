import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathway_mobile/features/game/entrance/game_entrance.dart';
import 'package:pathway_mobile/features/game/started/game_started.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';
import 'package:pathway_mobile/models/match/match_config.dart';
import 'package:pathway_mobile/models/match/match_current_turn.dart';
import 'package:pathway_mobile/models/match/match_player.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';
import 'package:pathway_mobile/models/match/match_player_movement.dart';
import 'package:pathway_mobile/models/match/sequence_bounds.dart';
import 'package:pathway_mobile/models/party/party.dart';
import 'package:pathway_mobile/models/player/player.dart';
import 'package:pathway_mobile/providers/player_global.dart';
import 'package:pathway_mobile/services/game/game_service.dart';
import 'package:pathway_mobile/services/game/game_utils.dart';
import 'package:pathway_mobile/services/party/party_utils.dart';

class GameMain extends ConsumerStatefulWidget {
  final Party party;
  const GameMain({Key? key, required this.party}) : super(key: key);

  @override
  ConsumerState<GameMain> createState() => _GameMainState();
}

class _GameMainState extends ConsumerState<GameMain> {
  GameService gameService = GameService();

  final List<List<MatchBoardCell>> boardState = buildBoard();
  final PartyJoinStatus? joinStatus = null;

  Player? currentPlayer;
  List<MatchPlayer> matchPlayers = [];
  int? matchWinner;
  bool matchStarted = false;
  MatchCurrentTurn? matchCurrentTurn;
  MatchConfig? matchConfig;
  MatchPlayerHand? playerHand;
  CardObject? lastPlayedCard;

  MatchPlayer? get currentMatchPlayer {
    if (matchPlayers.isEmpty) return null;
    return matchPlayers.firstWhere((player) => player.id == currentPlayer?.id);
  }

  MatchPlayer? get matchCurrentTurnPlayer {
    if (matchPlayers.isEmpty || matchCurrentTurn == null) return null;
    return matchPlayers
        .firstWhere((player) => player.id == matchCurrentTurn?.turnPlayerId);
  }

  @override
  void initState() {
    super.initState();

    ref.listenManual(playerGlobalProvider, (prev, next) {
      // Ignore if no real change to nickname
      if (prev?.value?.nickname == next.value?.nickname) return;

      next.whenData((player) {
        setState(() {
          currentPlayer = player;
        });
      });
    }, fireImmediately: true);

    gameService.connect(
      widget.party.code,
      LiveGameEventHandlers(
        onConnect: onConnect,
        onDisconnect: onDisconnect,
        onPartyJoin: onPartyJoin,
        onPartyState: onPartyState,
        onPartyConfigUpdated: onPartyConfigUpdated,
        onPartyPlayersUpdated: onPartyPlayersUpdated,
        onPlayerMovement: onPlayerMovement,
        onTurnTimeout: onTurnTimeout,
        onPartyNewMatch: onPartyNewMatch,
        onPartyFinished: onPartyFinished,
        onMatchFinished: onMatchFinished,
      ),
    );
  }

  @override
  void dispose() {
    gameService.dispose();
    super.dispose();
  }

  void onConnect() {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Connected to game"),
      ),
    );
  }

  void onDisconnect() {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Disconnected from game"),
      ),
    );

    Navigator.of(context).pop();
  }

  void onPartyJoin(PartyJoinStatus partyJoinStatus) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(partyJoinStatus.toString()),
      ),
    );
  }

  void onPartyState(
    List<List<MatchBoardCell>> currentBoardState,
    MatchPlayerHand currentMatchPlayerHand,
    MatchCurrentTurn currentMatchCurrentTurn,
    int? matchWinner,
  ) {
    setState(() {
      // If we get the board, match already started
      boardState.clear();
      boardState.addAll(currentBoardState);
      playerHand = currentMatchPlayerHand;
      matchCurrentTurn = currentMatchCurrentTurn;
      matchWinner = matchWinner;
      matchStarted = true;
    });
  }

  void onPartyConfigUpdated(MatchConfig matchConfig) {
    setState(() {
      matchConfig = matchConfig;
    });
  }

  void onPartyPlayersUpdated(List<MatchPlayer> newMatchPlayers) {
    setState(() {
      if (matchPlayers.isNotEmpty) {
        matchPlayers.clear();
      }
      matchPlayers.addAll(newMatchPlayers);
    });
  }

  void onPlayerMovement(
    MatchPlayerMovement movement,
    MatchCurrentTurn currentTurn,
  ) {
    setState(() {
      lastPlayedCard = movement.card;
      matchCurrentTurn = currentTurn;

      bool createdNewSequences = movement.newSequences.isNotEmpty;

      boardState[movement.row][movement.col] =
          boardState[movement.row][movement.col].copyWith(
        team: movement.card.number == CardNumber.jack ? null : movement.team,
        isPartOfASequence: createdNewSequences,
      );

      if (createdNewSequences) {
        updateBoardStateFromNewSequences(boardState, movement.newSequences);
      }
    });
  }

  void onTurnTimeout(MatchCurrentTurn nextTurn) {
    setState(() {
      matchCurrentTurn = nextTurn;
    });
  }

  void onPartyNewMatch(String newMatchMode) {
    setState(() {
      // Every other match mode needs to go to the config screen
      // therefore we set match to un-started.
      if (newMatchMode != PartyMatchMode.fastRematch) {
        matchStarted = false;
      }

      matchWinner = null;
    });
  }

  void onPartyFinished() {}
  void onMatchFinished(int? winner) {}

  void startGame() async {
    var didNotStartReason = await gameService.startGame();

    if (didNotStartReason != null) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(didNotStartReason),
        ),
      );
    }
  }

  void setPlayerToTeam(String playerId, int team) {
    gameService.setPlayerToTeam(playerId, team);
  }

  void onPlayCard(CardObject cardAtPos, int row, int col) async {
    var (card, nextCard) =
        await gameService.doMovement(currentPlayer!.id, row, col);

    if (nextCard != null && card != null) {
      setState(() {
        lastPlayedCard = cardAtPos;
        playerHand = MatchPlayerHand(
          cards: playerHand!.cards.where((c) => c.id != card.id).toList()
            ..add(nextCard),
        );
        boardState[row][col] = boardState[row][col].copyWith(
            team: card.number == CardNumber.jack
                ? null
                : currentMatchPlayer!.team);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: switch (matchStarted) {
        true => GameStarted(
            boardState: boardState,
            matchCurrentTurn: matchCurrentTurn,
            matchCurrentTurnPlayer: matchCurrentTurnPlayer,
            currentMatchPlayer: currentMatchPlayer,
            matchPlayers: matchPlayers,
            matchWinner: matchWinner,
            matchConfig: matchConfig,
            playerHand: playerHand,
            lastPlayedCard: lastPlayedCard,
            onPlayCard: onPlayCard,
          ),
        false => GameEntrance(
            currentMatchPlayer: currentMatchPlayer,
            matchPlayers: matchPlayers,
            startGame: startGame,
            setPlayerToTeam: setPlayerToTeam,
          )
      },
    );
  }
}
