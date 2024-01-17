enum PartyJoinStatus {
  success,
  notFound,
  full,
  busy;

  static PartyJoinStatus fromString(String? value) {
    switch (value) {
      case "success":
        return PartyJoinStatus.success;
      case "party-not-found":
        return PartyJoinStatus.notFound;
      case "party-full":
        return PartyJoinStatus.full;
      case "party-busy":
        return PartyJoinStatus.busy;
      default:
        throw Exception("Invalid PartyJoinStatus value: $value");
    }
  }
}

class PartyJoinException implements Exception {
  final PartyJoinStatus status;
  const PartyJoinException(this.status);
}
