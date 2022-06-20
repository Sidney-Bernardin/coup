import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/player/player_provider.dart' as player_provider;
import '../../../providers/counter/counter_provider.dart' as counter_provider;

import '../../styles.dart' as styles;

import '../glass_icon_button/glass_icon_button.dart' as glass_icon_button;

class LobbyMiddle extends StatelessWidget {
  addToTreasury() {}

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<player_provider.PlayerProvider>(context);
    final counter = Provider.of<counter_provider.CounterProvider>(context);

    return Container(
      decoration: styles.ContainerDecorations.glass,
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
                    "${player.gameState['treasury']}",
                    style: styles.TextStyles.glass,
                  ),
                  TextButton(
                    style: styles.ButtonStyles.glass,
                    onPressed: () {
                      player.handleAddToTreasury(counter.count);
                      counter.reset();
                    },
                    child: Text(
                      'Add ${counter.count}',
                      style: styles.TextStyles.glass,
                    ),
                  ),
                ],
              ),
            ),
          ),
          glass_icon_button.GlassIconButton(
            onPressed: () {},
            iconData: Icons.autorenew,
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
                      Container(width: 15),
                      glass_icon_button.GlassIconButton(
                        onPressed: () => counter.increment(1),
                        iconData: Icons.arrow_upward,
                      )
                    ],
                  ),
                  Text(
                    "${player.gameState['pot']}",
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
