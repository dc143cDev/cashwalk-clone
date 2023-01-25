import 'package:cashwalkclone/palette.dart';
import 'package:flutter/material.dart';

class BestProductUI extends StatelessWidget {
  const BestProductUI({Key? key, required this.assetPath, required this.price})
      : super(key: key);

  final String assetPath;
  final String price;

  //UI 용. 데이터 입력 안함. 모델 위젯도 비슷하게.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: regularMint,
          child: Center(
            child:
                SizedBox(width: 60, height: 60, child: Image.asset(assetPath)),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text('${price}캐시'),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
