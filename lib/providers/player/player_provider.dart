import 'package:flutter/material.dart';

abstract class PlayerProvider with ChangeNotifier {
  late String name;
  late Map<dynamic, dynamic> gameState;

  Future start();

  nextExchangeSet();

  handleAddToTreasury(int x);
  handleStartExchange();
  handleConfirmExchange();
}
