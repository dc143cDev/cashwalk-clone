import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../palette.dart';

class WalkFAB extends GetView<WalkController> {
  const WalkFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalkController walkController = WalkController();
    Get.put(WalkController());
    return FloatingActionButton(
      heroTag: 'main',
      backgroundColor: accentYellow,
      elevation: 10,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [accentYellow, Colors.yellow.shade600])),
        child: Center(
          child: Obx(() => Text(
                '${controller.pointCount.value}',
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.w700, color: bgColor),
              )),
        ),
      ),
      onPressed: () {
        controller.walkFABClicked();
      },
    );
  }
}
