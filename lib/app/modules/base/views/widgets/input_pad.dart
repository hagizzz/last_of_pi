import 'package:flutter/material.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/app_text_style.dart';
import 'package:last_of_pi/app/modules/base/controllers/base_controller.dart';
import 'package:remixicon/remixicon.dart';

class PadButton extends StatelessWidget {
  final void Function(String) onPress;
  final String? textValue;
  final bool useSecondColor;
  final Widget? icon;

  const PadButton({
    super.key,
    required this.onPress,
    this.textValue,
    this.icon,
    this.useSecondColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        height: 100.0,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(200),
              ),
              shadowColor: Colors.transparent,
              backgroundColor: AppColors.surfacePrimary,
              foregroundColor: AppColors.contentPrimary,
              textStyle: AppTextStyle.headingL
                  .copyWith(color: AppColors.contentPrimary),
              minimumSize: const Size(double.infinity, double.infinity)),
          onPressed: () => onPress(textValue ?? ''),
          child: icon != null ? icon! : Text(textValue ?? ''),
        ),
      ),
    );
  }
}

class InputPad extends StatelessWidget {
  final BaseController controller;

  const InputPad({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 260.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  PadButton(onPress: controller.onPressPad, textValue: '7'),
                  PadButton(onPress: controller.onPressPad, textValue: '8'),
                  PadButton(onPress: controller.onPressPad, textValue: '9'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  PadButton(onPress: controller.onPressPad, textValue: '4'),
                  PadButton(onPress: controller.onPressPad, textValue: '5'),
                  PadButton(onPress: controller.onPressPad, textValue: '6'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  PadButton(onPress: controller.onPressPad, textValue: '1'),
                  PadButton(onPress: controller.onPressPad, textValue: '2'),
                  PadButton(onPress: controller.onPressPad, textValue: '3'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  PadButton(onPress: controller.onPressPad, textValue: '0'),
                  PadButton(
                    onPress: (value) {
                      controller.isHelp.value = !controller.isHelp.value;
                    },
                    icon: const Icon(
                      RemixIcons.search_line,
                      color: AppColors.primary,
                    ),
                  ),
                  PadButton(
                    onPress: (value) {
                      controller.initializeBaseState();
                      controller.isHelp.value = false;
                    },
                    icon: const Icon(
                      RemixIcons.close_large_fill,
                      color: Colors.red,
                    ),
                    useSecondColor: true,
                    // disabled: disableClear,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
