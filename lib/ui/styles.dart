import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle glass = TextStyle(
    color: Colors.grey.shade200,
    fontSize: 20,
    fontFamily: 'SecularOne',
  );

  static TextStyle pot = TextStyle(
    color: Colors.yellow.shade500,
    fontSize: 25,
    fontFamily: 'SecularOne',
  );
}

class ButtonStyles {
  static ButtonStyle glass = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      Colors.white.withOpacity(0.2),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: Colors.white10.withAlpha(80),
          width: 3,
          style: BorderStyle.solid,
        ),
      ),
    ),
  );
}

class ContainerDecorations {
  static BoxDecoration glass = BoxDecoration(
    border: Border.all(width: 3, color: Colors.white10.withAlpha(80)),
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
      BoxShadow(
        color: Colors.white.withAlpha(100),
        blurRadius: 10.0,
        spreadRadius: 0.0,
      ),
    ],
    color: Colors.white.withOpacity(0.2),
  );
}
