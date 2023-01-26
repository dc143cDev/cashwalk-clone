import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class UserUIModel extends StatelessWidget {
  const UserUIModel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text('rank'),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.png'),
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
                children: [
                  Text('유저(data)'),
                  SizedBox(
                    height: 3,
                  ),
                  Text('#소속'),
                  SizedBox(
                    height: 3,
                  ),
                  LinearProgressIndicator(),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 6,
              child: Text('asdf'),
            ),
          ],
        ),
      ),
    );
  }
}
