import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/retroButton.dart';
import 'package:last_of_pi/app/modules/speed_run/controllers/speed_run_controller.dart';

class ModeSelectionDialog extends StatelessWidget {
  final void Function(SpeedRunMode mode) onModeSelected;

  const ModeSelectionDialog({super.key, required this.onModeSelected});

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
      child: SimpleDialog(
        backgroundColor: const Color(0xFF92DAFD),
        title: const Center(child: Text('Chọn chế độ')),
        children: [
          Center(
            child: RetroButton(
              onPressed: () {
                Navigator.pop(context);
                onModeSelected(SpeedRunMode.fromEnum(ModeLevel.easy));
              },
              label: "Dễ - 50",
              width: 200,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: RetroButton(
              onPressed: () {
                Navigator.pop(context);
                onModeSelected(SpeedRunMode.fromEnum(ModeLevel.hard));
              },
              label: "Khó - 80",
              width: 200,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: RetroButton(
              onPressed: () {
                Navigator.pop(context);
                onModeSelected(SpeedRunMode.fromEnum(ModeLevel.hardest));
              },
              label: "Cực khó - 100",
              width: 200,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: RetroButton(
              onPressed: () {
                Navigator.pop(context);
                onModeSelected(SpeedRunMode.fromEnum(ModeLevel.custom));
              },
              label: "Điều chỉnh",
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}
