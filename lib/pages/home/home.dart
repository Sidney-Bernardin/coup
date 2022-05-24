import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Object? route_args = null;

  @override
  Widget build(BuildContext context) {

    ModalRoute? r = ModalRoute.of(context);
    route_args = r != null ? r.settings.arguments : null;

    return Scaffold(
      body: Text('Hello, World!'),
    );
  }
}
