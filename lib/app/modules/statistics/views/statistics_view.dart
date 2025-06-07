import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/modules/statistics/views/widgets/top_digits.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TopDigits(),
            Obx(() => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.speedRunResult.map((result) {
                    return Text(
                      'Mode: ${result.level.name}, Digits: ${result.numberOfDigits}, Time: ${result.time / 1000}s',
                      style: const TextStyle(
                        color: AppColors.contentPrimary,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    );
                  }).toList(),
                )),
            ElevatedButton(
                onPressed: () {
                  controller.clearResults();
                },
                child: const Text("Delete all")),
          ],
        ),
      ),
    );
  }
}
