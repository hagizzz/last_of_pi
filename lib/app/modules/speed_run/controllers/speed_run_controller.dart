import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/base/controllers/base_controller.dart';
import 'package:last_of_pi/app/modules/speed_run/views/widgets/result_dialog.dart';

enum ModeLevel { easy, hard, hardest, custom }

class SpeedRunMode {
  final ModeLevel level;
  final int numberOfDigits;

  SpeedRunMode({
    required this.level,
    required this.numberOfDigits,
  });

  static const Map<ModeLevel, int> _levelToDigits = {
    ModeLevel.easy: 2,
    ModeLevel.hard: 5,
    ModeLevel.hardest: 10,
    ModeLevel.custom: 0,
  };

  static SpeedRunMode fromEnum(ModeLevel level) {
    return SpeedRunMode(
      level: level,
      numberOfDigits: _levelToDigits[level] ?? 0,
    );
  }
}

class SpeedRunResult {
  final ModeLevel level;
  final int numberOfDigits;
  final int time;

  SpeedRunResult({
    required this.level,
    required this.numberOfDigits,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
        'level': level.name,
        'numberOfDigits': numberOfDigits,
        'timeInMilliseconds': time,
      };

  factory SpeedRunResult.fromJson(Map<String, dynamic> json) {
    return SpeedRunResult(
      level: ModeLevel.values.firstWhere((e) => e.name == json['level']),
      numberOfDigits: json['numberOfDigits'],
      time: json['timeInMilliseconds'],
    );
  }

  @override
  String toString() {
    return 'Level: $level, Digits: $numberOfDigits, Time: ${time}s';
  }
}

class SpeedRunController extends BaseController {
  late ConfettiController controllerCenter;

  // SpeedRunMode? customMode;

  Rx<SpeedRunMode> selectedMode =
      Rx<SpeedRunMode>(SpeedRunMode.fromEnum(ModeLevel.easy));
  RxString timeRecord = ''.obs;

  void start() {
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
      BaseController.saveResult(
        SpeedRunResult(
          level: selectedMode.value.level,
          numberOfDigits: selectedMode.value.numberOfDigits,
          time: elapsedMilliseconds.value,
        ),
      );
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
    hasWrongInput.value = false;
  }
}
