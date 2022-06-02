import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

import '../../game_service/player.dart' as player;
import '../../game_service/host_player.dart' as host_player;
import '../../game_service/normal_player.dart' as normal_player;

class Middle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    host_player.HostPlayer? hostPlayer =
        provider.Provider.of<host_player.HostPlayer?>(context);
    normal_player.NormalPlayer? normalPlayer =
        provider.Provider.of<normal_player.NormalPlayer?>(context);

    player.Player? p = hostPlayer ?? normalPlayer;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Treasury: ${p?.gameState['treasury']}",
                  style: TextStyle(
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            p?.addToTreasury(2);
          },
          icon: const Icon(Icons.autorenew),
          color: Colors.black,
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
        ),
      ],
    );
  }
}
