import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:uuid/uuid.dart' as uuid;

import 'ws_client.dart' as ws_client;

class OutboundPayload {
  String handler;
  Map newGameState;

  OutboundPayload({
    required this.handler,
    required this.newGameState,
  });

  OutboundPayload.fromJson(Map<String, dynamic> json)
      : handler = json['handler'],
        newGameState = json['new_game_state'];
}

class Repository {
  ServerSocket? _serverSocket;
  List<Socket> clientSockets = [];

  final StreamController<ws_client.OutboundPayload> payloadStream =
      StreamController<ws_client.OutboundPayload>();

  listen(String address, int port) async {
    _serverSocket = await ServerSocket.bind(address, port, shared: true);
    if (_serverSocket == null) return;

    _serverSocket?.listen((Socket socket) {
      if (!clientSockets.contains(socket)) {
        clientSockets.add(socket);
      }

      socket.listen((Uint8List data) {
        Map<String, dynamic> payloadMap = jsonDecode(data.toString());
        ws_client.OutboundPayload payload =
            ws_client.OutboundPayload.fromJson(payloadMap);
        payloadStream.add(payload);
      });
    });
  }

  void broadcast(OutboundPayload payload) {
    for (Socket s in clientSockets) {
      s.write(payload);
    }
  }
}
