import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:flutter/material.dart';

import '../../palette.dart';
import '../modules/walk/controllers/walk_controller.dart';

class ProfileNCash extends StatelessWidget {
  const ProfileNCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UrlController urlController = UrlController();

    return Container(
      color: bgColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20,
          ),
          SizedBox(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  '${urlController.baseUrl}images/profile/cat1.jpg'),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text('내이름'),
          SizedBox(
            width: 140,
          ),
          SizedBox(
            width: 30,
            height: 30,
            child: CircleAvatar(
              backgroundColor: accentYellow,
              child: Text(
                'C',
                style: TextStyle(
                  fontFamily: 'LS',
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: bgColor,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '${WalkController.to.cashCount.value} 캐시',
            style: TextStyle(
              fontFamily: 'IBMKR',
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: textDark,
            ),
          ),
        ],
      ),
    );
  }
}
