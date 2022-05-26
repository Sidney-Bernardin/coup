import 'package:flutter/material.dart';
import 'package:coup/pages/loading.dart';
import 'package:coup/pages/home.dart';
import 'package:coup/pages/lobby.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coup',
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/home': (context) => HomePage(),
        '/lobby': (context) => LobbyPage(),
      },
    );
  }
}
