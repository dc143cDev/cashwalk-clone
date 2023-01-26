import 'package:flutter/material.dart';

import '../../palette.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key, required this.appBarText}) : super(key: key);

  final String appBarText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: textDark),
      title: Text(
        appBarText,
        style: TextStyle(
            fontFamily: 'LS',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: accentYellow),
      ),
      centerTitle: false,
      elevation: 0,
      backgroundColor: bgColor,
    );
  }
}
