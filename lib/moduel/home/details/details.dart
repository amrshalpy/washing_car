import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/model/list.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';
import 'package:washing/moduel/home/details/widget/get_items.dart';
import 'package:washing/moduel/home/details/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Details extends StatelessWidget {
  int index = 0;
  Details({Key? key, index}) : super(key: key);
  var txtController = TextEditingController();
  var countController = TextEditingController();
  List<String> kinds = ['حجم كبير', 'حجم صغير', 'ديانا'];
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formatter = DateFormat.yMMMd().format(now);

    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'فاتورة جديدة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'رقم السياره',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(width: .4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            borderWidth: .1,
                            inactiveFillColor: Colors.grey.shade100,
                            selectedFillColor: Colors.white,
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 40,
                            fieldWidth: 60,
                            activeFillColor: Colors.white,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          controller: txtController,
                          onCompleted: (v) {
                            print("Completed");
                          },
                          onChanged: (value) {},
                          beforeTextPaste: (text) {
                            print("Allowing to paste $text");
                            return true;
                          },
                          appContext: context,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('التكلفه'),
                    SizedBox(
                      height: 2,
                    ),
                    DropdownButtonFormField(
                        items: cubit.lists
                            .map<DropdownMenuItem<String>>(
                                (String val) => DropdownMenuItem(
                                      child: Text(val),
                                      value: val,
                                    ))
                            .toList(),
                        value: cubit.dropVal,
                        onChanged: (val) {
                          cubit.onChanged(val);
                        }),
                    Text('نوع الغسيل'),
                    SizedBox(
                      height: 2,
                    ),
                    cubit.isFree
                        ? DropdownButtonFormField(
                            items: cubit.listsKind
                                .map<DropdownMenuItem<String>>(
                                    (String val) => DropdownMenuItem(
                                          child: Text(val),
                                          value: val,
                                        ))
                                .toList(),
                            value: cubit.dropValKind,
                            onChanged: (val) {
                              cubit.onChangedKind(val);
                            })
                        : Text('بستم'),
                    SizedBox(
                      height: 2,
                    ),
                    if (cubit.isKind == false)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('حجم السياره'),
                          Container(
                              height: 40,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          cubit.changevalue(index);
                                          print(kinds[index]);
                                        },
                                        child: Container(
                                          width: 90,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            border: Border.all(),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: cubit.radioVal == index
                                                ? subColor
                                                : Colors.white,
                                          ),
                                          child: Center(
                                            child: Text(
                                              '${kinds[index]}',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 20,
                                    ),
                                    itemCount: kinds.length,
                                  )
                                  // Expanded(
                                  //   child: RadioListTile(
                                  //     title: Text(
                                  //       'ديانا',
                                  //       style: TextStyle(
                                  //           fontSize: 13,
                                  //           fontWeight: FontWeight.w700),
                                  //     ),
                                  //     value: 1,
                                  //     groupValue: cubit.radioVal,
                                  //     activeColor: cubit.radioVal== 1?mainColor:Colors.white,
                                  //     onChanged: (value) {
                                  //       cubit.changeRadio(value);
                                  //     },
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //
                                  //   child: Row(
                                  //     children: [
                                  //       Text(
                                  //       'حجم صغير',
                                  //       style: TextStyle(
                                  //           fontSize: 12,
                                  //           fontWeight: cubit.radioVal== 2?FontWeight.w900: FontWeight.w500),
                                  //     ),
                                  //       Radio(
                                  //         value: 2,
                                  //         activeColor: cubit.radioVal== 2?mainColor:Colors.white,
                                  //         groupValue: cubit.radioVal,
                                  //         onChanged: (value) {
                                  //           cubit.changeRadio(value);
                                  //         },
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // Expanded(
                                  //   child: Row(
                                  //     children: [
                                  //        Text(
                                  //       'حجم كبير',
                                  //       style: TextStyle(
                                  //           fontSize: 12,
                                  //           fontWeight:cubit.radioVal ==3? FontWeight.w900:FontWeight.w500),
                                  //     ),
                                  //       // Radio(
                                  //
                                  //       //   value: 3,
                                  //       //   groupValue: cubit.radioVal,
                                  //       //   activeColor: cubit.radioVal== 3?mainColor:Colors.white,
                                  //       //   onChanged: (value) {
                                  //       //     cubit.changeRadio(value);
                                  //       //   },
                                  //       // ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              )),
                        ],
                      ),

                    SizedBox(
                      height: 10,
                    ),

                    Text('خدمات اخري'),
                    Container(
                      color: Colors.grey.shade200,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text('التكلفه'),
                                TextField(
                                  controller: countController,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 17,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text('الخدمه'),
                                DropdownButtonFormField(
                                    value: cubit.servicesVal,
                                    items: cubit.services
                                        .map<DropdownMenuItem<String>>(
                                            (String val) => DropdownMenuItem(
                                                  child: Text(val),
                                                  value: val,
                                                ))
                                        .toList(),
                                    onChanged: (val) {
                                      cubit.onChangedservices(val);
                                    })
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('التكلفه'),
                        Text('الخدمه'),
                      ],
                    ),
                    // SizedBox(
                    //   height: 1,
                    // ),
                    Container(
                      height: 140,
                      child: Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              decoration:
                                  BoxDecoration(border: Border.all(width: .2)),
                              height: 120,
                              width: double.infinity,
                              child: Column(children: [
                                if (cubit.isButton)
                                  getItems(
                                      cubit.servicesPrice.toString(), cubit.servicesVal,
                                      () {
                                    cubit.addItems();
                                    countController.clear();
                                  }),
                              ]),
                            ),
                          ),
                          cubit.isButton == false
                              ? CircleAvatar(
                                  backgroundColor: mainColor,
                                  child: IconButton(
                                      onPressed: () {
                                        cubit.addItems();
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      )),
                                )
                              : CircleAvatar(
                                  backgroundColor: Colors.grey.shade100,
                                  child: IconButton(
                                      onPressed: () {
                                        Fluttertoast.showToast(
                                            msg: "لقد اضفت هذا العنصر من قبل",
                                            toastLength: Toast.LENGTH_LONG,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 2,
                                            backgroundColor: subColor,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.blue,
                                      )),
                                ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CheckboxListTile(
                            value: cubit.check,
                            onChanged: (value) {
                              cubit.changeCheck(value);
                            },
                            activeColor: mainColor,
                            title: Text(
                              'تسليم السيارة',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            value: cubit.chekbox,
                            onChanged: (value) {
                              cubit.changeCheckBox(value);
                            },
                            activeColor: mainColor,
                            title: Text('تم دفع الحساب',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w800)),
                          ),
                        ),
                      ],
                    ),

                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: mainColor,
                          ),
                          onPressed: () {
                            if (txtController.text == '') {
                              Fluttertoast.showToast(
                                  msg: "برجاء ادخال رقم السيارة",
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 2,
                                  backgroundColor: Colors.orangeAccent,
                                  textColor: Colors.white,
                                  fontSize: 16.0);
                            }else{
                            cubit.insertDatabse(
                              discount: cubit.totalPriceServicesDisount,
                              pay: cubit.chekbox,
                              recieve: cubit.check,
                              totalPriceServices: cubit.totalPriceServices,
                              carNumber: txtController.text,
                              carSize: cubit.dropValKind,
                              countServices: cubit.dropVal.toString(),
                              carKind: kinds[cubit.radioVal],
                              washingKind: cubit.servicesVal,
                              date: formatter,
                              count: countController.text,
                            );
                            cubit.isButton = true;

                            getData(context, cubit.tasks[index], index);
                          }
                          },
                          child: Text(
                            'تسجيل',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w700),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
