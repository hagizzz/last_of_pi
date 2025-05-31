import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/pi_digits.dart';
import 'package:last_of_pi/app/common/widgets/error_shake_effect/error_shake_effect.dart';
import 'package:last_of_pi/app/modules/base/controllers/base_controller.dart';

class Presenter extends StatelessWidget {
  final BaseController controller;
  const Presenter({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          return ShakeError(
            key: controller.shakeKey,
            child: CustomScrollView(
              controller: controller.scrollController,
              reverse: controller.isHelp.value ? false : true,
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, left: 16, right: 8),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: "3.",
                        style: const TextStyle(
                            color: AppColors.contentPrimary,
                            fontWeight: FontWeight.w600,
                            fontSize: 60,
                            letterSpacing: 5),
                        children: [
                          ...controller.enterDigits
                              .map((entry) => textDigit(entry)),
                          if (controller.isHelp.value)
                            ...controller.chunks
                                .join()
                                .split('')
                                .skip(controller.enterDigits.length)
                                .toList()
                                .asMap()
                                .entries
                                .map(
                                  (digit) => textDigit(
                                    Digit(
                                        value: digit.value,
                                        position:
                                            controller.enterDigits.length +
                                                digit.key,
                                        isHint: true),
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  TextSpan textDigit(Digit digit) {
    return TextSpan(
      text: digit.isClicked ? piDigits[digit.position] : digit.value,
      style: TextStyle(
        color: getDigitColor(digit),
        fontWeight: FontWeight.w600,
        fontSize: 50,
      ),
      recognizer: digit.value != piDigits[digit.position]
          ? (TapGestureRecognizer()
            ..onTap = () {
              digit.isClicked = !digit.isClicked;
              controller.enterDigits.refresh();
            })
          : null,
    );
  }

  Color getDigitColor(Digit digit) {
    if (digit.isHint == true) return Colors.black26;
    if (digit.isCorrect() && !digit.isClicked) return AppColors.contentPrimary;
    if (!digit.isCorrect() && !digit.isClicked) return AppColors.red;
    return AppColors.green;
  }
}
