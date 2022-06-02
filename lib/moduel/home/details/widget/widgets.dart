import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/model/list.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

getData(BuildContext context, task, int index) {
  final alert = AlertDialog(
    content: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${task['carSize']}"),
          ),
          SizedBox(
            width: 19,
          ),
          Text('حجم السياره'),
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
            child: Text("${task['washingKind']}"),
          ),
          SizedBox(
            width: 19,
          ),
          Text('نوع الغسيل'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 60,
            decoration: BoxDecoration(
              border: Border.all(width: .3),
            ),
            child: Text("${task['totalPriceServices']}" + " ريال "),
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
          task['countServices'] == 'مجانية'
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  width: 60,
                  child: Text("${task['discount']}" + " ريال "))
              : Container(
                  width: 60,
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  child: Text("${task['totalPriceServices']}" + " ريال "),
                ),
          SizedBox(
            width: 19,
          ),
          Text(' بعد الخصم'),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              getDetails(context, HomeCubit.get(context).tasks[index]);
            },
            color: Colors.blue,
            child: Text('تاكيد'),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color.fromARGB(255, 223, 122, 115),
            child: Text('الغاء'),
          ),
        ],
      ),
    ]),
  );
  return showDialog(
      context: context,
      builder: (context) => Center(
            child: Container(
              child: Column(children: [alert]),
            ),
          ));
}

void getDetails(context, Map task) {
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
            child: Text("${task['id']}"),
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
            child: Text("${task['date']}"),
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
            child: Text("${task['carNumber']}"),
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
            child: Text("${task['carKind']}"),
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
            child: Text("${task['washingKind']}"),
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
            child: Text("${task['carSize']}"),
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
            child: Text("${task['totalPriceServices']}" + " ريال "),
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
          task['countServices'] == 'مجانية'
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  width: 60,
                  child: Text("${task['discount']}" + " ريال "),
                )
              : Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .3),
                  ),
                  width: 60,
                  child: Text("${task['totalPriceServices']}" + " ريال "),
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
}

// Widget getKindWash(
//   context,
//   WashKind kind,
// ) {
//   return Row(
//     children: [
//       Text('${kind.title}'),
//       Radio(
//           value: kind.value!,
//           groupValue: HomeCubit.get(context).radioVal,
//           onChanged: (val) {
//             HomeCubit.get(context).changeRadio(val);
//           })
//     ],
//   );
// }

Widget getItems(String count, dynamic washingKind, Function() onpress) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
          onPressed: onpress,
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          )),
      Text(
        count,
        style: TextStyle(
          fontWeight: FontWeight.w800,
          color: mainColor,
          fontSize: 16,
        ),
      ),
      Text(
        washingKind.toString(),
        style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 16,
        ),
      ),
    ],
  );
}

Widget getKind(WashKind kind) {
  return Row(
    children: [
      Text(
        '${kind.title}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
}

class BoxData extends StatelessWidget {
  String txt;
  BoxData({
    required this.txt,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: .3),
      ),
    );
  }
}
