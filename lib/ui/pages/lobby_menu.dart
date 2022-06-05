import 'package:flutter/material.dart';

class LobbyMenuPage extends StatelessWidget {
  const LobbyMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)?.settings.arguments as Map;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  height: 174 * 1.7,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white10.withAlpha(80),
                    ),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withAlpha(100),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: args['players'].length,
                                itemBuilder: (context, index) {
                                  return Text(
                                    'Player $index',
                                    style: TextStyle(
                                      color: Colors.grey.shade200,
                                      fontSize: 20,
                                      fontFamily: 'SecularOne',
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: const ButtonStyle(),
                          child: const Text('Leave'),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  height: 174 * 1.7,
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/rules.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
