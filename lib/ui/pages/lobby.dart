import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

// widgets
import '../widgets/influence_card.dart' as influence_card;
import '../widgets/layout.dart' as layout;
import '../widgets/middle/middle.dart' as middle;

// game_service
import '../../game_service/influence.dart' as influence;
import '../../game_service/host_player.dart' as host_player;
import '../../game_service/normal_player.dart' as normal_player;
import '../../game_service/player.dart' as player;

class LobbyPage extends StatelessWidget {
  const LobbyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    player.Player p = args['host'] ?? args['not_host'];
    p.start();

    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
          create: (context) => args['host'] as host_player.HostPlayer?,
        ),
        provider.ChangeNotifierProvider(
          create: (context) => args['not_host'] as normal_player.NormalPlayer?,
        ),
      ],
      child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, '/lobby_menu', arguments: {
            'players': p.gameState['players'],
          });
          return false;
        },
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade700,
            ),
            child: layout.Layout(
              left: influence_card.InfluenceCard(
                influence.Influence.values[p.gameState['players'][p.name]['a']],
              ),
              right: influence_card.InfluenceCard(
                influence.Influence.values[p.gameState['players'][p.name]['b']],
              ),
              middle: middle.Middle(),
            ),
          ),
        ),
      ),
    );
  }
}
