import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

import '../widgets/layout.dart' as layout;
import '../widgets/influence_card.dart' as influence_card;
import '../widgets/middle.dart' as middle;
import '../../game_service/player.dart' as player;
import '../../game_service/influence.dart' as influence;

class LobbyPage extends StatefulWidget {
  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return provider.MultiProvider(
      providers: [
        provider.StreamProvider<int>.value(st),
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
          middle: middle.Middle(0),
        ),
      ),
    );
  }
}
