import 'package:get/get.dart';

import '../controllers/select_mode_dual_controller.dart';

class SelectModeDualBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectModeDualController>(
      () => SelectModeDualController(),
    );
  }
}
