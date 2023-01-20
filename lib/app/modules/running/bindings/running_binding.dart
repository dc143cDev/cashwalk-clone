import 'package:get/get.dart';

import '../controllers/running_controller.dart';

class RunningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RunningController>(
      () => RunningController(),
    );
  }
}
