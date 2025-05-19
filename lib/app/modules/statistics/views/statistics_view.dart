import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/statistics/views/widgets/top_digits.dart';

import '../controllers/statistics_controller.dart';

class StatisticsView extends GetView<StatisticsController> {
  const StatisticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TopDigits(),
          ],
        ),
      ),
    );
  }
}
