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
    Get.put(WalkController());
    var stepsToInt = int.parse(controller.steps.value) + 0;
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
                value: controller.stepsPointVisible.value.toDouble() /
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
                value: stepsToInt / controller.walkTotalMax.toInt(),
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
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        '${controller.steps.value}',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                      Text(
                        '${controller.stepsPointVisible}',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                      SizedBox(
                        height: 40,
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
