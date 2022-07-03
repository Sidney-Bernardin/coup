import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/influence_data.dart' as influence_data;

import '../../../providers/player/player_provider.dart' as player_provider;
import '../../../providers/player/host_provider.dart' as host_provider;
import '../../../providers/counter/counter_provider.dart' as counter_provider;

import '../../widgets/main_layout.dart' as main_layout;
import '../../widgets/influence_card/influence_card.dart' as influence_card;
import '../../widgets/lobby_middle/lobby_middle.dart' as lobby_middle;

class HostLobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    host_provider.HostProvider host = host_provider.HostProvider('HOST');
    host.start('10.10.10.117', 0);

    influence_data.InfluenceData a = influence_data
        .InfluenceData.values[host.gameState['players'][host.name]['a']];
    influence_data.InfluenceData b = influence_data
        .InfluenceData.values[host.gameState['players'][host.name]['b']];

    counter_provider.CounterProvider counter =
        counter_provider.CounterProvider();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<player_provider.PlayerProvider>(
          create: (_) => host,
        ),
        ChangeNotifierProvider<counter_provider.CounterProvider>(
          create: (_) => counter,
        ),
      ],
      builder: (context, child) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushNamed(context, '/lobby_menu', arguments: {});
            return false;
          },
          child: Scaffold(
            backgroundColor: Colors.grey.shade700,
            body: main_layout.MainLayout(
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
