import 'dart:convert';

import 'package:flutter/material.dart';

import '../../repositories/ws_client/ws_client.dart' as ws_client;

import 'player_provider.dart' as player_provider;

class BasicProvider
    with ChangeNotifier
    implements player_provider.PlayerProvider {
  @override
  String name;

  @override
  Map<dynamic, dynamic> gameState = {};

  ws_client.WebSocketClient webSocketClient = ws_client.WebSocketClient();

  BasicProvider(this.name) {}

  @override
  start() async {}

  @override
  addToTreasury(int x) {}
}
