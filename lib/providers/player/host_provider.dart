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

  int exchangeSetIndex = 0;
  List<List> exchangingOptions = [];

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

  @override
  nextExchangeSet() {
    if (exchangeSetIndex == 5) {
      exchangeSetIndex = 0;
    } else {
      exchangeSetIndex++;
    }

    gameState['players'][name]['a'] = exchangingOptions[exchangeSetIndex][0];
    gameState['players'][name]['b'] = exchangingOptions[exchangeSetIndex][1];

    notifyListeners();
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
  handleAddToTreasury(String name, int val) {
    gameState['treasury'] += val;
    if (val < 0) {
      gameState['players'][name]['coins'] += val.abs();
    } else {
      gameState['players'][name]['coins'] -= val;
    }
    update();
  }

  // handleAddPlayer adds a new player to the game state only if the player is new.
  handleAddPlayer(String name) {
    if (gameState['players'][name] == null) {
      gameState['players'][name] = {
        'coins': 2,
        'a': deal(),
        'b': deal(),
      };
    }
    update();
  }

  @override
  handleStartExchange() {
    int a = gameState['players'][name]['a'];
    int b = gameState['players'][name]['b'];
    int c = deal();
    int d = deal();

    exchangingOptions.add([a, b, c, d]);
    exchangingOptions.add([c, d, a, b]);
    exchangingOptions.add([a, c, b, d]);
    exchangingOptions.add([a, d, c, b]);
    exchangingOptions.add([b, c, d, a]);
    exchangingOptions.add([b, d, c, a]);

    nextExchangeSet();
  }

  @override
  handleConfirmExchange() {
    gameState['court_deak'].add(exchangingOptions[exchangeSetIndex][2]);
    gameState['court_deak'].add(exchangingOptions[exchangeSetIndex][3]);
    exchangeSetIndex = 0;
    exchangingOptions = [];
    update();
  }
}
