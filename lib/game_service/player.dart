import 'package:flutter/material.dart';

abstract class Player extends ChangeNotifier {
  late String name;
  late Map gameState;
  start();
  addToTreasury(int x);
}
