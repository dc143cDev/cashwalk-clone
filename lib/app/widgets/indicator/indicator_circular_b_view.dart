import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../palette.dart';

class IndicatorCircularBView extends GetView<WalkController> {
  const IndicatorCircularBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var stepsToInt = int.parse(controller.steps.value);
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          strokeWidth: 12,
                          backgroundColor: bgColor,
                          color: Color(controller.currentTotalColor.value),
                          value: stepsToInt / controller.walkTotalMax.toInt(),
                        ),
                      ),
                      Center(
                        child: Text(
                          ' ${controller.steps.value}',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Color(controller.currentTextColor.value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 40,
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          strokeWidth: 12,
                          backgroundColor: bgColor,
                          color: Color(controller.currentWalkColor.value),
                          value: controller.stepsPointVisible.value.toDouble() /
                              controller.walk100maxSecond.toInt(),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${controller.stepsPointVisible}',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 27,
                            fontWeight: FontWeight.w700,
                            color: Color(controller.currentTextColor.value),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
