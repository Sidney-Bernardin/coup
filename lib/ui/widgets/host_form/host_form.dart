import 'package:flutter/material.dart';

import '../../styles.dart' as styles;

class HostForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: styles.ContainerDecorations.glass,
      height: 174 * 1.7,
      margin: const EdgeInsets.only(left: 20, right: 10),
      child: Center(
        child: TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/host_lobby'),
          child: Text('Host', style: styles.TextStyles.glass),
        ),
      ),
    );
  }
}
