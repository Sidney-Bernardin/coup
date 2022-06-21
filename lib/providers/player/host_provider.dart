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

  ws_server.WebSocketServer webSocketServer = ws_server.WebSocketServer();

  HostProvider(this.name) {
    for (final s in influence.Influence.values) {
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
      gameState['court_deak'].add(s.index);
    }

    shuffle();

    handleAddPlayer(name);
  }

  @override
  start() async {
    webSocketServer.listenAndServe();
  }

  @override
  nextExchangeSet() {
    exchangeSetIndex == 5 ? exchangeSetIndex = 0 : exchangeSetIndex++;
    gameState['players'][name]['a'] = exchangingOptions[exchangeSetIndex][0];
    gameState['players'][name]['b'] = exchangingOptions[exchangeSetIndex][1];
    notifyListeners();
  }

  shuffle() {
    for (int i = 0; i < 10; i++) {
      gameState['court_deak'].shuffle();
    }
  }

  int deal() {
    int ret = gameState['court_deak'][0];
    gameState['court_deak'].removeAt(0);
    return ret;
  }

  update() {
    notifyListeners();
    webSocketServer.broadcast(models.HostToPlayer(
      handler: models.HostToPlayerHandler.newGameState,
      newGameState: gameState,
    ).toMap());
  }

  @override
  handleAddToTreasury(String name, int val) {
    gameState['treasury'] += val;

    val < 0
        ? gameState['players'][name]['coins'] += val.abs()
        : gameState['players'][name]['coins'] -= val;

    update();
  }

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

    exchangingOptions = [
      [a, b, c, d],
      [c, d, a, b],
      [a, c, b, d],
      [a, d, c, b],
      [b, c, d, a],
      [b, d, c, a],
    ];

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
