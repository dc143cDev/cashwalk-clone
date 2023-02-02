import 'package:cashwalkclone/app/model/chat/chat_data_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../palette.dart';

class ChatPageView extends GetView {
  const ChatPageView({Key? key, this.model}) : super(key: key);

  final ChatModel? model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: textDark),
        title: Text(
          'Comment',
          style: TextStyle(
              fontFamily: 'LS',
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: accentYellow),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: bgColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(13.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      'http://localhost:8000/images/profile/cat1.jpg'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('내이름'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 10, 13, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${Get.arguments['title']}',
                  maxLines: 1,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${Get.arguments['contents']}',
                  maxLines: 7,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            color: Colors.grey.shade200,
            height: 5,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
