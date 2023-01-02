import 'package:get/get.dart';

import '../controllers/walk_controller.dart';

class WalkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalkController>(
      () => WalkController(),
    );
  }
}
