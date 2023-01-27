import 'package:cashwalkclone/app/api/product_provider.dart';
import 'package:cashwalkclone/app/api/user_provider.dart';
import 'package:cashwalkclone/app/model/product/coffee/stb_data_model.dart';
import 'package:cashwalkclone/app/model/user/user_data_model.dart';
import 'package:get/get.dart';

class CoffeeController extends GetxController
    with StateMixin<List<StbProductModel>> {
  final RxInt selectedIndex = 0.obs;

  UserProvider userProvider = UserProvider();

  ProductProvider productProvider = ProductProvider();

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
    productProvider.getStbProductData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
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
