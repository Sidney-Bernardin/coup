enum HostToPlayerHandler {
  newGameState,
}

enum PlayerToHostHandler {
  introduce,
  addToTreasury,
}

class HostToPlayer {
  HostToPlayerHandler handler;
  Map? newGameState;

  HostToPlayer({
    required this.handler,
    this.newGameState,
  });

  factory HostToPlayer.fromMap(Map map) {
    return HostToPlayer(
      handler: HostToPlayerHandler.values[map['handler']],
      newGameState: map['new_game_state'],
    );
  }

  Map toMap() {
    return {
      'handler': handler.index,
      'new_game_state': newGameState,
    };
  }
}

class PlayerToHost {
  PlayerToHostHandler handler;
  String? name;
  int? addToTreasury;

  PlayerToHost({
    required this.handler,
    this.name,
    this.addToTreasury,
  });

  factory PlayerToHost.fromMap(Map map) {
    return PlayerToHost(
      handler: PlayerToHostHandler.values[map['handler']],
      name: map['name'],
      addToTreasury: map['add_to_treasury'],
    );
  }

  Map toMap() {
    return {
      'handler': handler.index,
      'name': name,
      'add_to_treasury': addToTreasury,
    };
  }
}
