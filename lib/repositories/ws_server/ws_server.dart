import 'dart:async';
import 'dart:convert';

import 'package:network_info_plus/network_info_plus.dart' as network_info_plus;
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart' as shelf_web_socket;
import 'package:web_socket_channel/web_socket_channel.dart'
    as web_socket_channel;

class WebSocketServer {
  List<web_socket_channel.WebSocketChannel> clientSockets = [];

  final StreamController<Map> payloadStream = StreamController<Map>();

  listenAndServe() async {
    var handler = shelf_web_socket.webSocketHandler((ws) {
      if (!clientSockets.contains(ws)) {
        clientSockets.add(ws);
      }

      ws.stream.listen((payloadStr) {
        Map payload = jsonDecode(payloadStr);
        payloadStream.add(payload);
      });
    });

    String? ip = await network_info_plus.NetworkInfo().getWifiIP();

    shelf_io.serve(handler, ip!, 4040).then((srv) {
      print('Serving at ws://${srv.address.host}:${srv.port}');
    });
  }

  void broadcast(Map payload) {
    for (web_socket_channel.WebSocketChannel s in clientSockets) {
      s.sink.add(jsonEncode(payload));
    }
  }
}
