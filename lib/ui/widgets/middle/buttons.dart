import 'package:flutter/material.dart';

import 'middle.dart' as middle;

import 'package:provider/provider.dart' as provider;

class Basic extends StatelessWidget {
  Icon icon;
  Function onPressed;

  Basic(this.icon, {Key? key, required this.onPressed}) : super(key: key);

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
        onPressed: onPressed(),
        icon: icon,
      ),
    );
  }
}

class ChangeToAdd extends StatelessWidget {
  static const inc = 0;
  static const dec = 1;

  Icon icon;
  int type;

  ChangeToAdd(this.icon, this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          if (type == inc) {
            provider.Provider.of<middle.ToAdd>(context, listen: false)
                .increment();
          } else if (type == dec) {
            provider.Provider.of<middle.ToAdd>(context, listen: false)
                .decrement();
          }
        },
        icon: icon,
      ),
    );
  }
}

class AddToTreasury extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int toAdd = provider.Provider.of<middle.ToAdd>(context).count;

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
        'Add $toAdd',
        style: TextStyle(
          color: Colors.grey.shade200,
          fontFamily: 'SecularOne',
        ),
      ),
    );
  }
}
