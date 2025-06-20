import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/player/player_provider.dart' as player_provider;
import '../../../providers/counter/counter_provider.dart' as counter_provider;

import '../../styles.dart' as styles;

import '../glass_icon_button/glass_icon_button.dart' as glass_icon_button;

class LobbyMiddle extends StatefulWidget {
  @override
  State<LobbyMiddle> createState() => _LobbyMiddleState();
}

class _LobbyMiddleState extends State<LobbyMiddle> {
  bool exchanging = false;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<counter_provider.CounterProvider>(context);

    final player = Provider.of<player_provider.PlayerProvider>(context);
    int treasury = player.gameState['treasury'];
    int coins = player.gameState['players'][player.name]['coins'];

    return Container(
      decoration: styles.ContainerDecorations.glass,
      height: 174 * 1.7,
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$treasury",
                    style: styles.TextStyles.glass,
                  ),
                  TextButton(
                    style: styles.ButtonStyles.glass,
                    onPressed: () {
                      player.handleAddToTreasury(player.name, counter.count);
                      counter.reset();
                    },
                    child: Text(
                      counter.count > 0
                          ? 'Give ${counter.count}'
                          : 'Take ${counter.count.abs()}',
                      style: styles.TextStyles.glass,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: !exchanging,
            child: glass_icon_button.GlassIconButton(
              onPressed: () {
                player.handleStartExchange();
                setState(() {
                  exchanging = true;
                });
              },
              iconData: Icons.autorenew,
            ),
          ),
          Visibility(
            visible: exchanging,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                glass_icon_button.GlassIconButton(
                  onPressed: () => player.nextExchangeSet(),
                  iconData: Icons.arrow_circle_right,
                ),
                Container(width: 15),
                glass_icon_button.GlassIconButton(
                  onPressed: () {
                    player.handleConfirmExchange();
                    setState(() {
                      exchanging = false;
                    });
                  },
                  iconData: Icons.done,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      glass_icon_button.GlassIconButton(
                        onPressed: () => counter.decrement(1),
                        iconData: Icons.arrow_downward,
                      ),
                      Container(width: 10),
                      glass_icon_button.GlassIconButton(
                        onPressed: () =>
                            counter.count < coins ? counter.increment(1) : null,
                        iconData: Icons.arrow_upward,
                      )
                    ],
                  ),
                  Text(
                    '$coins',
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
