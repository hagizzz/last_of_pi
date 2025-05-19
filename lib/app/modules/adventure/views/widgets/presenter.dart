import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/app_colors.dart';
import 'package:last_of_pi/app/common/values/app_text_style.dart';
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
            child: Obx(
              () {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "3.",
                          style: const TextStyle(
                              color: AppColors.contentPrimary,
                              fontWeight: FontWeight.w600,
                              fontSize: 60,
                              letterSpacing: 5),
                          children: [
                            ...controller.enterDigits.map((entry) {
                              return TextDigit(entry);
                            }),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "Score: ",
                                style: AppTextStyle.bodySStrong
                                    .copyWith(color: AppColors.contentPrimary),
                                children: [
                                  TextSpan(
                                      text: controller.totalScore.toString()),
                                ]),
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Streak: ",
                                style: AppTextStyle.bodySStrong
                                    .copyWith(color: AppColors.contentPrimary),
                                children: [
                                  TextSpan(
                                      text: controller.currentStreak.value
                                          .length()
                                          .toString()),
                                ]),
                          )
                        ],
                      )
                    ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  TextSpan TextDigit(Digit digit) {
    return TextSpan(
      text: digit.isClicked ? piDigits[digit.position] : digit.value,
      style: TextStyle(
        color: (digit.isCorrect() && !digit.isClicked)
            ? AppColors.contentPrimary
            : (!digit.isCorrect() && !digit.isClicked)
                ? AppColors.red
                : AppColors.green,
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
}
