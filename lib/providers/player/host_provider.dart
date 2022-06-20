import 'dart:convert';

import 'package:flutter/material.dart';

import '../../data/influence.dart' as influence;
import '../../data/models.dart' as models;

import '../../repositories/ws_server/ws_server.dart' as ws_server;

import 'player_provider.dart' as player_provider;

class HostProvider
    with ChangeNotifier
    implements player_provider.PlayerProvider {
  @override
  String name;

  @override
  Map gameState = {
    'players': {},
    'treasury': 100,
    'court_deak': [],
  };

  // webSocketServer is a repository for handling WebSocket connections.
  ws_server.WebSocketServer webSocketServer = ws_server.WebSocketServer();

  HostProvider(this.name) {
    // Initalize the deak with three a every influence card.
    for (final s in influence.Influence.values) {
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
    }

    // Shuffle the deak.
    shuffle();

    // Add the host to it self.
    handleAddPlayer(name);
  }

  @override
  start() async {
    // Start a WebSocket server.
    webSocketServer.listenAndServe();
  }

  // Shuffles the deak.
  shuffle() {
    for (int i = 0; i < 10; i++) {
      gameState['court_deak'].shuffle();
    }
  }

  // deal takes a random influence card from the deak.
  int deal() {
    int ret = gameState['court_deak'][0];
    gameState['court_deak'].removeAt(0);
    return ret;
  }

  // update broadcasts the game state to the other players.
  update() {
    notifyListeners();
    webSocketServer.broadcast(models.HostToPlayer(
      handler: models.HostToPlayerHandler.newGameState,
      newGameState: gameState,
    ).toMap());
  }

  // handleAddToTreasury increments the treasury by the given amount.
  @override
  handleAddToTreasury(int val) {
    gameState['treasury'] += val;
    update();
  }

  // handleAddPlayer adds a new player to the game state only if the player is new.
  handleAddPlayer(String name) {
    if (gameState['players'][name] == null) {
      gameState['players'][name] = {
        'a': deal(),
        'b': deal(),
      };
    }
    update();
  }
}
