import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/modules/statistics/controllers/statistics_controller.dart';

class TopDigits extends GetView<StatisticsController> {
  const TopDigits({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Your longest digits: ",
            style: TextStyle(
              color: AppColors.contentPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          Text(
            controller.topDigit.toString(),
            style: const TextStyle(
              color: AppColors.contentPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
        ],
      );
    });
  }
}
