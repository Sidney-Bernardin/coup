import 'package:flutter/material.dart';

abstract class PlayerProvider with ChangeNotifier {
  late String name;
  late Map<dynamic, dynamic> gameState;

  Future start(String ip, int port);

  nextExchangeSet();

  handleAddToTreasury(String name, int x);
  handleStartExchange();
  handleConfirmExchange();
}
