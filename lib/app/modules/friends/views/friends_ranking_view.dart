import 'package:cashwalkclone/app/model/user/me_ui_model.dart';
import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';
import 'package:cashwalkclone/app/modules/friends/controllers/friends_controller.dart';
import 'package:cashwalkclone/app/modules/friends/controllers/friends_data_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../model/product/coffee/stb_ui_model.dart';
import '../../../model/user/user_ui_model.dart';

class FriendsRankingView extends GetView<FriendsDataController> {
  const FriendsRankingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(FriendsDataController());

    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MeUIModel(),
          Container(
            width: double.infinity,
            color: Colors.grey.shade400,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text('지금 친구신청이 가능한 친구를 소개합니다'),
                  SizedBox(
                    width: 70,
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Obx(
                      () => FloatingActionButton(
                        elevation: 0,
                        child: controller.isF5BtnClicked.value == false
                            ? Icon(Icons.refresh)
                            : SizedBox(
                                width: 10,
                                height: 10,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                        backgroundColor: Colors.grey.shade400,
                        onPressed: () {
                          controller.isF5();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: controller.obx(
              (data) => ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  //UI 모델에 데이터 세부값을 인덱스로 넘기기
                  var details = data?[index];
                  //디테일 값은 받은 User UI 모델이 아이템 빌더로 빌드됨.
                  return UserUIModel(
                    model: details,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
