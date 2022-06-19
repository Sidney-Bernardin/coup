import 'package:flutter/material.dart';

import 'package:provider/provider.dart' as provider;

import 'buttons.dart' as buttons;
import 'styles.dart' as styles;

import '../../../game_service/player.dart' as player;
import '../../../game_service/host_player.dart' as host_player;
import '../../../game_service/normal_player.dart' as normal_player;

class Middle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    host_player.HostPlayer? hostPlayer =
        provider.Provider.of<host_player.HostPlayer?>(context);
    normal_player.NormalPlayer? normalPlayer =
        provider.Provider.of<normal_player.NormalPlayer?>(context);

    player.Player? p = hostPlayer ?? normalPlayer;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 3, color: Colors.white10.withAlpha(80)),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(100),
            blurRadius: 10.0,
            spreadRadius: 0.0,
          ),
        ],
        color: Colors.white.withOpacity(0.2),
      ),
      height: 174 * 1.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${p?.gameState['treasury']}",
                    style: styles.TextStyles.treasury,
                  ),
                  buttons.AddToTreasury(),
                ],
              ),
            ),
          ),
          buttons.Button(Icon(
            Icons.autorenew,
            color: Colors.grey.shade200,
          )),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buttons.Button(Icon(
                        Icons.arrow_upward,
                        color: Colors.grey.shade200,
                      )),
                      buttons.Button(Icon(
                        Icons.arrow_downward,
                        color: Colors.grey.shade200,
                      )),
                    ],
                  ),
                  Text(
                    "${p?.gameState['treasury']}",
                    style: styles.TextStyles.pot,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
