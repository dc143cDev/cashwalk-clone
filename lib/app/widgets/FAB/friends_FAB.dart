import 'package:cashwalkclone/app/modules/friends/controllers/friends_dial_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../palette.dart';

class DialFAB extends StatelessWidget {
  const DialFAB({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    FriendsDialController friendsDialController = FriendsDialController();
    Get.put(FriendsDialController());
    return SpeedDial(
      //dial 오픈 시 작동
      openCloseDial: friendsDialController.isDialOpen,
      onOpen: () {},
      //dial 클로즈 시 작동
      onClose: () {
        friendsDialController.isDialBtnClosed();
      },
      onPress: () {
        friendsDialController.isDialBtnClicked();
      },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [accentYellow, Colors.yellow.shade600])),
        child: Center(
          child: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            // 애니메이션 프로그레스.
            progress: friendsDialController.animationController,
          ),
        ),
      ),
      backgroundColor: accentYellow,
      //dial item 들.
      //클릭시 해당 함수에 해당하는 디알로그 출력.
      children: [
        SpeedDialChild(
            child: Icon(
              Icons.add,
              color: accentBrown,
            ),
            label: '친구 추가하기',
            onTap: () {
              friendsDialController.isAddBtnClicked();
            }),
        SpeedDialChild(
            child: Icon(
              Icons.search_rounded,
              color: accentBrown,
            ),
            label: '친구 검색',
            onTap: () {
              friendsDialController.isSearchBtnClicked();
            }),
        SpeedDialChild(
            child: Icon(
              Icons.people_rounded,
              color: accentBrown,
            ),
            label: '친구 관리',
            onTap: () {
              friendsDialController.isControlBtnClicked();
            }),
      ],
    );
  }
}
