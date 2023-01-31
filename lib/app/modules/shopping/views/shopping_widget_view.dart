import 'package:cashwalkclone/app/modules/coupon/views/coupon_view.dart';
import 'package:cashwalkclone/app/modules/shopping/views/shopping_view.dart';
import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class ShoppingWidgetView extends GetView<WalkController> {
  const ShoppingWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Stack(
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 108, 8, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '내가 최근에 구매한 상품',
                    style: TextStyle(color: Colors.grey.shade400),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('data'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: accentBrown,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: (Text(
                    'C',
                    style: TextStyle(
                      fontFamily: 'LS',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: accentBrown,
                    ),
                  )),
                ),
                SizedBox(
                  width: 15,
                ),
                Obx(
                  () => Text(
                    '${controller.cashCount.value}',
                    style: TextStyle(
                      fontFamily: 'LS',
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: bgColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(ShoppingView());
                  },
                  child: Text(
                    '쇼핑하러 가기    |',
                    style: TextStyle(
                      fontFamily: 'IBMKR',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: bgColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(CouponView());
                  },
                  child: Text(
                    '내 쿠폰함',
                    style: TextStyle(
                      fontFamily: 'IBMKR',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: bgColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
