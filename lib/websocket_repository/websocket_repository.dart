import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:uuid/uuid.dart' as uuid;

class Client {
  String id;
  Socket clientSocket;

  Client(this.id, this.clientSocket);
}

class Payload {
  String handler;
  Map<String, dynamic> info;

  Payload({required this.handler, required this.info});

  Payload.fromJson(Map<String, dynamic> json)
      : handler = json['handler'],
        info = json['info'];
}

class WebSocketRepository {
  ServerSocket? _serverSocket;
  Map<String, Client> clientSockets = {};

  final StreamController<Payload> payloadStream = StreamController<Payload>();

  void listen(String address, int port) async {
    _serverSocket = await ServerSocket.bind(address, port);
    if (_serverSocket == null) return;

    _serverSocket?.listen((Socket socket) {
      if (!clientSockets.containsValue(socket)) {
        String id = const uuid.Uuid().v4();
        clientSockets[id] = Client(id, socket);
      }

      socket.listen((Uint8List data) {
        Map<String, dynamic> payloadMap = jsonDecode(data.toString());
        Payload payload = Payload.fromJson(payloadMap);
        payloadStream.add(payload);
      });
    });
  }

  void broadcast(Payload payload) {
    clientSockets.forEach((key, value) {
      value.clientSocket.write(payload);
    });
  }
}
