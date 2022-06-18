import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as flutter_spinkit;
import 'package:provider/provider.dart' as provider;

import '../../game_service/influence.dart' as influence;
import '../../game_service/host_player.dart' as host_player;
import '../../game_service/normal_player.dart' as normal_player;
import '../../game_service/player.dart' as player;
import '../widgets/influence_card.dart' as influence_card;
import '../widgets/layout.dart' as layout;
import '../widgets/middle.dart' as middle;

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
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.jpg"),
                fit: BoxFit.cover,
              ),
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
