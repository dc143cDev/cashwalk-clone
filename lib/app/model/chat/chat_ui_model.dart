import 'package:cashwalkclone/app/model/chat/chat_data_model.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatUIModel extends StatelessWidget {
  const ChatUIModel({Key? key, this.model}) : super(key: key);

  final ChatModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 290,
      color: bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade200,
            height: 5,
            width: double.infinity,
          ),
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
          GestureDetector(
            //클릭시 댓글 작성을 위해 게시글 데이터를 map 으로 넘겨줌.
            //그래야만 별개의 페이지인 댓글 페이지에서 해당 페이지에 맞는 데이터를 그대로 가져올수 있음.
            onTap: () {
              Get.toNamed(
                '/chat-page',
                arguments: {
                  'title': model!.title,
                  'contents': model!.contents,
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 10, 13, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    model!.title!,
                    maxLines: 1,
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model!.contents!,
                    maxLines: 7,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 13, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '조회수',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
                SizedBox(
                  width: 240,
                ),
                Text(
                  '좋아요',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '댓글',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: bgColor),
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '좋아요',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: bgColor),
                  onPressed: () {
                    Get.toNamed(
                      '/chat-page',
                      arguments: {
                        'title': model!.title,
                        'contents': model!.contents,
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: bgColor,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 40,
                        ),
                        Icon(
                          Icons.comment,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '댓글달기',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
