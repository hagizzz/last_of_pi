import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/app_text_style.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/input_pad.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/presenter.dart';
import 'package:last_of_pi/app/modules/base/views/widgets/status_bar.dart';

import '../controllers/adventure_controller.dart';

class AdventureView extends GetView<AdventureController> {
  const AdventureView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.surfacePrimary,
        body: Column(
          children: [
            Presenter(controller: controller),
            Obx(
              () => StatusBar(
                items: [
                  StatusItem(
                    label: "Score",
                    value: controller.totalScore.toString(),
                  ),
                  StatusItem(
                    label: "Streak",
                    value: controller.currentStreak.value.length().toString(),
                  ),
                  StatusItem(
                    label: "Digits",
                    value: controller.enterDigits.length.toString(),
                  ),
                ],
                textStyle: AppTextStyle.bodySStrong
                    .copyWith(color: AppColors.contentPrimary),
              ),
            ),
            InputPad(
              controller: controller,
            ),
          ],
        ));
  }
}
