import 'dart:convert';
import 'package:cashwalkclone/app/api/coffee_card_provider.dart';
import 'package:http/http.dart' as http;
import 'package:cashwalkclone/app/api/product_provider.dart';
import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/model/product/coffee/coffee_data_model.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../model/product/coffee/coffee_card_data_model.dart';

//stateMixin 을 같이 상속하여 api 호출 상태에 따라 state 관리
class CoffeeController extends GetxController
    with StateMixin<List<CoffeeProductModel>> {
  GetStorage storage = GetStorage();

  UrlController urlController = UrlController();

  //페이지 인덱스
  final RxInt selectedIndex = 0.obs;

  //프로바이더 선언. 구조를 공유하는 테이블들은 같은 프로바이더 사용.
  ProductProvider productProvider = ProductProvider();

  // Rx<List<CoffeeCardModel>> coffeeCard = Rx<List<CoffeeCardModel>>([]);
  // late CoffeeCardModel coffeeCardModel;

  var itemCount = 0.obs;

  void changeIndex(int index) {
    selectedIndex(index);
  }

  //브랜드 버튼을 순서대로 나열, 브랜드 버튼을 누르면 선택 인덱스의 값이 바뀌며 페이지 전환.
  //동시에 프로바이더의 json 호출 메소드를 호출하여 데이터를 호출함.
  isBrand0IndexClicked() {
    selectedIndex.value = 0;
    print(selectedIndex.value);
    productProvider.getStbProductData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  isBrand1IndexClicked() {
    selectedIndex.value = 1;
    print(selectedIndex.value);
    productProvider.getTwsProductData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  isBrand2IndexClicked() {
    selectedIndex.value = 2;
    print(selectedIndex.value);
    productProvider.getYdyProductData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  isBrand3IndexClicked() {
    selectedIndex.value = 3;
    print(selectedIndex.value);
    productProvider.getStbProductData().then((response) {
      change(response, status: RxStatus.success());
      print(response);
    }, onError: (e) {
      change(null, status: RxStatus.error(e.toString()));
    });
  }

  //들어갈 밸류를 ui 단에서 넣어줄건지 여기서 한번 거쳐갈지는 보류.
  // addCoffeeCard(String title, String brand, String price) {
  //   coffeeCardModel = CoffeeCardModel(
  //     title: title,
  //     brand: brand,
  //     price: price,
  //   );
  //   coffeeCard.value.add(coffeeCardModel);
  //   itemCount.value = coffeeCard.value.length;
  // }

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
    storage.save();
    // storage.write('coffeeCard', coffeeCard);
  }
}
