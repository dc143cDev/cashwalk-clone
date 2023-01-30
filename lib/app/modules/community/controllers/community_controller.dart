import 'dart:convert';

import 'package:cashwalkclone/app/modules/community/views/community_write_view.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CommunityController extends GetxController {
  var formKey = GlobalKey<FormState>();

  //제목 내용 작성자 받아줄 컨트롤러들.
  var titleController = TextEditingController();
  var contentController = TextEditingController();
  var writerNameController = TextEditingController();

  //소속 표시.
  List<String> chatAffiliation = [
    '달리기모임',
    '안달리는모임',
    '잘달리는모임',
    '그냥모임',
  ];

  createPost() async {
    var url = "http://localhost:8000/createPost";
    final postJson = jsonEncode({
      "chat_title": titleController.value,
      "chat_contents": contentController.value,
      "chat_writer": writerNameController.value,
    });
    print(postJson);
    try {
      var res = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: postJson,
      );
      if (res.statusCode == 200) {
        var resSignup = jsonDecode(res.body);
        if (resSignup['success'] == true) {
          print('게시글 작성 완료');
        } else {}
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //커뮤니티 FAB
  isFABClicked() {
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: accentYellow,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: 55,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              //상단 바.
              //취소, 작성완료 텍스트버튼.
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      '취소',
                      style: TextStyle(
                        color: textDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Text('글쓰기'),
                  SizedBox(
                    width: 100,
                  ),
                  TextButton(
                    onPressed: () {
                      //작성
                      Get.back();
                    },
                    child: Text(
                      '작성완료',
                      style: TextStyle(
                        color: textDark,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: CircleAvatar(),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 40,
                    width: 280,
                    child: TextFormField(
                      controller: titleController,
                      autofocus: true,
                      decoration: InputDecoration.collapsed(
                        hintText: '제목(선택사항)',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      maxLength: 16,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            width: double.infinity,
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Container(
              width: 340,
              height: 300,
              child: TextFormField(
                maxLines: 8,
                maxLength: 100,
                decoration: InputDecoration.collapsed(
                  hintText: '내용',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
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
