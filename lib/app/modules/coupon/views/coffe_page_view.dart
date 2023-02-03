import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/model/product/coffee/coffee_data_model.dart';
import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';
import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/app/widgets/custom_button_yellow.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/coupon_controller.dart';

class CoffeePageView extends GetView<CouponController> {
  const CoffeePageView({Key? key, this.model}) : super(key: key);

  final CoffeeProductModel? model;

  @override
  Widget build(BuildContext context) {
    UrlController urlController = UrlController();
    WalkController walkController = WalkController();

    Get.put(CouponController());
    Get.put(WalkController());

    GetStorage storage = GetStorage();

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Coffee',
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
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Center(
              child: SizedBox(
                width: 220,
                height: 220,
                child: CircleAvatar(
                  backgroundColor: accentBrown,
                  child: Center(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            '${urlController.baseUrl}${Get.arguments['image']}'),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${Get.arguments['brand']}',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Text(
            '${Get.arguments['title']}',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 25,
                height: 25,
                child: CircleAvatar(
                  backgroundColor: accentYellow,
                  child: Text(
                    'C',
                    style: TextStyle(
                      fontFamily: 'LS',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: bgColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('${Get.arguments['price']} 캐시'),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 3,
                    color: accentBrown,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 3,
                    color: accentBrown,
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 3,
                    color: accentBrown,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text('${Get.arguments['contents']}'),
          ),
          SizedBox(
            height: 50,
          ),
          CustomButtonYellow(
            btnText: '구매하기',
            onPressed: () {
              controller.isTakeBtnClicked();

              // controller.isTakeBtnClicked();
              // if (int.parse(controller.priceForCard.value) >=
              //     controller.cashWallet.value) {
              //   Get.snackbar('잔액이 부족합니다.', '현재 보유중인 캐시가 모자랍니다');
              // } else {
              //   walkController.cashCount.value.toInt() -
              //       int.parse(controller.priceForCard.value).toInt();
              //
              //   controller.cardPost();
              // }
              // print('arg title: ${Get.arguments['title']}');
            },
          ),
        ],
      ),
    );
  }
}
