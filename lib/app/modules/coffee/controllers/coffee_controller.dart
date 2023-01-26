import 'package:get/get.dart';

class CoffeeController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  isBrand0IndexClicked() {
    selectedIndex.value = 0;
    print(selectedIndex.value);
  }

  isBrand1IndexClicked() {
    selectedIndex.value = 1;
    print(selectedIndex.value);
  }

  isBrand2IndexClicked() {
    selectedIndex.value = 2;
    print(selectedIndex.value);
  }

  isBrand3IndexClicked() {
    selectedIndex.value = 3;
    print(selectedIndex.value);
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
