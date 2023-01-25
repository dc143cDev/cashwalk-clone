import 'package:flutter/material.dart';

import '../../palette.dart';

class ShoppingCategory extends StatelessWidget {
  const ShoppingCategory(
      {Key? key,
      required this.onPressed,
      required this.iconAssetPath,
      required this.btnText})
      : super(key: key);

  final Function() onPressed;
  final String iconAssetPath;
  final String btnText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
              spreadRadius: 0.0,
              offset: Offset(0, 7),
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Image.asset(iconAssetPath),
              ),
              SizedBox(
                height: 10,
              ),
              Text(btnText),
            ],
          ),
        ),
      ),
    );
  }
}
