import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/influence.dart' as influence;

import '../../../providers/player/player_provider.dart' as player_provider;
import '../../../providers/player/host_provider.dart' as host_provider;
import '../../../providers/counter/counter_provider.dart' as counter_provider;

import '../../widgets/layout.dart' as layout;
import '../../widgets/influence_card/influence_card.dart' as influence_card;
import '../../widgets/lobby_middle/lobby_middle.dart' as lobby_middle;

class HostLobby extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    host_provider.HostProvider host = host_provider.HostProvider('HOST');
    host.start();

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
            body: layout.Layout(
              left: influence_card.InfluenceCard(
                influence.Influence.values[
                    Provider.of<player_provider.PlayerProvider>(context)
                        .gameState["players"]["HOST"]["a"]],
              ),
              right: influence_card.InfluenceCard(
                influence.Influence.values[
                    Provider.of<player_provider.PlayerProvider>(context)
                        .gameState["players"]["HOST"]["b"]],
              ),
              middle: lobby_middle.LobbyMiddle(),
            ),
          ),
        );
      },
    );
  }
}
