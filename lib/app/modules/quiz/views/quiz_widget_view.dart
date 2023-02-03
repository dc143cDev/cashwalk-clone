import 'package:cashwalkclone/app/modules/walk/controllers/walk_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class QuizWidgetView extends GetView<WalkController> {
  const QuizWidgetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Stack(
        children: [
          Container(
            height: 240,
            width: 400,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('현재 가장 최신 버전의 flutter 버전은 무엇인가요?'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('정답 맞추러 가기 >'),
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: mainGrey,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: Icon(
                    Icons.timer,
                    color: accentBrown,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '다음 퀴즈까지 \n남은 시간 :',
                  style: TextStyle(
                    fontFamily: 'IBMKR',
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: bgColor,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      //타이머
                      ' 33 : 33 : 33',
                      style: TextStyle(
                          color: accentYellow,
                          fontSize: 23,
                          fontFamily: 'IBMKR',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  height: 60,
                  width: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
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
