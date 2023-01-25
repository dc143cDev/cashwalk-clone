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
              color: accentPapaya,
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
