import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/retro_button.dart';
import 'package:last_of_pi/app/common/widgets/custom_dialog.dart';
import 'package:last_of_pi/app/modules/speed_run/controllers/speed_run_controller.dart';

class ResultDialog extends StatelessWidget {
  ResultDialog({super.key});
  final SpeedRunController controller = Get.find<SpeedRunController>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          Get.back();
          Future.delayed(const Duration(milliseconds: 100), () {
            Get.back();
          });
        }
      },
      child: CustomDialog(
        title: 'Congratulation!',
        children: [
          SimpleDialogOption(
            onPressed: () {},
            child: const Text('Time: '),
          ),
          Center(
              child: RetroButton(
            onPressed: () {
              Get.back();
              controller.initializeBaseState();
            },
            label: "Play again",
            width: 150,
          ))
        ],
      ),
    );
  }
}
