import 'package:flutter/material.dart';

import '../../styles.dart' as styles;

class LobbyMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Container(
                decoration: styles.ContainerDecorations.glass,
                height: 174 * 1.7,
                margin: const EdgeInsets.only(left: 20, right: 10),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                decoration: styles.ContainerDecorations.glass,
                height: 174 * 1.7,
                margin: const EdgeInsets.only(left: 10, right: 20),
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/rules.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
