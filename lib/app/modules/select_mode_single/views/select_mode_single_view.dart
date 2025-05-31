import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/retroButton.dart';
import 'package:last_of_pi/app/routes/app_pages.dart';

import '../controllers/select_mode_single_controller.dart';

class SelectModeSingleView extends GetView<SelectModeSingleController> {
  const SelectModeSingleView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RetroButton(
              width: 200,
              label: 'ADVENTURE',
              onPressed: () {
                Get.toNamed(Routes.ADVENTURE);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            RetroButton(
              width: 200,
              label: 'SPEED RUN',
              onPressed: () {
                Get.toNamed(Routes.SPEED_RUN);
              },
            ),
          ],
        )),
      ),
    );
  }
}
