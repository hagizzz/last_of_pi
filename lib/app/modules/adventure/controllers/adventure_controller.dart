import 'dart:async';

import 'package:get/get.dart';
import 'package:last_of_pi/app/common/values/pi_digits.dart';
import 'package:shared_preferences/shared_preferences.dart';

const streakDelayPeriod = 1500; // miliseconds

class Digit {
  String value;
  final int position;
  bool isClicked;
  Streak? streak;

  Digit({
    required this.value,
    required this.position,
    this.isClicked = false,
    this.streak,
  });

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

class AdventureController extends GetxController {
  final RxInt streak = 0.obs;
  final RxInt piPosition = 0.obs;
  final RxBool hasWrongInput = false.obs;
  final Rx<Streak> currentStreak = Streak().obs;
  final RxList<Streak> streaks = <Streak>[].obs;
  Timer? _streakTimer;

  final RxList<Digit> enterDigits = <Digit>[].obs;

  RxInt get totalScore {
    return streaks.fold(RxInt(0), (total, streak) => total + streak.score());
  }

  @override
  void onInit() {
    super.onInit();
    initializeState();
  }

  void initializeState() {
    currentStreak.value = Streak();
    enterDigits.value = [];
    streaks.value = [currentStreak.value];

    _streakTimer?.cancel();
    _streakTimer = null;
    piPosition.value = 0;
    hasWrongInput.value = false;
  }

  void saveDigitsLength() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int topDigits = (prefs.getInt('topDigits') ?? 0);
    if (enterDigits.length > topDigits) {
      await prefs.setInt("topDigits", enterDigits.length);
    }
  }

  Digit addDigit(String value) {
    final position = piPosition.value;

    final newDigit = Digit(
      value: value,
      position: position,
      streak: currentStreak.value,
    );

    enterDigits.add(newDigit);
    piPosition.value = position + 1;

    return newDigit;
  }

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

  void onPressPad(String value) {
    final newDigit = addDigit(value);
    if (hasWrongInput.value) {
      return;
    }
    if (!newDigit.isCorrect()) {
      hasWrongInput.value = true;
      resetStreak();
      return;
    }

    updateStreakPosition();
    setStreakTimer();
    saveDigitsLength();
  }
}
