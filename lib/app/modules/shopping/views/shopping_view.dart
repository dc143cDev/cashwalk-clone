import 'package:cashwalkclone/app/widgets/bestProduct.dart';
import 'package:cashwalkclone/app/widgets/profile_n_cash.dart';
import 'package:cashwalkclone/app/widgets/shopping_category.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/shopping_controller.dart';

class ShoppingView extends GetView<ShoppingController> {
  const ShoppingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ShoppingController());

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Shopping',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: accentYellow),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //프로필 및 캐시
          Expanded(
            flex: 1,
            //모듈화
            child: ProfileNCash(),
          ),
          //배너
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              child: PageView.builder(
                  controller: controller.pageController,
                  pageSnapping: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Obx(
                      () => Image.asset(
                        'assets/images/${controller.currentPage}.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
          ),
          //베스트 상품
          Container(
            height: 178,
            width: double.infinity,
            color: creamMint,
            child: Stack(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('베스트 상품 >'),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      //모듈화.
                      //베스트 상품 목업.
                      BestProductUI(
                          assetPath: 'assets/images/icecoffee.png',
                          price: '5000'),
                      SizedBox(
                        width: 20,
                      ),
                      BestProductUI(
                          assetPath: 'assets/images/latte.png', price: '5500'),
                      SizedBox(
                        width: 20,
                      ),
                      BestProductUI(
                          assetPath: 'assets/images/chocolatte.PNG',
                          price: '6000'),
                    ],
                  ),
                ],
              ),
            ]),
          ),
          //마켓 분류
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 0),
              child: Center(
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 1,
                  crossAxisCount: 2,
                  children: [
                    //모듈화.
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShoppingCategory(
                        onPressed: () {
                          controller.isCoffeeBtnClicked();
                        },
                        iconAssetPath: 'assets/images/icons/coffee-cup.png',
                        btnText: '커피/베이커리',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShoppingCategory(
                        onPressed: () {
                          controller.isConvenienceBtnClicked();
                        },
                        iconAssetPath: 'assets/images/icons/soft-drink.png',
                        btnText: '편의점',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShoppingCategory(
                        onPressed: () {
                          controller.isDiningBtnClicked();
                        },
                        iconAssetPath: 'assets/images/icons/spoon-and-fork.png',
                        btnText: '외식',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ShoppingCategory(
                        onPressed: () {
                          controller.isTicketBtnClicked();
                        },
                        iconAssetPath: 'assets/images/icons/tickets.png',
                        btnText: '문화생활',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
