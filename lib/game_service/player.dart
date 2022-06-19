import 'package:flutter/material.dart';

abstract class Player extends ChangeNotifier {
  late String name;
  late Map<String, dynamic> gameState;
  Future start();
  addToTreasury(int x);
}
