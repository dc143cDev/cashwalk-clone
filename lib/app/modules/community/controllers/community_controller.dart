import 'dart:convert';

import 'package:flutter/cupertino.dart';
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
