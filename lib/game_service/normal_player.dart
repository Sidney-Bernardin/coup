import 'package:flutter/material.dart';

import 'player.dart' as player;
import 'influence.dart' as influence;
import '../repositories/ws_server.dart' as ws_server;
import '../repositories/ws_client.dart' as ws_client;

class NormalPlayer extends ChangeNotifier implements player.Player {
  ws_client.Repository webSocketRepo = ws_client.Repository();

  @override
  String name;

  @override
  Map gameState = {
    'players': {},
    'treasury': 0,
    'court_deak': [],
  };

  NormalPlayer(this.name) {
    gameState['players'][name] = {
      'a': influence.Influence.duke,
      'b': influence.Influence.duke,
    };
    webSocketRepo.payloadStream.stream.listen(_processPayload);
  }

  @override
  start() async {
    await webSocketRepo.connect('0.0.0.0', 4040);
    webSocketRepo.send(ws_client.OutboundPayload(
      name: name,
      handler: 'introduce',
    ));
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
