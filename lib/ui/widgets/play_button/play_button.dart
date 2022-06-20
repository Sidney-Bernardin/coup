import 'package:flutter/material.dart';

class PlayButton extends StatelessWidget {
  final String text;
  final void Function() onClick;

  const PlayButton(
    this.text, {
    Key? key,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        decoration: BoxDecoration(
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
        ),
        width: 145 * 1.7,
        height: 174 * 1.7,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey.shade200,
              fontSize: 30,
              fontFamily: 'SecularOne',
            ),
          ),
        ),
      ),
    );
  }
}
