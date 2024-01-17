import 'package:pathway_mobile/helpers/secure_storage.dart';
import 'package:pathway_mobile/models/player/player.dart';
import 'package:pathway_mobile/services/http_service.dart';
import 'package:pathway_mobile/services/player/player_service_remote.dart';

String _playerIdStorageKey = 'nickname';

class PlayerService extends HTTPService {
  final remote = const PlayerServiceRemote();

  const PlayerService() : super();

  Future<String?> getStoredPlayerId() async {
    String? existingPlayerId =
        await secureStorage.read(key: _playerIdStorageKey);
    return existingPlayerId;
  }

  Future<String> getRequiredStoredPlayerId() async {
    String? existingPlayerId = await getStoredPlayerId();
    if (existingPlayerId == null) {
      throw Exception('Player ID not found');
    }
    return existingPlayerId;
  }

  Future<Player> getPlayer() async {
    String? existingPlayerId = await getStoredPlayerId();
    return remote.getPlayer(existingPlayerId);
  }

  Future<void> updatePlayerNickname(
    String nickname,
  ) async {
    String existingPlayerId = await getRequiredStoredPlayerId();
    return remote.updatePlayerNickname(existingPlayerId, nickname);
  }
}
