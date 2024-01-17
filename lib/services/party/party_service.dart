import 'dart:convert';
import 'dart:io';
import 'package:pathway_mobile/constants/api.dart';
import 'package:pathway_mobile/models/party/party.dart';
import 'package:pathway_mobile/services/http_service.dart';
import 'package:pathway_mobile/services/party/party_utils.dart';
import 'package:pathway_mobile/services/player/player_service.dart';

class PartyService extends HTTPService {
  final playerService = const PlayerService();

  const PartyService() : super();

  Future<Party> createOrJoinParty(String? partyCode) {
    if (partyCode == null) {
      return createParty();
    } else {
      return joinParty(partyCode);
    }
  }

  Future<Party> createParty() async {
    String existingPlayerId = await playerService.getRequiredStoredPlayerId();

    var response = await put(
      '/party/create',
      headers: {playerIdHeader: existingPlayerId},
    );

    if (response.statusCode != HttpStatus.created) {
      throw const HttpException('Error creating party');
    }

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return Party.fromJson(data);
  }

  Future<Party> joinParty(String partyCode) async {
    String existingPlayerId = await playerService.getRequiredStoredPlayerId();

    var response = await post(
      '/party/join/$partyCode',
      headers: {playerIdHeader: existingPlayerId},
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;
    final joinStatus = PartyJoinStatus.fromString(data["partyJoinStatus"]);

    if (joinStatus != PartyJoinStatus.success) {
      throw PartyJoinException(joinStatus);
    }

    if (response.statusCode != HttpStatus.ok) {
      throw const HttpException('Error joining party');
    }

    return Party.fromJson(data["party"] ?? data["match"]);
  }
}
