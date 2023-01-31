import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendsAcceptView extends GetView {
  const FriendsAcceptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Icon(
              Icons.people_alt_sharp,
              size: 40,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '친구요청이 없어요.',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '추천된 친구목록에서 친구신청을 해보세요.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 340,
            ),
          ],
        ),
      ),
    );
  }
}
