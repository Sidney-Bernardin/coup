import 'dart:convert';

import 'package:flutter/material.dart';

import 'player.dart' as player;
import 'influence.dart' as influence;
import 'models.dart' as models;
import '../repositories/ws_server.dart' as ws_server;

class HostPlayer extends ChangeNotifier implements player.Player {
  ws_server.Repository webSocketRepo = ws_server.Repository();

  @override
  String name;

  @override
  Map<String, dynamic> gameState = {
    'players': {},
    'treasury': 30,
    'court_deak': [],
  };

  HostPlayer(this.name) {
    for (final s in influence.Influence.values) {
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
    }
    shuffle();
    introduce(name);
    webSocketRepo.payloadStream.stream.listen(_processPayload);
  }

  @override
  Future start() async {
    webSocketRepo.listenAndServe();
  }

  _processPayload(Map<String, dynamic> payload) {
    //payload['handler'] = int.parse(payload['handler']);
    models.PlayerToHost model = models.PlayerToHost.fromMap(payload);

    switch (model.handler) {
      case models.PlayerToHostHandler.introduce:
        introduce(model.name);
        break;
      case models.PlayerToHostHandler.addToTreasury:
        addToTreasury(model.addToTreasury);
        break;
      default:
        print("Handler '${payload['handler']}' is not valid.");
    }

    print("handled ${payload['handler']}");
    print(gameState);
  }

  shuffle() {
    for (int i = 0; i < 10; i++) {
      gameState['court_deak'].shuffle();
    }
  }

  influence.Influence deal() {
    influence.Influence ret =
        influence.Influence.values[gameState['court_deak'][0]];
    gameState['court_deak'].removeAt(0);
    return ret;
  }

  updateAndBroadcastGameState() {
    notifyListeners();

    webSocketRepo.broadcast(models.HostToPlayer(
      handler: models.HostToPlayerHandler.newGameState,
      newGameState: gameState,
    ).toMap());
  }

  introduce(String? name) {
    gameState['players'][name] = {
      'a': deal().index,
      'b': deal().index,
    };
    updateAndBroadcastGameState();
  }

  @override
  addToTreasury(int? x) {
    gameState['treasury'] += x;
    updateAndBroadcastGameState();
  }
}
