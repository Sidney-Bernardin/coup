import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

import '../widgets/layout.dart' as layout;
import '../widgets/influence_card.dart' as influence_card;
import '../widgets/middle.dart' as middle;
import '../../game_service/influence.dart' as influence;
import '../../game_service/host_player.dart' as host_player;
import '../../game_service/normal_player.dart' as normal_player;

class LobbyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;
    print(args);

    return provider.MultiProvider(
      providers: [
        provider.ChangeNotifierProvider(
          create: (context) => args['host'] as host_player.HostPlayer?,
        ),
        provider.ChangeNotifierProvider(
          create: (context) => args['not_host'] as normal_player.NormalPlayer?,
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: layout.Layout(
          left: influence_card.InfluenceCard(
            influence.Influence.duke,
          ),
          right: influence_card.InfluenceCard(
            influence.Influence.captain,
          ),
          middle: middle.Middle(),
        ),
      ),
    );
  }
}
