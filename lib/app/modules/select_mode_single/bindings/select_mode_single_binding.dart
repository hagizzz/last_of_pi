import 'package:get/get.dart';

import '../controllers/select_mode_single_controller.dart';

class SelectModeSingleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectModeSingleController>(
      () => SelectModeSingleController(),
    );
  }
}
