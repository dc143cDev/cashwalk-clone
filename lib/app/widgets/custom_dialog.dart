import 'package:flutter/material.dart';

import '../../palette.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog(
      {Key? key, required this.titleText, required this.dialogContent})
      : super(key: key);

  final String titleText;
  final Widget dialogContent;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        titlePadding: EdgeInsets.fromLTRB(86, 40, 8, 8),
        contentPadding: EdgeInsets.all(18),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            fontFamily: 'IBMKR',
            color: textDark),
        title: Text(titleText),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        content: dialogContent);
  }
}
