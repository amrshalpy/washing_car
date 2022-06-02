import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text('الاعدادات '),
              centerTitle: true,
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 100, right: 12, left: 12),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: mainColor),
                      onPressed: () {
                        getName();
                      },
                      child: Text('ادخل اسم المغسلة')),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: mainColor),
                        onPressed: () {
                          HomeCubit.get(context).deleteallNotes();
                        },
                        child: Text('حذف الفواتير'))),
                SizedBox(
                  height: 20,
                ),

              ]),
            ),
          );
        });
  }

  void getName() {
    final alert = AlertDialog(
      content: Column(children: [
        buildFormField(
            controller: nameController,
            hint: 'اكتب اسم المغسلة',
            icon: Icons.local_car_wash_rounded),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
            onPressed: () {
              HomeCubit.get(context).name = nameController.text;
              nameController.clear();
              Navigator.pop(context);
            },
            child: Text('سجل '))
      ]),
    );
    showDialog(
        context: context,
        builder: (context) => Column(
              children: [
                alert,
              ],
            ));
  }
}
