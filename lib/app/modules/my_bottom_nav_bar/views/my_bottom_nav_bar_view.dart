import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_bottom_nav_bar_controller.dart';

class MyBottomNavBarView extends GetView<MyBottomNavBarController> {
  const MyBottomNavBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        // 요소(item)을 탭 할 시 실행)
        onTap: controller.changeIndex,
        // 선택에 따라 icon·label 색상 변경
        selectedItemColor: accentYellow,
        unselectedItemColor: mainGrey,
        // 선택에 따라 label text style 변경
        unselectedLabelStyle: TextStyle(fontSize: 10),
        selectedLabelStyle:
            TextStyle(fontFamily: 'LS', fontWeight: FontWeight.w700),
        // 탭 애니메이션 변경 (fixed: 없음)
        backgroundColor: bgColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 0
                  ? Icon(
                      Icons.home,
                      color: accentYellow,
                    )
                  : Icon(
                      Icons.home,
                      color: mainGrey,
                    ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 1
                  ? Icon(
                      Icons.people,
                    )
                  : Icon(
                      Icons.people,
                    ),
              label: "Friends"),
          BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 2
                  ? Icon(
                      Icons.health_and_safety,
                      color: accentYellow,
                    )
                  : Icon(
                      Icons.health_and_safety,
                      color: mainGrey,
                    ),
              label: "Health"),
          BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 3
                  ? Icon(
                      Icons.comment_rounded,
                      color: accentYellow,
                    )
                  : Icon(
                      Icons.comment_rounded,
                      color: mainGrey,
                    ),
              label: "Community"),
          BottomNavigationBarItem(
              icon: controller.selectedIndex.value == 4
                  ? Icon(
                      Icons.newspaper,
                      color: accentYellow,
                    )
                  : Icon(
                      Icons.newspaper,
                      color: mainGrey,
                    ),
              label: "News"),
        ],
      ),
    );
  }
}
