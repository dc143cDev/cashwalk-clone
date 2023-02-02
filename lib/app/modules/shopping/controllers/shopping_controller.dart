import 'dart:async';

import 'package:cashwalkclone/app/modules/shopping/views/convenience_view.dart';
import 'package:cashwalkclone/app/modules/shopping/views/dining_view.dart';
import 'package:cashwalkclone/app/modules/shopping/views/ticket_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../coffee/views/coffee_view.dart';

class ShoppingController extends GetxController {
  //현재 페이지 인덱스.
  late final currentPage = 0.obs;

  //페이지 컨트롤러 init.
  PageController pageController = PageController(
    initialPage: 0,
  );

  isCoffeeBtnClicked() {
    Get.to(CoffeeView());
  }

  isConvenienceBtnClicked() {
    Get.to(CoffeeView());
  }

  isDiningBtnClicked() {
    Get.to(CoffeeView());
  }

  isTicketBtnClicked() {
    Get.to(CoffeeView());
  }

  @override
  void onInit() {
    super.onInit();
    //컨트롤러 init 시 배너페이지 타이머 작동.
    shoppingBanner();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  //배너 애니메이션 타이머.
  //3초마다 페이지뷰 애니메이션 작동.
  shoppingBanner() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < 3) {
        currentPage.value++;
        pageController.animateToPage(
          currentPage.toInt(),
          duration: Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      } else {
        currentPage.value -= 3;
      }
    });
  }
}
