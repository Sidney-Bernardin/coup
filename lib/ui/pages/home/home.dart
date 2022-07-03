import 'package:flutter/material.dart';

import '../../widgets/host_form/host_form.dart' as host_form;
import '../../widgets/join_form/join_form.dart' as join_form;
import '../../widgets/main_layout.dart' as main_layout;
import '../../styles.dart' as styles;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.grey.shade700),
        child: main_layout.MainLayout(
          left: host_form.HostForm(),
          right: join_form.JoinForm(),
          middle: Container(
            decoration: styles.ContainerDecorations.glass,
            height: 174 * 1.7,
            margin: const EdgeInsets.only(left: 10, right: 10),
          ),
        ),
      ),
    );
  }
}
