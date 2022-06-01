import 'package:flutter/material.dart';

import '../widgets/layout.dart';
import '../widgets/primary_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Layout(
        left: PrimaryButton(
          'Host Game',
          onClick: () {
            Navigator.pushReplacementNamed(context, '/lobby', arguments: {});
          },
        ),
        right: PrimaryButton(
          'Join Game',
          onClick: () {
            Navigator.pushReplacementNamed(context, '/lobby', arguments: {});
          },
        ),
        middle: const Card(),
      ),
    );
  }
}
