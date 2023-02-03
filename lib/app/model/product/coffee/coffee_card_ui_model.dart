import 'package:cashwalkclone/app/api/url_controller.dart';
import 'package:cashwalkclone/app/model/product/coffee/coffee_card_data_model.dart';
import 'package:cashwalkclone/palette.dart';
import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';

class CoffeeCardUIModel extends StatelessWidget {
  const CoffeeCardUIModel({Key? key, this.model}) : super(key: key);

  final CoffeeCardModel? model;

  @override
  Widget build(BuildContext context) {
    UrlController urlController = UrlController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CouponCard(
        height: 150,
        backgroundColor: accentYellow,
        curveAxis: Axis.vertical,
        firstChild: Container(
          decoration: const BoxDecoration(
            color: accentBrown,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Image.network(
                      '${urlController.baseUrl}${model!.imagePath!}'),
                ),
              ),
              const Divider(color: Colors.white54, height: 0),
              Expanded(
                child: Center(
                  child: Text(
                    '${model!.price!} 캐시',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        secondChild: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${model!.brand!}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '${model!.title!}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: accentBrown,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(),
              Text(
                '유효기간 30일',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
