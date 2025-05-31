import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/pi_digits.dart';
import 'package:last_of_pi/app/common/widgets/error_shake_effect/error_shake_effect.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Digit {
  String value;
  final int position;
  bool isClicked;
  Streak? streak;
  bool? isHint;

  Digit(
      {required this.value,
      required this.position,
      this.isClicked = false,
      this.streak,
      this.isHint = false});

  bool isCorrect() {
    return value == piDigits[position];
  }
}

class Streak {
  int firstPosition;
  int lastPosition;
  Streak({this.firstPosition = 0, this.lastPosition = -1});

  int score() {
    final n = length();
    return (n * (n + 1) / 2).round();
  }

  int length() {
    return lastPosition - firstPosition + 1;
  }
}

class BaseController extends GetxController {
  final RxInt piPosition = 0.obs;
  final RxBool hasWrongInput = false.obs;
  final RxList<Digit> enterDigits = <Digit>[].obs;
  final shakeKey = GlobalKey<ShakeErrorState>();
  Timer? _streakTimer;
  final RxList<Streak> streaks = <Streak>[].obs;
  final Rx<Streak> currentStreak = Streak().obs;
  final ScrollController scrollController = ScrollController();
  final double chunkSize = 100;
  int currentIndex = 0;
  final RxList<String> chunks = RxList<String>();
  final RxBool isLoading = false.obs;
  final RxBool isHelp = false.obs;
  final RxInt elapsedMilliseconds = 0.obs;
  Timer? timer;
  bool isRunning = false;
  RxInt get totalScore {
    return streaks.fold(RxInt(0), (total, streak) => total + streak.score());
  }

  Digit addDigit(String value) {
    final position = piPosition.value;

    final newDigit = Digit(
      value: value,
      position: position,
    );

    enterDigits.add(newDigit);
    piPosition.value = position + 1;

    return newDigit;
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void onScroll() {
    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 800) {
      loadMoreDigits();
    }
  }

  void loadMoreDigits() {
    if (currentIndex >= piDigits.length) return;

    final int nextIndex =
        (currentIndex + chunkSize).clamp(0, piDigits.length).toInt();
    chunks.add(piDigits.substring(currentIndex, nextIndex));
    currentIndex = nextIndex;

    isLoading.value = true;
  }

  void saveDigitsLength() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int topDigits = (prefs.getInt('topDigits') ?? 0);
    if (enterDigits.length > topDigits) {
      await prefs.setInt("topDigits", enterDigits.length);
    }
  }

  void initializeBaseState() {
    piPosition.value = 0;
    hasWrongInput.value = false;
    currentStreak.value = Streak();
    streaks.value = [currentStreak.value];
    enterDigits.clear();
    timer?.cancel();
    elapsedMilliseconds.value = 0;
    isRunning = false;
  }

  void onPressPad(String value) {
    final newDigit = addDigit(value);

    if (!newDigit.isCorrect()) {
      onWrongInputHook();
      return;
    }

    if (hasWrongInput.value) return;

    onCorrectInputHook();
  }

  void updateStreakPosition() {
    final position = piPosition.value;

    if (_streakTimer == null) {
      currentStreak.value.firstPosition = position;
      currentStreak.value.lastPosition = position;
    } else {
      currentStreak.value.lastPosition = position;
    }
  }

  void onWrongInputHook() {
    hasWrongInput.value = true;
  }

  void onCorrectInputHook() {
    hasWrongInput.value = false;
  }
}
