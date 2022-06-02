import 'package:flutter/material.dart';

import 'player.dart' as player;
import '../repositories/ws_server.dart' as ws_server;
import '../repositories/ws_client.dart' as ws_client;

class HostPlayer extends ChangeNotifier implements player.Player {
  ws_server.Repository webSocketRepo = ws_server.Repository();

  @override
  Map gameState = {
    'treasury': 30,
  };

  HostPlayer() {
    webSocketRepo.payloadStream.stream.listen(_processPayload);
  }

  start() async {
    await webSocketRepo.listen('0.0.0.0', 4040);
  }

  void _processPayload(ws_client.OutboundPayload payload) {
    switch (payload.handler) {
      case 'add_to_treasury':
        addToTreasury(payload.addToTreasury);
    }
  }

  @override
  addToTreasury(int x) {
    gameState['treasury'] += x;
    notifyListeners();
    webSocketRepo.broadcast(ws_server.OutboundPayload(
      handler: 'new_game_state',
      newGameState: gameState,
    ));
  }
}
