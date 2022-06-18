import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

class Repository {
  Socket? socket;

  final StreamController<Map<String, dynamic>> payloadStream =
      StreamController<Map<String, dynamic>>();

  connect(String hostname, int port) async {
    socket = await Socket.connect(hostname, port);
    socket?.listen(
      (Uint8List data) {
        Map<String, dynamic> payload = jsonDecode(data.toString());
        payloadStream.add(payload);
      },
    );
  }

  void send(Map<String, dynamic> payload) {
    socket?.write(payload);
  }
}
