import 'package:get/get.dart';

import '../controllers/speed_run_controller.dart';

class SpeedRunBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeedRunController>(
      () => SpeedRunController(),
    );
  }
}
