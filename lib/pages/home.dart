import 'package:flutter/material.dart';

import 'package:coup/theme.dart';
import 'package:coup/constants.dart';
import 'package:coup/widgets/influence_card.dart';
import 'package:coup/widgets/button_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black12,
              child: Center(
                child: SizedBox(
                  width: MyCardTheme.width,
                  height: MyCardTheme.height,
                  child: ButtonCard('Host Game', () {}),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Center(
                child: Icon(Icons.more_horiz),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.black12,
              child: Center(
                child: SizedBox(
                  width: MyCardTheme.width,
                  height: MyCardTheme.height,
                  child: InfluenceCard(InfluenceCardInfo.captain),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
