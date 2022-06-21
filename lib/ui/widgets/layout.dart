import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget left;
  final Widget right;
  final Widget middle;

  const Layout({
    Key? key,
    required this.left,
    required this.right,
    required this.middle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: left,
          ),
        ),
        Expanded(
          flex: 1,
          child: middle,
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: right,
          ),
        ),
      ],
    );
  }
}
