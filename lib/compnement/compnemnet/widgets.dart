import 'package:flutter/material.dart';

Widget buildFormField({
  TextEditingController? controller,
  String? hint,
  String? lable,
  IconData? icon,
}) {
  return TextFormField(
    controller: controller,
    validator: (String? val) {
      if (val!.isEmpty) {
        return 'this field must be not empty';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: hint,
      labelText: lable,
      prefixIcon: Icon(icon),
    ),
  );
}

nextPage({
  BuildContext? context,
  Widget? page,
}) {
  Navigator.push(context!, MaterialPageRoute(builder: (context) => page!));
}

nextPageUntil({
  BuildContext? context,
  Widget? page,
}) {
  Navigator.pushAndRemoveUntil(context!,
      MaterialPageRoute(builder: (context) => page!), (route) => false);
}

Color mainColor = Color(0xff008773);
Color subColor = Color.fromARGB(255, 158, 210, 192);
