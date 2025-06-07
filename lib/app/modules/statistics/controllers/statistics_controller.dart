import 'dart:convert';

import 'package:get/get.dart';
import 'package:last_of_pi/app/modules/speed_run/controllers/speed_run_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StatisticsController extends GetxController {
  final SpeedRunController speedRunController = Get.find<SpeedRunController>();
  RxInt topDigit = 0.obs;
  RxList<SpeedRunResult> speedRunResult = <SpeedRunResult>[].obs;

  @override
  void onInit() {
    super.onInit();
    getDigitsLength();
    loadResults();
    getBestResults();
  }

  void getDigitsLength() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = (prefs.getInt('topDigits') ?? 0);
    topDigit.value = value;
  }

  Future<List<SpeedRunResult>> getBestResults() async {
    final results = await loadResults();

    final Map<String, SpeedRunResult> bestMap = {};

    for (final r in results) {
      final key = '${r.level.name}_${r.numberOfDigits}';
      if (!bestMap.containsKey(key) || r.time < bestMap[key]!.time) {
        bestMap[key] = r;
      }
    }

    final bestResults = bestMap.values.toList();
    speedRunResult.value = bestResults; // cập nhật rxList
    return bestResults;
  }

  static Future<List<SpeedRunResult>> loadResults() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> rawList = prefs.getStringList('speed_run_results') ?? [];
    return rawList.map((jsonStr) {
      final Map<String, dynamic> map = jsonDecode(jsonStr);
      return SpeedRunResult.fromJson(map);
    }).toList();
  }

  Future<void> clearResults() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('speed_run_results');
    // speedRunResult.value = [];
  }
}
