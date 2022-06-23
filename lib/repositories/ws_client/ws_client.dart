import 'dart:async';

class WebSocketClient {
  final StreamController<Map> payloadStream = StreamController<Map>();

  connect(String ip, int port) async {}
  send(Map payload) {}
}
