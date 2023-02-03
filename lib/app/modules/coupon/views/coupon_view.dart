import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';

import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/product/coffee/coffee_card_ui_model.dart';
import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CouponController());
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Coupon',
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
      body: SafeArea(
        child: controller.obx(
          (data) => ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              var details = data?[index];
              return CoffeeCardUIModel(
                model: details,
              );
            },
          ),
        ),
      ),
    );
  }
}
