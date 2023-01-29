import 'package:cashwalkclone/app/modules/friends/controllers/friends_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../palette.dart';
import '../../../api/user_provider.dart';

class FriendsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //탭바.

  //탭 클릭 감지시 표시될 탭바 UI.
  final List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        '랭킹',
        style: TextStyle(
            color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        '친구 초대',
        style: TextStyle(
            color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
    Tab(
      child: Text(
        '받은 요청',
        style: TextStyle(
            color: textDark,
            fontFamily: 'IBMKR',
            fontSize: 15,
            fontWeight: FontWeight.w700),
      ),
    ),
  ];

  //탭 컨트롤러 선언
  late TabController tabController;

  //유저 데이터 프로바이더 선언
  UserProvider userProvider = UserProvider();
  FriendsDataController friendsDataController = FriendsDataController();

  @override
  void onInit() {
    super.onInit();
    //탭 컨트롤러 init
    tabController = TabController(vsync: this, length: myTabs.length);
    friendsDataController.getUserDataForRanking();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
