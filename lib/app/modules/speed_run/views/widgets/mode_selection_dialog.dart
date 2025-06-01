import 'package:flutter/material.dart';
import 'package:last_of_pi/app/common/retro_button.dart';
import 'package:last_of_pi/app/modules/speed_run/controllers/speed_run_controller.dart';
import 'package:last_of_pi/app/common/widgets/custom_dialog.dart';

class ModeSelectionDialog extends StatelessWidget {
  final void Function(SpeedRunMode mode) onModeSelected;

  const ModeSelectionDialog({super.key, required this.onModeSelected});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Difficulty',
      children: [
        Center(
          child: RetroButton(
            onPressed: () {
              Navigator.pop(context);
              onModeSelected(SpeedRunMode.fromEnum(ModeLevel.easy));
            },
            label: "Easy - 50",
            width: 200,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: RetroButton(
            onPressed: () {
              Navigator.pop(context);
              onModeSelected(SpeedRunMode.fromEnum(ModeLevel.hard));
            },
            label: "Hard - 80",
            width: 200,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: RetroButton(
            onPressed: () {
              Navigator.pop(context);
              onModeSelected(SpeedRunMode.fromEnum(ModeLevel.hardest));
            },
            label: "Extreme - 100",
            width: 200,
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: RetroButton(
            onPressed: () {
              Navigator.pop(context);
              onModeSelected(SpeedRunMode.fromEnum(ModeLevel.custom));
            },
            label: "Customize",
            width: 200,
          ),
        ),
      ],
    );
  }
}
