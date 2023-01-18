import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

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
              width: 250,
              height: 250,
              child: CircularProgressIndicator(
                strokeWidth: 10,
                backgroundColor: bgColor,
                color: Color(controller.currentWalkColor.value),
                value: controller.walk100.value.toDouble() /
                    controller.walk100maxSecond,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: CircularProgressIndicator(
                strokeWidth: 12,
                backgroundColor: bgColor,
                color: Color(controller.currentTotalColor.value),
                value: controller.walkTotal.value.toDouble() /
                    controller.walkTotalMax.toInt(),
              ),
            ),
          ),
          Container(
            child: Center(
              child: SizedBox(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '   ${controller.walkTotal}\n 걸음',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '         ${controller.walk100}/100\n 다음 포인트까지',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '${controller.pointCount} Cash',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
