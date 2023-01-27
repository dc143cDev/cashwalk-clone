import 'package:cashwalkclone/app/model/product/coffee/stb_ui_model.dart';
import 'package:cashwalkclone/app/model/user/user_ui_model.dart';
import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CoffeeBrandStbView extends GetView<CoffeeController> {
  const CoffeeBrandStbView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 20,
              child: Container(
                color: Colors.grey.shade300,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    'STB',
                    style:
                        TextStyle(color: textDark, fontWeight: FontWeight.w300),
                  ),
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
                    return StbUIModel(
                      model: details,
                    );
                  },
                ),
                // onError: (err) => Text('e'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
