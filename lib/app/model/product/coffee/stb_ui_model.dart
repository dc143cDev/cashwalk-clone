import 'package:cashwalkclone/app/model/product/coffee/stb_data_model.dart';
import 'package:flutter/material.dart';

import '../../../../palette.dart';

class StbUIModel extends StatelessWidget {
  const StbUIModel({Key? key, this.model}) : super(key: key);

  final StbProductModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 2,
              child: Text('rank'),
            ),
            Expanded(
              flex: 2,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://localhost:8000${model!.productImagePath!}'),
                radius: 30,
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model!.productName!),
                  SizedBox(
                    height: 3,
                  ),
                  Text('#소속'),
                  SizedBox(
                    height: 3,
                  ),
                  LinearProgressIndicator(),
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 6,
              child: Text(model!.productPrice!),
            ),
          ],
        ),
      ),
    );
  }
}
