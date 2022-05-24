import 'package:flutter/material.dart';
import 'package:coup/pages/loading/loading.dart';
import 'package:coup/pages/home/home.dart';
import 'package:coup/pages/lobby/lobby.dart';

class App extends StatelessWidget {

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