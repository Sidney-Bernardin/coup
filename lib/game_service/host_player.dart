import 'package:flutter/material.dart';

import 'player.dart' as player;
import 'influence.dart' as influence;
import '../repositories/ws_server.dart' as ws_server;
import '../repositories/ws_client.dart' as ws_client;

class HostPlayer extends ChangeNotifier implements player.Player {
  ws_server.Repository webSocketRepo = ws_server.Repository();

  String name;

  @override
  Map gameState = {
    'players': {},
    'treasury': 30,
    'court_deak': [],
  };

  HostPlayer(this.name) {
    for (final s in influence.Influence.values) {
      gameState['court_deak'].add(s);
      gameState['court_deak'].add(s);
      gameState['court_deak'].add(s);
    }
    shuffle();
    introduce(name);
    webSocketRepo.payloadStream.stream.listen(_processPayload);
  }

  start() async {
    await webSocketRepo.listen('0.0.0.0', 4040);
  }

  _processPayload(ws_client.OutboundPayload payload) {
    switch (payload.handler) {
      case 'introduce':
        introduce(payload.name);
        return;
      case 'add_to_treasury':
        addToTreasury(payload.addToTreasury);
        return;
      default:
        print("Handler '${payload.handler}' is not valid.");
    }
  }

  shuffle() {
    for (int i = 0; i < 10; i++) {
      gameState['court_deak'].shuffle();
    }
  }

  influence.Influence deal() {
    influence.Influence ret = gameState['court_deak'][0];
    gameState['court_deak'].removeAt(0);
    return ret;
  }

  updateAndBroadcastGameState() {
    notifyListeners();
    webSocketRepo.broadcast(ws_server.OutboundPayload(
      handler: 'new_game_state',
      newGameState: gameState,
    ));
  }

  introduce(String name) {
    gameState['players'][name] = {
      'a': deal(),
      'b': deal(),
    };
    updateAndBroadcastGameState();
  }

  @override
  addToTreasury(int x) {
    gameState['treasury'] += x;
    updateAndBroadcastGameState();
  }
}
