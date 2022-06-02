import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'dart:typed_data';

import 'ws_server.dart' as ws_server;

class OutboundPayload {
  String name;
  String handler;
  int addToTreasury;

  OutboundPayload({
    required this.name,
    required this.handler,
    required this.addToTreasury,
  });

  OutboundPayload.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        handler = json['handler'],
        addToTreasury = json['addToTreasury'];
}

class Repository {
  Socket? socket;

  final StreamController<ws_server.OutboundPayload> payloadStream =
      StreamController<ws_server.OutboundPayload>();

  connect(String hostname, int port) async {
    socket = await Socket.connect(hostname, port);
    socket?.listen(
      (Uint8List data) {
        Map<String, dynamic> payloadMap = jsonDecode(data.toString());
        ws_server.OutboundPayload payload =
            ws_server.OutboundPayload.fromJson(payloadMap);
        payloadStream.add(payload);
      },
    );
  }

  void send(OutboundPayload payload) {
    socket?.write(payload);
  }
}
