import 'package:flutter/material.dart';

class PageUnit extends StatelessWidget {
  const PageUnit({Key? key, this.assetImage}) : super(key: key);

  final AssetImage? assetImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: assetImage!,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
