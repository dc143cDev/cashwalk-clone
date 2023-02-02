import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../palette.dart';

class IndicatorStepBView extends GetView<WalkController> {
  const IndicatorStepBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var stepsToInt = int.parse(controller.steps.value);
    var stepsSplit = stepsToInt / 34;
    var stepsMaxToInt = controller.walkTotalMax;
    var stepsMaxSplit = stepsMaxToInt / 34;

    var pointToInt = controller.stepsPointVisible.value;
    var pointSplit = pointToInt / 5;
    var pointMaxToInt = controller.walk100maxSecond;
    var pointMaxSplit = pointMaxToInt / 5;

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
                          totalSteps: stepsMaxSplit.toInt(),
                          currentStep: stepsSplit.toInt(),
                        ),
                      ),
                      Center(
                        child: Text(
                          '${controller.steps}',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 28,
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
              SizedBox(
                width: 70,
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: Stack(
                    children: [
                      CircularStepProgressIndicator(
                        stepSize: 15,
                        selectedStepSize: 17,
                        selectedColor: Color(controller.currentWalkColor.value),
                        unselectedColor: bgColor,
                        totalSteps: pointMaxSplit.toInt(),
                        currentStep: pointSplit.toInt(),
                      ),
                      Center(
                        child: Text(
                          '${controller.stepsPointVisible}',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 28,
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
        ],
      ),
    );
  }
}
