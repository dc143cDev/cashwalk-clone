import 'package:cashwalkclone/app/widgets/radial_loading.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Cash Walk',
              style: TextStyle(
                  fontFamily: 'LS',
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: accentYellow),
            ),
            SizedBox(
              height: 120,
            ),
            CircularProgressIndicator(
              color: accentBrown,
            ),
            SizedBox(
              height: 40,
            ),
            Text('유저 정보를 확인중입니다...'),
          ],
        ),
      ),
    );
  }
}
