import 'package:flutter/material.dart';

class Middle extends StatefulWidget {
  int treasury;

  Middle(this.treasury, {Key? key}) : super(key: key);

  @override
  _MiddleState createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Treasury: ${widget.treasury}',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.autorenew),
          color: Colors.black,
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
