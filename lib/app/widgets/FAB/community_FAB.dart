import 'package:cashwalkclone/app/modules/community/controllers/community_controller.dart';
import 'package:flutter/material.dart';

import '../../../palette.dart';

class CommunityFAB extends StatelessWidget {
  const CommunityFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CommunityController communityController = CommunityController();

    return FloatingActionButton(
      heroTag: 'main',
      backgroundColor: accentYellow,
      elevation: 10,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient:
                LinearGradient(colors: [accentYellow, Colors.yellow.shade600])),
        child: Center(
          child: Icon(Icons.post_add),
        ),
      ),
      onPressed: () {
        communityController.isFABClicked();
      },
    );
  }
}
