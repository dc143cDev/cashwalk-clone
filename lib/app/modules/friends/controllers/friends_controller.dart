import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../palette.dart';

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

  //새로고침 버튼.

  //인디케이터 값을 감지하도록 설정된 Rx bool.
  var isF5BtnClicked = false.obs;

  //새로고침 버튼 클릭시 호출.
  //value 를 true 로 만들어 인디케이터를 표시하고,
  //동시에 3초 딜레이 함수를 호출하여 3초 뒤에 값이 false 로 바뀌어 원상복귀 되도록 함.
  isF5() {
    isF5BtnClicked.value = true;
    Future.delayed(Duration(seconds: 3), () {
      isF5BtnClicked.value = false;
    });
  }

  @override
  void onInit() {
    super.onInit();
    //탭 컨트롤러 init
    tabController = TabController(vsync: this, length: myTabs.length);
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
