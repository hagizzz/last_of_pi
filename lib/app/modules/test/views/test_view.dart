import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/test/controllers/test_controller.dart';

class TestView extends StatelessWidget {
  final TestController controller = Get.put(TestController());

  TestView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.startService("Player ${DateTime.now().millisecondsSinceEpoch}");
    controller.startDiscovery();

    return Scaffold(
      appBar: AppBar(title: const Text('Tìm người chơi trong LAN')),
      body: Obx(() => ListView.builder(
            itemCount: controller.foundPlayers.length,
            itemBuilder: (context, index) {
              final player = controller.foundPlayers[index];
              return ListTile(
                title: Text(player.name),
                subtitle: Text(player.toJson().toString()),
                trailing: ElevatedButton(
                  child: const Text('Mời chơi'),
                  onPressed: () {
                    Get.snackbar('Đã gửi lời mời', 'Đến ${player.name}');
                  },
                ),
              );
            },
          )),
    );
  }
}
