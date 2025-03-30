import 'package:get/get.dart';

class Digit {
  String value;
  final int position;
  bool isClicked;

  Digit({required this.value, required this.position, this.isClicked = false});
}

class AdventureController extends GetxController {
  final RxInt streak = 0.obs;
  final RxInt piPosition = 0.obs;

  final RxList<Digit> enterDigits = <Digit>[].obs;

  int getStreakPoint(int streak) {
    int point = 0;
    for (int i = 0; i < streak; i++) {
      point += i;
    }
    return point;
  }

  void onPressPad(String value) {
    enterDigits
        .add(Digit(value: value, position: piPosition.value, isClicked: false));
    piPosition.value = piPosition.value + 1;
    print("Giang: $value ${piPosition.value} ${enterDigits.last.isClicked}");
  }

  void onClear() {
    enterDigits.clear();
    piPosition.value = 0;
  }

  final count = 0.obs;
}
