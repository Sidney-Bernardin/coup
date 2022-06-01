import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';

import 'influence.dart';
import 'models.dart';

class Player {
  Socket? socket;

  String name;
  Influence influenceA = Influence.ambassador;
  Influence influenceB = Influence.assassin;

  void Function(int) onUpdateTreasury;

  Player(this.name, {required this.onUpdateTreasury});

  void onError() {}

  void onDone() {}

  void connect(String host, int port) async {
    socket = await Socket.connect(host, port);
    socket?.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: false,
    );
  }

  void onData(Uint8List data) {
    Map<String, dynamic> payloadMap = jsonDecode(data.toString());
    Payload payload = Payload.fromJson(payloadMap);

    switch (payload.handler) {
      case "update_treasury":
        onUpdateTreasury(payload.info['new_treasury']);
    }
  }
}
