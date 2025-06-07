import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/app_text_style.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/input_pad.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/presenter.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/status_bar.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/custom_level_dialog.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/mode_selection_dialog.dart';

import '../controllers/speed_run_controller.dart';

class SpeedRunView extends GetView<SpeedRunController> {
  SpeedRunView({super.key}) {
    print("giang ne");
    Future.delayed(Duration.zero, () {
      Get.dialog(
        barrierDismissible: false,
        ModeSelectionDialog(
          onModeSelected: (selectedModeObj) async {
            final mode = SpeedRunMode.fromEnum(selectedModeObj.level);
            controller.selectedMode.value = mode;
            if (mode.level == ModeLevel.custom) {
              final result = await Get.dialog<int>(CustomLevelDialog());
              controller.selectedMode.value = SpeedRunMode(
                level: ModeLevel.custom,
                numberOfDigits: result ?? 0,
              );
            }
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Column(
          children: [
            Presenter(
              controller: controller,
            ),
            // ElevatedButton(
            //   onPressed: controller.start,
            //   child: const Text("Start"),
            // ),
            Obx(() => ConfettiWidget(
                  confettiController: controller.controllerCenter,
                  blastDirectionality: BlastDirectionality.explosive,
                  shouldLoop: false,
                  colors: const [
                    Colors.green,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange
                  ],
                  child: StatusBar(
                    items: [
                      StatusItem(
                        label: "Time record",
                        value: controller
                            .formatTime(controller.elapsedMilliseconds.value),
                      ),
                      StatusItem(
                        label: "Digits",
                        value: controller.enterDigits.length.toString(),
                      ),
                    ],
                    textStyle: AppTextStyle.bodySStrong
                        .copyWith(color: AppColors.contentPrimary),
                  ),
                )),
            Expanded(
              flex: 0,
              child: InputPad(controller: controller),
            ),
          ],
        ));
  }
}
