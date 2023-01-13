import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class IndicatorCircularView extends GetView<WalkController> {
  const IndicatorCircularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: CircularProgressIndicator(
                value: controller.walk100.value.toDouble() /
                    controller.walk100maxSecond,
              ),
            ),
          ),
          Container(
            child: Center(
              child: SizedBox(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('total:${controller.walkTotal}'),
                    Text('100:${controller.walk100}'),
                    Text('pointTotall:${controller.pointCount}'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   margin: EdgeInsets.all(30),
    //   height: 300,
    //   width: 500,
    //   decoration: BoxDecoration(
    //     shape: BoxShape.circle,
    //     //image로 바꿔서 ui 변화 가능.
    //   ),
    //   child: Center(
    //     child: Stack(
    //       children: [
    //         SizedBox(
    //             width: 370,
    //             height: 370,
    //             child: ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
