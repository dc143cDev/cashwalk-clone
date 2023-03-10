import 'package:cashwalkclone/app/modules/coffee/controllers/coffee_controller.dart';
import 'package:cashwalkclone/app/modules/home/views/home_view.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: accentYellow,
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
              ),
              Center(
                child: Text(
                  'Cash Walk',
                  style: TextStyle(
                      fontFamily: 'LS',
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: bgColor),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 3,
                      color: bgColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 3,
                      color: bgColor,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      height: 3,
                      color: bgColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: controller.cmController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: accentYellow),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  fillColor: primaryLight,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.accessibility_new_sharp,
                    color: accentYellow,
                  ),
                  hintText: '?????? ??????????????????',
                ),
                validator: (email) {
                  if (email!.isEmpty) {
                    return '?????? ??????????????????.';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.weightController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: accentYellow),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.0),
                    ),
                  ),
                  fillColor: primaryLight,
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.accessibility_new_sharp,
                    color: accentYellow,
                  ),
                  hintText: '???????????? ??????????????????',
                ),
                validator: (password) {
                  if (password!.isEmpty) {
                    return '???????????? ??????????????????';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 60,
              ),
              SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accentBrown,
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    controller.isLoginBtnClicked();
                  },
                  child: Text(
                    'LOGIN',
                    style: TextStyle(letterSpacing: 4),
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Text(
                '- ??????????????? -',
                style: TextStyle(color: bgColor),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  '?????? ????????? ??????????????????.',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: bgColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
