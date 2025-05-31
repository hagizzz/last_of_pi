import 'dart:async';

import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/base/controllers/base_controller.dart';

const streakDelayPeriod = 1500; // miliseconds

class AdventureController extends BaseController {
  final RxInt streak = 0.obs;
  Timer? _streakTimer;

  @override
  void onInit() {
    super.onInit();
    initializeBaseState();
    loadMoreDigits();
    scrollController.addListener(onScroll);
  }

  @override
  void updateStreakPosition() {
    final position = piPosition.value;

    // new streak created in timer
    if (_streakTimer == null) {
      currentStreak.value.firstPosition = position;
      currentStreak.value.lastPosition = position;
    } else {
      currentStreak.value.lastPosition = position;
    }
  }

  void resetStreak() {
    currentStreak.value = Streak();
    _streakTimer?.cancel();
    _streakTimer = null;
  }

  void setStreakTimer() {
    _streakTimer?.cancel();

    _streakTimer = Timer(const Duration(milliseconds: streakDelayPeriod), () {
      resetStreak();
      streaks.add(currentStreak.value);
    });
  }

  @override
  void onWrongInputHook() {
    shakeKey.currentState?.shake();
    hasWrongInput.value = true;
    resetStreak();
  }

  @override
  void onCorrectInputHook() {
    updateStreakPosition();
    setStreakTimer();
    saveDigitsLength();
    hasWrongInput.value = false;
  }

  
}
