import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/influence_data.dart' as influence_data;

import '../../../providers/player/player_provider.dart' as player_provider;
import '../../../providers/player/basic_provider.dart' as basic_provider;
import '../../../providers/counter/counter_provider.dart' as counter_provider;

import '../../widgets/layout.dart' as layout;
import '../../widgets/influence_card/influence_card.dart' as influence_card;
import '../../widgets/lobby_middle/lobby_middle.dart' as lobby_middle;

class BasicLobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    basic_provider.BasicProvider basic = basic_provider.BasicProvider('CLIENT');
    basic.start('', 0);

    influence_data.InfluenceData a = influence_data
        .InfluenceData.values[basic.gameState['players'][basic.name]['a']];
    influence_data.InfluenceData b = influence_data
        .InfluenceData.values[basic.gameState['players'][basic.name]['b']];

    counter_provider.CounterProvider counter =
        counter_provider.CounterProvider();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<player_provider.PlayerProvider>(
          create: (_) => basic,
        ),
        ChangeNotifierProvider<counter_provider.CounterProvider>(
          create: (_) => counter,
        ),
      ],
      builder: (context, child) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushNamed(context, '/lobby_menu');
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.grey.shade700,
            body: layout.Layout(
              left: influence_card.InfluenceCard(a),
              right: influence_card.InfluenceCard(b),
              middle: lobby_middle.LobbyMiddle(),
            ),
          ),
        );
      },
    );
  }
}
