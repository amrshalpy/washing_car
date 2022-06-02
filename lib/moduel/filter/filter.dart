import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:washing/compnement/compnemnet/widgets.dart';
import 'package:washing/moduel/filter/widget/get_filter.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/cubit/home_state.dart';
import 'package:washing/moduel/last_note/widgets/get_notes.dart';

class FilterSearch extends StatelessWidget {
  FilterSearch({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.get(context);
          return Scaffold(
              appBar: AppBar(
                title: Text('تقرير الفواتير '),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      getNotes(),
                      cubit.filteredTasks.isNotEmpty
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  getNoteItems(cubit.filteredTasks[index], context),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 10,
                                  ),
                              itemCount: cubit.filteredTasks.length)
                          : Center(
                              child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: mainColor,
                            )),
                    ],
                  ),
                ),
              ));
        });
  }
}
