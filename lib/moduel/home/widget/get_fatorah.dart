import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/model/fatorah.dart';
import 'package:washing/moduel/home/details/details.dart';
import 'package:flutter/widgets.dart';

Widget getFatorah({
  String? image,
  String? title,
}) {
  return Container(
    height: 170,
    width: double.infinity,
    decoration: BoxDecoration(
      border: Border.all(width: .2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(children: [
      SizedBox(
        height: 20,
      ),
      Image.asset(image!,
      height: 100,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        title!,
        style: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
    ]),
  );
}
