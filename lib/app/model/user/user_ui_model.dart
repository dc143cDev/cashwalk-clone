import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/model/user/user_data_model.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class UserUIModel extends StatelessWidget {
  const UserUIModel({Key? key, this.model}) : super(key: key);

  final UserModel? model;

  @override
  Widget build(BuildContext context) {
    UrlController urlController = UrlController();

    return Container(
      height: 80,
      width: double.infinity,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text(model!.ranking.toString()),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage('${urlController.baseUrl}${model!.profile!}'),
                radius: 30,
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(model!.userName!),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    model!.affiliation!,
                    style: TextStyle(fontSize: 10),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  // LinearProgressIndicator(),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 6,
              child: Text(model!.userEmail!),
            ),
          ],
        ),
      ),
    );
  }
}
