enum HostToPlayerHandler {
  newGameState,
}

enum PlayerToHostHandler {
  introduce,
  addToTreasury,
}

class HostToPlayer {
  HostToPlayerHandler handler;
  Map<String, dynamic>? newGameState;

  HostToPlayer({
    required this.handler,
    this.newGameState,
  });

  factory HostToPlayer.fromMap(Map<String, dynamic> map) {
    return HostToPlayer(
      handler: HostToPlayerHandler.values[map['handler']],
      newGameState: map['new_game_state'],
    );
  }

  Map<String, dynamic> toMap() {
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

  factory PlayerToHost.fromMap(Map<String, dynamic> map) {
    print(map);
    return PlayerToHost(
      handler: PlayerToHostHandler.values[map['handler']],
      name: map['name'],
      addToTreasury: map['add_to_treasury'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'handler': handler.index,
      'name': name,
      'add_to_treasury': addToTreasury,
    };
  }
}
