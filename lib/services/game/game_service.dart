import 'dart:async';

import 'package:pathway_mobile/constants/api.dart';
import 'package:pathway_mobile/models/match/card_object.dart';
import 'package:pathway_mobile/models/match/match_board_cell.dart';
import 'package:pathway_mobile/models/match/match_config.dart';
import 'package:pathway_mobile/models/match/match_current_turn.dart';
import 'package:pathway_mobile/models/match/match_player.dart';
import 'package:pathway_mobile/models/match/match_player_hand.dart';
import 'package:pathway_mobile/models/match/match_player_movement.dart';
import 'package:pathway_mobile/services/http_service.dart';
import 'package:pathway_mobile/services/party/party_utils.dart';
import 'package:pathway_mobile/services/player/player_service.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/src/manager.dart' as IOManager;

class LiveGameEventHandlers {
  final void Function() onConnect;
  final void Function() onDisconnect;
  final void Function(PartyJoinStatus partyJoinStatus) onPartyJoin;
  final void Function(
    List<List<MatchBoardCell>> boardState,
    MatchPlayerHand matchPlayerHand,
    MatchCurrentTurn matchCurrentTurn,
    int? matchWinner,
  ) onPartyState;
  final void Function(MatchConfig matchConfig) onPartyConfigUpdated;
  final void Function(List<MatchPlayer> matchPlayers) onPartyPlayersUpdated;
  final void Function(
    MatchPlayerMovement movement,
    MatchCurrentTurn currentTurn,
  ) onPlayerMovement;
  final void Function(MatchCurrentTurn nextTurn) onTurnTimeout;
  final void Function(String newMatchMode) onPartyNewMatch;
  final void Function() onPartyFinished;
  final void Function(int? winner) onMatchFinished;

  const LiveGameEventHandlers({
    required this.onConnect,
    required this.onDisconnect,
    required this.onPartyJoin,
    required this.onPartyState,
    required this.onPartyConfigUpdated,
    required this.onPartyPlayersUpdated,
    required this.onPlayerMovement,
    required this.onTurnTimeout,
    required this.onPartyNewMatch,
    required this.onPartyFinished,
    required this.onMatchFinished,
  });
}

enum ServerToClientEvent {
  /// Fired when a player joins a party.
  partyJoin("PARTY_JOIN"),

  /// Fired when re-joining a match.
  /// This event is fired after `PARTY_JOIN` (when successfully joined) if the latest match already started or when it starts.
  partyState("PARTY_STATE"),

  /// Fired when joining a party active match and when the match config is updated.
  partyConfigUpdated("PARTY_CONFIG_UPDATED"),

  /// Fires when 1. joined a match (started / not started), 2. when a player joins / leaves a match (not started).
  partyPlayersUpdated("PARTY_PLAYERS_UPDATED"),

  /// Fired when a player places a card on the board.
  ///
  /// Synchronizes the next turn with the client.
  playerMovement("PLAYER_MOVEMENT"),

  /// Fired when a player loses its turn (didn't place a card in time).
  /// This event is fired automatically by the server.
  ///
  /// Synchronizes the next turn with the client.
  turnTimeout("TURN_TIMEOUT"),

  /// Fired when a party owner creates/starts a new match.
  partyNewMatch("PARTY_NEW_MATCH"),

  /// Fires when the party owner finishes the party.
  partyFinished("PARTY_FINISHED"),

  /// Fires when the match finishes under any of the following conditions:
  /// 1. When a team wins the match.                                (winner === TeamI)
  /// 2. When no movements are left and the match is a draw.        (winner === null)
  /// 3. When the match is stale (no movements in $MAX_MATCH_TIME_SECONDS). (winner === null)
  matchFinished("MATCH_FINISHED");

  final String value;
  const ServerToClientEvent(this.value);
}

enum ClientToServerEvent {
  movement("MOVEMENT"),

  // Owner only 👇

  startGame("START_GAME"),
  movePlayerToTeam("MOVE_PLAYER_TO_TEAM"),

  /// Fired when (after a match ends) the **party** owner starts a new match.
  newMatch("NEW_MATCH");

  final String value;
  const ClientToServerEvent(this.value);
}

class GameService extends HTTPService {
  final playerService = const PlayerService();
  IO.Socket? socket;

  GameService() : super();

  void connect(String partyCode, LiveGameEventHandlers listeners) async {
    var playerId = await playerService.getRequiredStoredPlayerId();
    var socket = IO.io(
      apiWSUrl,
      IO.OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect()
          .setExtraHeaders({
            playerIdHeader: playerId,
            partyCodeHeader: partyCode,
          })
          .build(),
    );

    socket.on(
      ServerToClientEvent.partyJoin.value,
      (partyJoinStatus) {
        listeners.onPartyJoin(PartyJoinStatus.fromString(partyJoinStatus));
      },
    );

    socket.on(
      ServerToClientEvent.partyState.value,
      (value) {
        var values = value as List<dynamic>;
        var boardState = values[0] as List<dynamic>;
        var matchPlayerHand = values[1] as Map<String, dynamic>;
        var matchCurrentTurn = values[2] as Map<String, dynamic>;
        var matchWinner = values[3] as int?;

        listeners.onPartyState(
          boardState
              .map((e) => (e as List<dynamic>)
                  .map((e) => MatchBoardCell.fromJson(e))
                  .toList())
              .toList(),
          MatchPlayerHand.fromJson(matchPlayerHand),
          MatchCurrentTurn.fromJson(matchCurrentTurn),
          matchWinner,
        );
      },
    );

    socket.on(
      ServerToClientEvent.partyConfigUpdated.value,
      (value) {
        var matchConfig = value as Map<String, dynamic>;
        listeners.onPartyConfigUpdated(MatchConfig.fromJson(matchConfig));
      },
    );

    socket.on(
      ServerToClientEvent.partyPlayersUpdated.value,
      (value) {
        var matchPlayers = value as List<dynamic>;
        listeners.onPartyPlayersUpdated(
          matchPlayers.map((e) => MatchPlayer.fromJson(e)).toList(),
        );
      },
    );

    socket.on(
      ServerToClientEvent.playerMovement.value,
      (value) {
        var valueList = value as List<dynamic>;
        var movement = valueList[0] as Map<String, dynamic>;
        var currentTurn = valueList[1] as Map<String, dynamic>;

        listeners.onPlayerMovement(
          MatchPlayerMovement.fromJson(movement),
          MatchCurrentTurn.fromJson(currentTurn),
        );
      },
    );

    socket.on(
      ServerToClientEvent.turnTimeout.value,
      (value) {
        var nextTurn = value as Map<String, dynamic>;
        listeners.onTurnTimeout(MatchCurrentTurn.fromJson(nextTurn));
      },
    );

    socket.on(
      ServerToClientEvent.partyNewMatch.value,
      (value) {
        var newMatchMode = value as String;
        listeners.onPartyNewMatch(newMatchMode);
      },
    );

    socket.on(
      ServerToClientEvent.partyFinished.value,
      (event) {
        listeners.onPartyFinished();
      },
    );

    socket.on(
      ServerToClientEvent.matchFinished.value,
      (value) {
        var winner = value as int;
        listeners.onMatchFinished(winner);
      },
    );

    socket.on(
      "connect",
      (reason) => listeners.onConnect(),
    );

    socket.on(
      "disconnect",
      (reason) {
        dispose();
        listeners.onDisconnect();
      },
    );

    this.socket = socket;
    socket.connect();
  }

  Future<void> setPlayerToTeam(String playerId, int team) async {
    socket!.emit(ClientToServerEvent.movePlayerToTeam.value, [playerId, team]);
  }

  Future<(CardObject?, CardObject?)> doMovement(
      String playerId, int row, int col) {
    Completer<(CardObject?, CardObject?)> completer = Completer();
    var payload = {
      "playerId": playerId,
      "row": row,
      "col": col,
    };
    socket!.emitWithAck(
      ClientToServerEvent.movement.value,
      payload,
      ack: (value) {
        var valueMap = value as Map<String, dynamic>;
        var wasSuccessful = valueMap["success"] as bool;

        if (!wasSuccessful) {
          completer.complete((null, null));
        } else {
          var card = valueMap["card"] as Map<String, dynamic>;
          var nextCard = valueMap["nextCard"] as Map<String, dynamic>;

          completer.complete(
              (CardObject.fromJson(card), CardObject.fromJson(nextCard)));
        }
      },
    );

    return completer.future;
  }

  Future<String?> startGame() {
    Completer<String?> completer = Completer();
    var payload = null;
    socket!.emitWithAck(
      ClientToServerEvent.startGame.value,
      payload,
      ack: (value) {
        var list = value as List<dynamic>;

        var didStart = list[0];
        var reason = list[1];

        if (didStart == true) {
          completer.complete(null);
        } else {
          completer.complete(reason as String);
        }
      },
    );

    return completer.future;
  }

  void dispose() {
    /// Required for the socket to be correctly disposed.
    /// Otherwise the extraHeaders will not be properly cleared out.
    /// This of course implies that any other socket connection _could_ be affected
    /// but since we only have one socket connection at a time, this is fine.
    if (IO.cache.isNotEmpty) {
      var manager = IO.cache['$apiWSUrl:0'] as IOManager.Manager;
      manager.destroy(socket!);
      IO.cache.clear();
    }

    socket?.destroy();
    socket = null;
  }
}
