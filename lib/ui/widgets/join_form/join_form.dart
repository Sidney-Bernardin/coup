import 'package:flutter/material.dart';

import '../../styles.dart' as styles;

class JoinForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: styles.ContainerDecorations.glass,
      height: 174 * 1.7,
      margin: const EdgeInsets.only(left: 10, right: 20),
      child: Center(
        child: TextButton(
          onPressed: () =>
              Navigator.pushReplacementNamed(context, '/basic_lobby'),
          child: Text('Join', style: styles.TextStyles.glass),
        ),
      ),
    );
  }
}
