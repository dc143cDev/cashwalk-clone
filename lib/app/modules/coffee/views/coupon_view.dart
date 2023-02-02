import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';

import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CouponView extends GetView<CoffeeController> {
  const CouponView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CoffeeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('CouponView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('test: ${controller.coffeeCard.value.toString()}'),
          Obx(
            () => SizedBox(
              width: 200,
              height: 100,
              child: ListView.builder(
                itemCount: controller.coffeeCard.value.length,
                itemBuilder: ((context, index) {
                  return ListTile(
                    title: Text(
                      controller.coffeeCard.value[index].title!.toString(),
                      style: TextStyle(color: textDark),
                    ),
                    subtitle: Text(
                      controller.coffeeCard.value[index].brand!.toString(),
                      style: TextStyle(color: textDark),
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
