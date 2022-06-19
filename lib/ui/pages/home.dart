import 'package:flutter/material.dart';

import '../widgets/layout.dart' as layout;
import '../widgets/play_button.dart' as play_button;
import '../../game_service/host_player.dart' as host_player;
import '../../game_service/normal_player.dart' as normal_player;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade800,
        ),
        child: layout.Layout(
          left: play_button.PlayButton(
            'Host Game',
            onClick: () {
              Navigator.pushReplacementNamed(context, '/lobby', arguments: {
                'host': host_player.HostPlayer('sidney'),
              });
            },
          ),
          right: play_button.PlayButton(
            'Join Game',
            onClick: () {
              Navigator.pushReplacementNamed(context, '/lobby', arguments: {
                'not_host': normal_player.NormalPlayer('sidney'),
              });
            },
          ),
          middle: const Card(),
        ),
      ),
    );
  }
}
