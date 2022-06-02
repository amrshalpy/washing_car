import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/moduel/filter/filter.dart';
import 'package:washing/moduel/filter/widget/get_filter.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';
import 'package:washing/moduel/last_note/widgets/get_notes.dart';

class LastNote extends StatelessWidget {
  LastNote({Key? key}) : super(key: key);
  var maxController = TextEditingController();
  var minController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('تقرير الفواتير '),
                actions: [
                  InkWell(
                    onTap: () {
                      getFilter(context);
                    },
                    child: Container(
                      height: 20,
                      width: 50,
                      child: Image.asset(
                        'assets/images/icons8-filter-64.png',
                        height: 20,
                        width: 50,
                      ),
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      getNotes(),
                      cubit.tasks.isNotEmpty
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  getNoteItems(cubit.tasks[index], context),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: cubit.tasks.length<20?cubit.tasks.length:20)
                          : Column(
                        children: [
                          SizedBox(height: 30,),

                          Container(
                            height: 350,
                            width: double.infinity,
                            child: Image.asset('assets/images/nn.jpg',
                            height: 350,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 50,),
                          Container(child: CupertinoActivityIndicator()),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  getFilter(context) {
    final alert = AlertDialog(
      content: Column(children: [
        Text(
          'اضغط لاختيار بداية ونهاية البحث',
          style: TextStyle(
              color: mainColor, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('من'),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate:DateTime.now(),
                        firstDate:  DateTime(2000, 1, 1),
                        lastDate: DateTime.parse('2060-01-01'))
                    .then((value) => {
                          minController.text =
                              DateFormat.yMMMd().format(value!),
                        });
              },
              controller: minController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text('الي'),
            SizedBox(
              height: 10,
            ),
            TextField(
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:  DateTime(2000, 1, 1),
                        lastDate: DateTime.parse('2025-01-01'))
                    .then((value) => {
                          maxController.text =
                              DateFormat.yMMMd().format(value!),
                        });
              },
              controller: maxController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              onPressed: () {
             Navigator.pop(context);

                HomeCubit.get(context)
                    .filterSearch(minController.text, maxController.text);
                              nextPage(context: context, page: FilterSearch());

              },
              color: subColor,
              child: Container(
                  height: 30,
                  width: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'حفظ ',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Container(
                  height: 30,
                  width: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'الغاء',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )),
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
}
