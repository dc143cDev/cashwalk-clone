import 'package:get/get.dart';

import '../controllers/bottom_app_bar_controller.dart';

class BottomAppBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomAppBarController>(
      () => BottomAppBarController(),
    );
  }
}
