import 'dart:async';

import '../websocket_repository/websocket_repository.dart'
    as websocket_repository;

class HostPlayer {
  websocket_repository.WebSocketRepository webSocketRepo =
      websocket_repository.WebSocketRepository();

  int treasury = 30;

  final StreamController<int> updateTreasuryStream = StreamController<int>();

  HostPlayer() {
    webSocketRepo.payloadStream.stream.listen(processPayload);
  }

  void start() {
    webSocketRepo.listen('0.0.0.0', 4040);
  }

  void processPayload(websocket_repository.Payload payload) {
    switch (payload.handler) {
      case 'add_to_treasury':
        addToTreasury(payload.info['add_to_treasury']);
    }
  }

  void addToTreasury(int x) {
    treasury += x;
    updateTreasuryStream.add(treasury);
    webSocketRepo.broadcast(websocket_repository.Payload(
      handler: 'new_treasury',
      info: {'new_treasury': treasury},
    ));
  }
}
