import 'dart:convert';
import 'dart:io';
import 'package:pathway_mobile/constants/api.dart';
import 'package:pathway_mobile/helpers/secure_storage.dart';
import 'package:pathway_mobile/models/player/player.dart';
import 'package:pathway_mobile/services/http_service.dart';

String _playerIdStorageKey = 'nickname';

class PlayerServiceRemote extends HTTPService {
  const PlayerServiceRemote() : super();
  Future<Player> getPlayer(String? playerId) async {
    var response = await get(
      '/player/info',
      headers: {playerIdHeader: playerId ?? ''},
    );

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Error getting player ID');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    var player = Player.fromJson(data);

    // Save the player ID to the secure storage
    if (playerId != player.id) {
      await secureStorage.write(key: _playerIdStorageKey, value: player.id);
    }

    return player;
  }

  Future<void> updatePlayerNickname(
    String playerId,
    String nickname,
  ) async {
    var response = await post(
      '/player/info',
      body: {'nickname': nickname},
      headers: {playerIdHeader: playerId},
    );

    if (response.statusCode == HttpStatus.ok) {
      throw const HttpException('Error updating player ID');
    }
  }
}
