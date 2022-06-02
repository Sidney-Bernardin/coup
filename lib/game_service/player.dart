import 'package:flutter/material.dart';

abstract class Player extends ChangeNotifier {
  late Map gameState;
  addToTreasury(int x);
}
