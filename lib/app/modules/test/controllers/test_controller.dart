import 'package:get/get.dart';
import 'package:bonsoir/bonsoir.dart';

class TestController extends GetxController {
  late BonsoirService _myService;
  late BonsoirBroadcast _broadcaster;
  late BonsoirDiscovery _discovery;

  RxList<BonsoirService> foundPlayers = <BonsoirService>[].obs;

  void startService(String playerName) async {
    _myService = BonsoirService(
      name: playerName,
      type: '_mygame._tcp',
      port: 12345,
    );

    _broadcaster = BonsoirBroadcast(service: _myService);
    await _broadcaster.ready;
    await _broadcaster.start();
  }

  void startDiscovery() async {
    _discovery = BonsoirDiscovery(type: '_mygame._tcp');
    await _discovery.ready;

    _discovery.eventStream!.listen((event) {
      if (event.type == BonsoirDiscoveryEventType.discoveryServiceFound) {
        final service = event.service!;
        if (!foundPlayers.any((p) => p.name == service.name)) {
          foundPlayers.add(service);
        }
      }
    });

    await _discovery.start();
  }

  void stopAll() {
    _broadcaster.stop();
    _discovery.stop();
  }
}
