import 'package:flutter/material.dart';

import 'ui/pages/home.dart';
import 'ui/pages/host_lobby/host_lobby.dart';
import 'ui/pages/lobby_menu/lobby_menu.dart';

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
        '/host_lobby': (context) => HostLobby(),
        '/lobby_menu': (context) => LobbyMenu(),
      },
    );
  }
}
