import 'package:get/get.dart';

import '../modules/adventure/bindings/adventure_binding.dart';
import '../modules/adventure/views/adventure_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.ADVENTURE,
      page: () => const AdventureView(),
      binding: AdventureBinding(),
    ),
  ];
}
