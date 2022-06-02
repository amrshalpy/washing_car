import 'package:flutter/material.dart';
import 'package:washing/moduel/get_fatorah/get_fatorah.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/details/widget/widgets.dart';

Widget getSearch(searching, context) {
  return InkWell(
    onTap: () {
      final alert = AlertDialog(
           content: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      SizedBox(
        height: 20,
      ),
      Container(
        decoration: BoxDecoration(
          border: Border.all(width: .3),
        ),
        width: double.infinity,
        child: Center(
            child: Text(
          " مغسلة " + "${HomeCubit.get(context).name}",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['id']}"),
          ),
          SizedBox(
            width: 19,
          ),
          Text(' رقم الفاتورة'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['date']}"),
          ),
          SizedBox(
            width: 19,
          ),
          Text(' :التاريخ'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['carNumber']}"),
          ),
          SizedBox(
            width: 19,
          ),
          Text('رقم السياره'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            width: 60,
            child: Text("${HomeCubit.get(context).sizeCarPrice}" + " ريال "),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['carKind']}"),
          ),
          Text(' نوع السيارة'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            width: 60,
            child: Text("${HomeCubit.get(context).servicesPrice}" + " ريال "),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['washingKind']}"),
          ),
          Text(' نوع الغسيل'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            width: 60,
            child: Text("${HomeCubit.get(context).carKindPrice}" + " ريال "),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${searching['carSize']}"),
          ),
          Text('حجم  السياره'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            width: 60,
            child: Text("${searching['totalPriceServices']}" + " ريال "),
          ),
          SizedBox(
            width: 19,
          ),
          Text(' الاجمالي'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          searching['countServices'] == 'مجانية'
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  width: 60,
                  child: Text("${searching['discount']}" + " ريال "),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  width: 60,
                  child: Text("${searching['totalPriceServices']}" + " ريال "),
                ),
          SizedBox(
            width: 19,
          ),
          Text(' بعد الخصم'),
        ],
      ),
    ]),
  );
  showDialog(
    context: context,
    builder: (context) => Column(
      children: [
        alert,
      ],
    ),
  );

    },
    child: Row(
      children: [
        BoxData(txt: "${searching['carNumber']}"),
        Text("رقم السيارة"),
      ],
    ),
  );
}
