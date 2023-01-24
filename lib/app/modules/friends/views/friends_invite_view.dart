import 'package:cashwalkclone/app/widgets/custom_button_yellow.dart';
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
              height: 10,
            ),
            //에셋 이미지 + 추천코드
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: SizedBox(
                    width: 240,
                    height: 260,
                    child: Image.asset('assets/images/Subject.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 270, 30, 0),
                  child: SizedBox(
                    width: 370,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        side: BorderSide(color: Colors.grey, width: 1),
                        backgroundColor: bgColor,
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '내 추천코드',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            '추천코드 데이터',
                            style: TextStyle(
                                color: textDark,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'IBMKR',
                                fontSize: 16),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          SizedBox(
                            width: 15,
                            height: 23,
                            child: Icon(
                              Icons.paste,
                              color: textDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            //친구에게 공유하기 버튼
            Center(
              child: SizedBox(
                width: 330,
                child: CustomButtonYellow(
                  onPressed: () {},
                  btnText: '친구에게 공유하기',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50,
                ),
                Text(
                  '가입한 친구',
                  style: TextStyle(
                    color: textDark,
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'N명',
                  style: TextStyle(
                      fontSize: 17,
                      color: textDark,
                      fontFamily: 'IBMKR',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  '(최대 20명)',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
          ],
        ),
      ),
    );
  }
}
