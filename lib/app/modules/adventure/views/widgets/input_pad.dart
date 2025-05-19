import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/app_text_style.dart';
import 'package:last_of_pi/app/modules/adventure/controllers/adventure_controller.dart';

class PadButton extends GetView<AdventureController> {
  final void Function(String) onPress;
  final String textValue;
  final bool useSecondColor;

  const PadButton({
    super.key,
    required this.onPress,
    required this.textValue,
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
              foregroundColor: AppColors.contentPrimary, // Text/icon color
              textStyle: AppTextStyle.headingXL
                  .copyWith(color: AppColors.contentPrimary),
              minimumSize: const Size(double.infinity, double.infinity)),
          onPressed: () => onPress(textValue),
          child: Text(textValue),
        ),
      ),
    );
  }
}

class InputPad extends GetView<AdventureController> {
  // final void Function(String) onPress;
  // final bool disableClear;
  const InputPad({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
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
                    controller.initializeState();
                  },
                  textValue: 'CLEAR',
                  useSecondColor: true,
                  // disabled: disableClear,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
