import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/pi_digits.dart';
import 'package:last_of_pi/app/modules/adventure/controllers/adventure_controller.dart';

class Presenter extends GetView<AdventureController> {
  const Presenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Obx(() {
              return RichText(
                text: TextSpan(
                  text: "3.",
                  style: const TextStyle(
                      color: AppColors.contentPrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 60,
                      letterSpacing: 5),
                  children: [
                    ...controller.enterDigits.map((entry) {
                      String digit = entry.value;
                      int i = entry.position;
                      return TextDigit(entry, digit);
                    }),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  TextSpan TextDigit(Digit entry, String digit) {
    return TextSpan(
      text: entry.isClicked ? piDigits[entry.position] : digit,
      style: TextStyle(
        color: (entry.value == piDigits[entry.position] && !entry.isClicked)
            ? AppColors.contentPrimary
            : (entry.value != piDigits[entry.position] && !entry.isClicked)
                ? AppColors.red
                : AppColors.green,
        fontWeight: FontWeight.w600,
        fontSize: 50,
      ),
      recognizer: entry.value != piDigits[entry.position]
          ? (TapGestureRecognizer()
            ..onTap = () {
              entry.isClicked = !entry.isClicked;
              controller.enterDigits.refresh();
              print("Giang digit: ${entry.isClicked} ${entry.value}");
            })
          : null,
    );
  }
}
