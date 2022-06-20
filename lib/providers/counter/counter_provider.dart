import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int count = 0;

  reset() {
    count = 0;
    notifyListeners();
  }

  increment(int by) {
    count += by;
    notifyListeners();
  }

  decrement(int by) {
    count -= by;
    notifyListeners();
  }
}
