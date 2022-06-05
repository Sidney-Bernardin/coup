import 'package:flutter/material.dart';

import '../widgets/layout.dart';
import '../widgets/primary_button.dart';
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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Layout(
          left: PrimaryButton(
            'Host Game',
            onClick: () {
              Navigator.pushReplacementNamed(context, '/lobby', arguments: {
                'host': host_player.HostPlayer('sidney'),
              });
            },
          ),
          right: PrimaryButton(
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
