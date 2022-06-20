import 'package:flutter/material.dart';

import '../../widgets/layout.dart' as layout;
import '../../widgets/play_button/play_button.dart' as play_button;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade800),
        child: layout.Layout(
          left: play_button.PlayButton(
            'Host Game',
            onClick: () {
              Navigator.pushReplacementNamed(context, '/lobby', arguments: {
                'is_host': true,
              });
            },
          ),
          right: play_button.PlayButton(
            'Join Game',
            onClick: () {
              Navigator.pushReplacementNamed(context, '/lobby', arguments: {
                'is_host': false,
              });
            },
          ),
          middle: const Card(),
        ),
      ),
    );
  }
}
