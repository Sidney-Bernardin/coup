import 'package:flutter/material.dart';

import '../../data/models.dart' as models;

import '../../repositories/ws_client/ws_client.dart' as ws_client;

import 'player_provider.dart' as player_provider;

class BasicProvider
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

  ws_client.WebSocketClient webSocketClient = ws_client.WebSocketClient();

  BasicProvider(this.name) {
    gameState['players'][name] = {'a': 0, 'b': 0, 'coins': 0};
  }

  @override
  start(String ip, int port) async {
    await webSocketClient.connect(ip, port);
    webSocketClient.payloadStream.stream.listen(_proccessPayload);
    webSocketClient.send(models.PlayerToHost(
      handler: models.PlayerToHostHandler.introduce,
      name: name,
    ).toMap());
  }

  _proccessPayload(Map payload) {
    models.HostToPlayer m = models.HostToPlayer.fromMap(payload);

    switch (m.handler) {
      case models.HostToPlayerHandler.newGameState:
        gameState = m.newGameState!;
        notifyListeners();
    }
  }

  @override
  nextExchangeSet() {}

  @override
  handleAddToTreasury(String name, int x) {
    webSocketClient.send(models.PlayerToHost(
      handler: models.PlayerToHostHandler.addToTreasury,
      name: name,
      addToTreasury: x,
    ).toMap());
  }

  @override
  handleStartExchange() {}

  @override
  handleConfirmExchange() {}
}
