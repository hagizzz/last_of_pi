import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/modules/adventure/views/widgets/input_pad.dart'; // Ensure InputPad is correctly imported
import 'package:last_of_pi/app/modules/adventure/views/widgets/presenter.dart';

import '../controllers/adventure_controller.dart';

class AdventureView extends GetView<AdventureController> {
  const AdventureView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.surfacePrimary,
        body: Column(
          children: [
            Presenter(),
            Expanded(
              flex: 0,
              child: InputPad(),
            ),
          ],
        ));
  }
}
