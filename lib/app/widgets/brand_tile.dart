import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

//브랜드 circle avatar ui 모델.
//클릭시 실행할 함수, 센터 차일드, 이름을 객체로 받음.
class BrandTile extends StatelessWidget {
  const BrandTile(
      {Key? key,
      required this.brandChild,
      required this.brandName,
      required this.onTap})
      : super(key: key);

  final Widget brandChild;
  final String brandName;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70,
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade300,
                      spreadRadius: 5)
                ],
              ),
              child: CircleAvatar(
                backgroundColor: bgColor,
                radius: 22,
                child: SizedBox(
                  width: 35,
                  height: 35,
                  child: Center(child: brandChild),
                ),
              ),
            ),
            Text(brandName),
          ],
        ),
      ),
    );
  }
}
