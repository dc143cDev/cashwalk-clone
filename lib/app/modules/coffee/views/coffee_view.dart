import 'package:cashwalkclone/app/modules/coffee/views/coffee_brand_stb_view.dart';
import 'package:cashwalkclone/app/modules/coffee/views/coffee_brand_tws_view.dart';
import 'package:cashwalkclone/app/modules/coffee/views/coffee_brand_ydy_view.dart';
import 'package:cashwalkclone/app/widgets/brand_tile.dart';
import 'package:cashwalkclone/app/widgets/profile_n_cash.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';
import '../controllers/coffee_controller.dart';

class CoffeeView extends GetView<CoffeeController> {
  const CoffeeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(CoffeeController());

    final List<Widget> coffeePages = [
      CoffeeBrandStbView(),
      CoffeeBrandTwsView(),
      CoffeeBrandYdyView(),
    ];

    return Scaffold(
      backgroundColor: bgColor,
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: ProfileNCash(),
          ),
          SizedBox(
            height: 2,
            width: double.infinity,
            child: Container(
              color: Colors.grey.shade300,
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  BrandTile(
                    brandChild: CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 20,
                    ),
                    brandName: 'STB',
                    onTap: () => controller.isBrand0IndexClicked(),
                  ),
                  BrandTile(
                    brandChild: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 20,
                    ),
                    brandName: 'TWS',
                    onTap: () => controller.isBrand1IndexClicked(),
                  ),
                  BrandTile(
                    brandChild: CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 20,
                    ),
                    brandName: 'YDY',
                    onTap: () => controller.isBrand2IndexClicked(),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Obx(
              () => SafeArea(
                child: coffeePages[controller.selectedIndex.value],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
