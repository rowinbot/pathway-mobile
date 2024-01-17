import 'package:pathway_mobile/models/player/player.dart';
import 'package:pathway_mobile/services/player/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_global.g.dart';

PlayerService _playerService = const PlayerService();

@riverpod
class PlayerGlobal extends _$PlayerGlobal {
  @override
  Future<Player> build() async {
    var player = await _playerService.getPlayer();

    return player;
  }

  Future<void> updateNickname(String newNickname) async {
    await _playerService.updatePlayerNickname(newNickname);

    // Mark current state as invalid (so Riverpod calls `build` method agains)
    // and we get the new nickname directly from the API.
    ref.invalidateSelf();

    // This ensures "updateNickname" does not complete until the new state is available.
    await future;
  }
}
