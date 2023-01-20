import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/coupon_controller.dart';

class CouponView extends GetView<CouponController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CouponView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CouponView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
