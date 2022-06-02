import 'package:flutter/material.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';

Widget getNotes() {
  return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Column(
          children: [
            Text('مسح'),
          ],
        ),
        Column(
          children: [
            Text('الاجمالي'),
          ],
        ),
        Column(
          children: [
            Text('رقم السيارة'),
          ],
        ),
        Column(
          children: [
            Text('التاريخ'),
          ],
        ),
        Column(
          children: [
            Text('رقم الفاتورة'),
          ],
        ),
      ],
    )
  ]);
}

Widget getNoteItems(Map task, context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: () {
              HomeCubit.get(context).deleteDatabase(id: task['id']);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.red,
            )),
        Text("${task['totalPriceServices']}"),
        Text("${task['carNumber']}"),
        Text("${task['date']}"),
        Text("${task['id']}"),
        
      ],
    ),
  );
}
