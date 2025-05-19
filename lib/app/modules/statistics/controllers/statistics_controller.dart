import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  RxInt topDigit = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDigitsLength();
  }

  void getDigitsLength() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = (prefs.getInt('topDigits') ?? 0);
    topDigit.value = value;
  }
}
