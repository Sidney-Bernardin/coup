import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Icon icon;

  Button(this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: icon,
      ),
    );
  }
}

class AddToTreasury extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
      onPressed: () {},
      child: Text(
        'Add 7',
        style: TextStyle(
          color: Colors.grey.shade200,
          fontFamily: 'SecularOne',
        ),
      ),
    );
  }
}
