import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../palette.dart';

class IndicatorCircularBView extends GetView<WalkController> {
  const IndicatorCircularBView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
                          value: controller.walkTotal.value.toDouble() /
                              controller.walkTotalMax.toInt(),
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
                          value: controller.walk100.value.toDouble() /
                              controller.walk100maxSecond.toInt(),
                        ),
                      ),
                      Center(
                        child: Text(
                          '        ${controller.walk100}/100\n 다음 포인트까지',
                          style: TextStyle(
                            fontFamily: 'IBMKR',
                            fontSize: 14,
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
    );
  }
}
