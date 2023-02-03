import 'dart:convert';
import 'package:cashwalkclone/app/model/product/coffee/coffee_card_data_model.dart';
import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

import '../../../api/coffee_card_provider.dart';
import '../../../api/url_controller.dart';

class CouponController extends GetxController
    with StateMixin<List<CoffeeCardModel>> {
  UrlController urlController = UrlController();
  WalkController walkController = WalkController();

  CoffeeCardProvider coffeeCardProvider = CoffeeCardProvider();

  GetStorage storage = GetStorage();

  var cashWallet = 0.obs;

  var titleForCard = ''.obs;
  var brandForCard = ''.obs;
  var priceForCard = '0'.obs;
  var imagePathForCard = ''.obs;

  cardPost() async {
    var url = "${urlController.baseUrl}createCard";
    final postJson = jsonEncode({
      "card_title": titleForCard.value,
      "card_brand": brandForCard.value,
      "card_price": priceForCard.value,
      "image_path": imagePathForCard.value,
    });
    var res = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: postJson,
    );
    print(res);
  }

  isTakeBtnClicked() {
    titleForCard.value = Get.arguments['title'];
    brandForCard.value = Get.arguments['brand'];
    priceForCard.value = Get.arguments['price'];
    imagePathForCard.value = Get.arguments['image'];
    print('title card:${titleForCard.value}');
    print('brand card:${brandForCard.value}');
    print('price card:${priceForCard.value}');
    print('int parse: ${int.parse(priceForCard.value)}');
    print('cash that i got: ${cashWallet.value}');
    if (int.parse(priceForCard.value) >= cashWallet.value) {
      Get.snackbar('잔액이 부족합니다.', '현재 보유중인 캐시가 모자랍니다');
    } else {
      cashWallet.value -= int.parse(priceForCard.value);
      print('now cash: ${cashWallet.value}');
      storage.write('currentCash', cashWallet.value);
      cardPost();
    }
  }

  @override
  void onInit() {
    cashWallet.value = storage.read('currentCash');
    super.onInit();
    coffeeCardProvider.getCoffeeCardData().then((response) {
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
