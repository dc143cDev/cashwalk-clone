import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class IndicatorStepView extends GetView<WalkController> {
  const IndicatorStepView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: CircularStepProgressIndicator(
                stepSize: 35,
                selectedStepSize: 40,
                selectedColor: Color(controller.currentTotalColor.value),
                unselectedColor: bgColor,
                totalSteps: controller.walkTotalMaxSplit5,
                currentStep: controller.walkTotals5.value,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 250,
              height: 250,
              child: CircularStepProgressIndicator(
                stepSize: 15,
                selectedStepSize: 20,
                selectedColor: Color(controller.currentWalkColor.value),
                unselectedColor: bgColor,
                totalSteps: controller.walk100maxSecondSplit5,
                currentStep: controller.walk100s5.value,
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
