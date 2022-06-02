import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/model/fatorah.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';
import 'package:washing/moduel/home/details/details.dart';
import 'package:washing/moduel/home/widget/get_fatorah.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing/moduel/home/widget/get_search.dart';
import 'package:washing/moduel/informations/informations.dart';
import 'package:washing/moduel/last_note/last_note.dart';
import 'package:washing/moduel/settings/settings.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  var txtController = TextEditingController();
  var mainKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
            key: mainKey,
            drawer: Drawer(
              child: ListView(children: [
                Container(
                  color: subColor,
                  child: DrawerHeader(
                      child: Container(
                    height: 120,
                    width: double.infinity,
                    color: subColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Text(
                        'مغسلة السيارات',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  )),
                )
              ]),
            ),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    mainKey.currentState!.openDrawer();
                  },
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              nextPage(context: context, page: Details());
                            },
                            child: getFatorah(
                                image: "assets/images/icons8-invoice-64.png",
                                title: "فاتورة جديدة"))),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        nextPage(context: context, page: LastNote());
                      },
                      child: getFatorah(
                          image: 'assets/images/icons8-invoices-60.png',
                          title: 'فاتورة سابقه'),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        nextPage(context: context, page: Informations());
                      },
                      child: getFatorah(
                          image: 'assets/images/icons8-invoices-64.png',
                          title: 'الاستعلامات'),
                    )),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        nextPage(context: context,page: Settings());
                      },
                      child: getFatorah(
                          image: 'assets/images/icons8-invoice-64 (2).png',
                          title: 'الاعدادات'),
                    )),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Stack(
                  children: [
                    Container(
                      height: 140,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.all(width: .2)),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Column(children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 20,
                                child: TextField(
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.search),
                                      hintText: 'بحث',
                                      contentPadding: EdgeInsets.only(left: 10),
                                      border: OutlineInputBorder()),
                                  controller: txtController,
                                  onChanged: (String items) {
                                    cubit.searchNote(items);
                                  },
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: mainColor),
                                    onPressed: () {},
                                    child: Text('طباعة')),
                              ),
                            ],
                          )
                        ]),
                      ),
                    ),
                    if (cubit.searching != null && txtController.text != '')
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 70,
                        ),
                        child: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 243, 242, 242),
                            border: Border.all(width: .2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 250,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemCount: cubit.searching.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                            height: 10,
                                          ),
                                      itemBuilder: (context, index) =>
                                          getSearch(
                                              cubit.searching[index], context)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ]),
            ),
          );
        });
  }
}
