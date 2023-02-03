import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/model/product/coffee/coffee_data_model.dart';
import 'package:flutter/material.dart';

import '../../../../palette.dart';

class YdyUIModel extends StatelessWidget {
  const YdyUIModel({Key? key, this.model}) : super(key: key);

  final CoffeeProductModel? model;

  @override
  Widget build(BuildContext context) {
    UrlController urlController = UrlController();

    return Container(
      height: 130,
      width: double.infinity,
      color: bgColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: SizedBox(
                width: 60,
                height: 90,
                child: Container(
                  child: Image.network(
                    '${urlController.baseUrl}${model!.productImagePath!}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 13,
            ),
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    model!.productBrand!,
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  Text(model!.productName!),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 9,
                        backgroundColor: accentYellow,
                        child: Text(
                          'C',
                          style: TextStyle(
                              fontFamily: 'LS',
                              fontWeight: FontWeight.w700,
                              color: bgColor),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(model!.productPrice!.toString()),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
