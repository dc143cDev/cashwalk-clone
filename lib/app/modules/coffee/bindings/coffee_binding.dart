import 'package:get/get.dart';

import '../controllers/coffee_controller.dart';

class CoffeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoffeeController>(
      () => CoffeeController(),
    );
  }
}
