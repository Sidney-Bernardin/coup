import 'package:flutter/material.dart';

import 'player.dart' as player;
import '../repositories/ws_server.dart' as ws_server;
import '../repositories/ws_client.dart' as ws_client;

class NormalPlayer extends ChangeNotifier implements player.Player {
  String name = '';
  ws_client.Repository webSocketRepo = ws_client.Repository();

  @override
  Map gameState = {};

  NormalPlayer(this.name) {
    webSocketRepo.payloadStream.stream.listen(_processPayload);
  }

  start() async {
    await webSocketRepo.connect('0.0.0.0', 4040);
  }

  void _processPayload(ws_server.OutboundPayload payload) {
    switch (payload.handler) {
      case "new_game_state":
        gameState = payload.newGameState;
        notifyListeners();
    }
  }

  @override
  void addToTreasury(int x) {
    webSocketRepo.send(ws_client.OutboundPayload(
      name: name,
      handler: 'add_to_treasury',
      addToTreasury: x,
    ));
  }
}
