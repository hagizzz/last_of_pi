import 'package:get/get.dart';

import '../modules/adventure/bindings/adventure_binding.dart';
import '../modules/adventure/views/adventure_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/select_mode_dual/bindings/select_mode_dual_binding.dart';
import '../modules/select_mode_dual/views/select_mode_dual_view.dart';
import '../modules/select_mode_single/bindings/select_mode_single_binding.dart';
import '../modules/select_mode_single/views/select_mode_single_view.dart';
import '../modules/speed_run/bindings/speed_run_binding.dart';
import '../modules/speed_run/views/speed_run_view.dart';
import '../modules/statistics/bindings/statistics_binding.dart';
import '../modules/statistics/views/statistics_view.dart';
import '../modules/test/bindings/test_binding.dart';
import '../modules/test/views/test_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.ADVENTURE,
      page: () => const AdventureView(),
      binding: AdventureBinding(),
    ),
    GetPage(
      name: _Paths.STATISTICS,
      page: () => const StatisticsView(),
      binding: StatisticsBinding(),
    ),
    GetPage(
      name: _Paths.TEST,
      page: () => const TestView(),
      binding: TestBinding(),
    ),
    GetPage(
      name: _Paths.SPEED_RUN,
      page: () => const SpeedRunView(),
      binding: SpeedRunBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => const BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_MODE_SINGLE,
      page: () => const SelectModeSingleView(),
      binding: SelectModeSingleBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_MODE_DUAL,
      page: () => const SelectModeDualView(),
      binding: SelectModeDualBinding(),
    ),
  ];
}
