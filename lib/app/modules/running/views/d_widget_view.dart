import 'package:flutter/material.dart';

import '../../../../palette.dart';

class DWidget extends StatelessWidget {
  const DWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13),
      child: Stack(
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xff4adede),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 7),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '내 다이어트 현황 보러가기',
                  style: TextStyle(color: bgColor, fontSize: 18),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  width: 2,
                  color: bgColor,
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: bgColor,
                  child: Text(
                    '>',
                    style: TextStyle(
                      color: Color(0xff4adede),
                      fontSize: 30,
                    ),
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
