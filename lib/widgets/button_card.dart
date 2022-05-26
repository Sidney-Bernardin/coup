import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  String text;
  Function onTap = () {};

  @override
  ButtonCard(this.text, this.onTap);

  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: Colors.black45),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blueGrey.shade300,
              Colors.blueGrey.shade700,
            ],
          )),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 30,
                  offset: Offset(5, 5),
                ),
              ],
              color: Colors.white,
              fontSize: 25,
              fontFamily: 'Frijole',
            ),
          ),
        ),
      ),
    );
  }
}
