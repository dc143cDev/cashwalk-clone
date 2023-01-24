import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendsAcceptView extends GetView {
  const FriendsAcceptView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'FriendsAcceptView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
