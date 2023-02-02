import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class IndicatorStepView extends GetView<WalkController> {
  const IndicatorStepView({Key? key}) : super(key: key);
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
                totalSteps: stepsMaxSplit.toInt(),
                currentStep: stepsSplit.toInt(),
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
                totalSteps: pointMaxSplit.toInt(),
                currentStep: pointSplit.toInt(),
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
                        '${controller.steps}',
                        style: TextStyle(
                          fontFamily: 'IBMKR',
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(controller.currentTextColor.value),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
