import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendsInviteView extends GetView {
  const FriendsInviteView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendsInviteView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'FriendsInviteView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
