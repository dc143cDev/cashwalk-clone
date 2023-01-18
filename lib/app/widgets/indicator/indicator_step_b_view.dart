import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../palette.dart';

class IndicatorStepBView extends GetView<WalkController> {
  const IndicatorStepBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 190,
                height: 190,
                child: Center(
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 190,
                        height: 190,
                        child: CircularStepProgressIndicator(
                          stepSize: 35,
                          selectedStepSize: 40,
                          width: 200,
                          selectedColor:
                              Color(controller.currentTotalColor.value),
                          unselectedColor: bgColor,
                          totalSteps: controller.walkTotalMaxSplit5,
                          currentStep: controller.walkTotals5.value,
                        ),
                      ),
                      Center(
                        child: Text(
                          ' ${controller.walkTotal}\n  걸음',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 18,
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
              )
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 110,
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
              SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Stack(
                    children: [
                      // SizedBox(
                      //   width: 150,
                      //   height: 150,
                      //   child: CircularStepProgressIndicator(
                      //     stepSize: 10,
                      //     selectedStepSize: 10,
                      //     selectedColor:
                      //         Color(controller.currentWalkColor.value),
                      //     unselectedColor: bgColor,
                      //     totalSteps: controller.walk100maxSecondSplit5,
                      //     currentStep: controller.walk100s5.value,
                      //   ),
                      // ),
                      CircularStepProgressIndicator(
                        stepSize: 15,
                        selectedStepSize: 17,
                        selectedColor: Color(controller.currentWalkColor.value),
                        unselectedColor: bgColor,
                        totalSteps: controller.walk100maxSecondSplit5,
                        currentStep: controller.walk100s5.value,
                      ),
                      Center(
                        child: Text(
                          '        ${controller.walk100}/100\n 다음 포인트까지',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 12,
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
