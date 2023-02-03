import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class RunningWidgetView extends GetView {
  const RunningWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Stack(
        children: [
          Container(
            width: 400,
            height: 200,
            decoration: BoxDecoration(
              color: accentBrown,
              boxShadow: [
                BoxShadow(
                  color: accentBrown,
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
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '현재 목표: 500m 완주',
                    style: TextStyle(color: bgColor),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '목표 설정하러 가기 >',
                    style: TextStyle(color: bgColor),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: accentPapaya,
              boxShadow: [],
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: bgColor,
                  child: Icon(
                    Icons.play_arrow,
                    color: accentPapaya,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 230,
                  child: LinearProgressIndicator(
                    value: 10 / 100,
                    color: bgColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
