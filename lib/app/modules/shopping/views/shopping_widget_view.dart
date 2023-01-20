import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:cashwalkclone/app/modules/walk/views/walk_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class ShoppingWidgetView extends GetView<WalkController> {
  const ShoppingWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Stack(
        children: [
          Container(
            height: 240,
            decoration: BoxDecoration(
              color: bgColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 108, 8, 8),
              child: Row(
                children: [
                  Text('data'),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: accentBrown,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(22),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: (Text(
                    'C',
                    style: TextStyle(
                      fontFamily: 'LS',
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: accentBrown,
                    ),
                  )),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '${controller.pointCount.value}',
                  style: TextStyle(
                    fontFamily: 'LS',
                    fontSize: 22,
                    fontWeight: FontWeight.w300,
                    color: bgColor,
                  ),
                ),
                SizedBox(
                  width: 170,
                ),
                Text(
                  '내 쿠폰함',
                  style: TextStyle(
                    fontFamily: 'IBMKR',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
