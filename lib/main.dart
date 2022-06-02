import 'package:washing/compnement/const/const.dart';
import 'package:washing/moduel/home/cubit/home_cubit.dart';
import 'package:washing/moduel/home/home.dart';
import 'package:washing/share/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'compnement/compnemnet/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await CacheHelper.init();
  uid = CacheHelper.getData(key: kuid);
  print(uid);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          // BlocProvider<LoginCubit>(create: (context) => LoginCubit())
          BlocProvider<HomeCubit>(create: (context) => HomeCubit()..createDatabase())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(appBarTheme: AppBarTheme(
              backwardsCompatibility: true,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: mainColor,
        statusBarBrightness:Brightness.light ,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarColor: Colors.white
              ),
              elevation: 0,
              backgroundColor: mainColor,
          )),
          title: 'fatorah',
          home:Home(),
        ));
  }
}
