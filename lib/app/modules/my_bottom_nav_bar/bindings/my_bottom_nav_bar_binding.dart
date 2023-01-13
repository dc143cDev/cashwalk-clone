import 'package:get/get.dart';

import '../controllers/my_bottom_nav_bar_controller.dart';

class MyBottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyBottomNavBarController>(
      () => MyBottomNavBarController(),
    );
  }
}
