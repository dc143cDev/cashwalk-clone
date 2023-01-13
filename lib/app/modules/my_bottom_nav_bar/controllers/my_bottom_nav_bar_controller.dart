import 'package:get/get.dart';

class MyBottomNavBarController extends GetxController {
  static MyBottomNavBarController get to => Get.find();

  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
