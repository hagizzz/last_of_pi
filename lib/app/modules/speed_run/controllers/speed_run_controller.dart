import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/base/controllers/base_controller.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/custom_level_dialog.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/mode_selection_dialog.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/result_dialog.dart';

enum ModeLevel { easy, hard, hardest, custom }

class SpeedRunMode {
  final ModeLevel level;
  final int numberOfDigits;

  SpeedRunMode({required this.level, required this.numberOfDigits});

  static SpeedRunMode fromEnum(ModeLevel level) {
    switch (level) {
      case ModeLevel.easy:
        return SpeedRunMode(level: level, numberOfDigits: 20);
      case ModeLevel.hard:
        return SpeedRunMode(level: level, numberOfDigits: 50);
      case ModeLevel.hardest:
        return SpeedRunMode(level: level, numberOfDigits: 100);
      case ModeLevel.custom:
        return SpeedRunMode(level: level, numberOfDigits: 0);
    }
  }
}

class SpeedRunController extends BaseController {
  late ConfettiController controllerCenter;

  SpeedRunMode? customMode;

  Rx<SpeedRunMode> selectedMode =
      Rx<SpeedRunMode>(SpeedRunMode.fromEnum(ModeLevel.easy));
  RxString timeRecord = ''.obs;

  void start() {
    print("Giang $isRunning");
    if (isRunning) return;
    isRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      elapsedMilliseconds.value += 100;
    });
  }

  void pause() {
    timer?.cancel();
    isRunning = false;
  }

  void reset() {
    timer?.cancel();
    isRunning = false;
  }

  @override
  void onReady() {
    super.onReady();
    Get.dialog(
      barrierDismissible: false,
      ModeSelectionDialog(
        onModeSelected: (selectedModeObj) async {
          final mode = SpeedRunMode.fromEnum(selectedModeObj.level);
          selectedMode.value = mode;
          print("Giang ${mode.level}");
          if (mode.level == ModeLevel.custom) {
            final result = await Get.dialog<int>(CustomLevelDialog());
            selectedMode.value = SpeedRunMode(
                level: ModeLevel.custom, numberOfDigits: result ?? 0);
          }
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    controllerCenter = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  String formatTime(int ms) {
    final seconds = (ms ~/ 1000) % 60;
    final minutes = (ms ~/ 60000) % 60;
    final milliseconds = (ms % 1000) ~/ 100;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}.'
        '${milliseconds.toString()}';
  }

  @override
  void onWrongInputHook() {
    shakeKey.currentState?.shake();
    hasWrongInput.value = true;
    reset();
    onClose();
  }

  @override
  void onCorrectInputHook() {
    start();
    if (enterDigits.length == selectedMode.value.numberOfDigits) {
      controllerCenter.play();
      timeRecord.value = formatTime(elapsedMilliseconds.value);
      Get.dialog(
        barrierDismissible: false,
        ConfettiWidget(
            confettiController: controllerCenter,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: false,
            colors: const [
              Colors.green,
              Colors.blue,
              Colors.pink,
              Colors.orange
            ],
            child: ResultDialog()),
      );
      onClose();
    }
    updateStreakPosition();
    saveDigitsLength();
    hasWrongInput.value = false;
  }
}
