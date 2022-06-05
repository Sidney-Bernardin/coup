import 'package:flutter/material.dart';

import 'ui/pages/home.dart';
import 'ui/pages/home_menu.dart';
import 'ui/pages/lobby.dart';
import 'ui/pages/lobby_menu.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coup',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomePage(),
        '/home_menu': (context) => HomeMenuPage(),
        '/lobby': (context) => LobbyPage(),
        '/lobby_menu': (context) => LobbyMenuPage(),
      },
    );
  }
}
