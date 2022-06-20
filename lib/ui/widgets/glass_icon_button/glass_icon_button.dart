import 'package:flutter/material.dart';

import '../../styles.dart' as styles;

class GlassIconButton extends StatelessWidget {
  IconData iconData;
  void Function() onPressed;

  GlassIconButton({
    Key? key,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: styles.ContainerDecorations.glass,
      width: 40,
      height: 40,
      child: IconButton(
        iconSize: 20,
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
