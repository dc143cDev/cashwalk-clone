import 'package:cashwalkclone/app/widgets/custom_button_brown.dart';
import 'package:cashwalkclone/app/widgets/custom_button_yellow.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_dialog.dart';

class FriendsDialController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //초기값이 없어 발생하는 빌드 오류를 막기 위해 초기값을 미리 선언.
  //왜인지 onInit 에 넣었을때는 작동하지 않았음. 확인 필요.
  late AnimationController animationController =
      AnimationController(vsync: this, duration: Duration(seconds: 1));

  //speed dial 버튼 클릭시 감지 노티파이어.
  //애니메이션과 무관. 다이알 올라오는 기능 감지용.
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);

  var isPlaying = false.obs;

  //다이알 버튼 클릭시 선언된 애니메이션 컨트롤러 작동. 동시에 다이알 올라옴.
  isDialBtnClicked() {
    isDialOpen.value = true;
    animationController.forward();
  }

  //다이알 버튼 종료시 애니메이션 닫힘. 동시에 다이알 내려옴.
  isDialBtnClosed() {
    isDialOpen.value = false;
    animationController.reverse();
  }

  isAddBtnClicked() {
    Get.dialog(
      CustomDialog(
        titleText: '  친구 추가하기',
        dialogContent: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: accentYellow)),
                      focusColor: accentYellow,
                      fillColor: Colors.grey,
                      hintText: '추천코드로 친구를 찾아보세요',
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 55,
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '친구하고 싶은 사용자를 추천코드로 검색합니다.\n            이미 친구인 사용자를 검색하고\n        싶다면 아래의 버튼을 선택해주세요',
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
            SizedBox(
              height: 50,
            ),
            CustomButtonYellow(
              btnText: '친구 검색하러 가기',
              onPressed: () {
                Get.back();
                isSearchBtnClicked();
              },
            ),
            SizedBox(
              height: 250,
            ),
            SizedBox(
              width: 250,
              child: CustomButtonBrown(
                btnText: '확인',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  isSearchBtnClicked() {
    Get.dialog(
      CustomDialog(
        titleText: '친구 검색하기',
        dialogContent: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: accentYellow)),
                      focusColor: accentYellow,
                      fillColor: Colors.grey,
                      hintText: ' 친구 이름 검색하기            ',
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 55,
                    width: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentYellow,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '현재 친구가 되어있는 목록 중에 검색합니다.\n         새로운 친구 추가를 원하시면\n          아래의 버튼을 선택해주세요.',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonYellow(
              btnText: '친구 추가하러 가기',
              onPressed: () {
                Get.back();
                isAddBtnClicked();
              },
            ),
            SizedBox(
              height: 250,
            ),
            SizedBox(
              width: 250,
              child: CustomButtonBrown(
                btnText: '확인',
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  isControlBtnClicked() {
    Get.dialog(
      CustomDialog(
        titleText: '내가 보낸 요청',
        dialogContent: Column(
          children: [],
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
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
