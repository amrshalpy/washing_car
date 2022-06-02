import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';
import 'package:washing/moduel/last_note/widgets/get_notes.dart';

class Informations extends StatelessWidget {
  Informations({Key? key}) : super(key: key);
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
                title: Text('الاسنعلامات '),

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
                              itemCount: cubit.tasks.length)
                          :  Column(
                        children: [
                          SizedBox(height: 30,),
                          Container(
                            height: 350,
                            width: double.infinity,
                            child: Image(image: AssetImage('assets/images/yy.jpg',

                            ),
                              height: 350,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )
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

}
