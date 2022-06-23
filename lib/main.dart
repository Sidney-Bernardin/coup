import 'package:flutter/material.dart';

import 'ui/pages/home/home.dart';
import 'ui/pages/host_lobby/host_lobby.dart';
import 'ui/pages/basic_lobby/basic_lobby.dart';
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
        '/basic_lobby': (context) => BasicLobby(),
        '/lobby_menu': (context) => LobbyMenu(),
      },
    );
  }
}
