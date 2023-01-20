import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/friends_controller.dart';

class FriendsInviteView extends GetView<FriendsController> {
  const FriendsInviteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  Text(
                    '너도 나도\n1000 캐시 받자!',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IBMKR'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '친구가 회원가입 시 내 추천코드를 입력하면\n친구도 나도 1000캐시 적립!',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'IBMKR'),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                width: 240,
                height: 260,
                child: Image.asset('assets/images/Subject.png'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
