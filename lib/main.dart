import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/cache_helper.dart';
import 'package:news_app/network/dio_helper.dart';

import 'cubit/bloc_observe.dart';
import 'my_home_page.dart';

void main() async{

  // بيتاكد تن كل حاجه في  ال method  خلصت قبل ميعمل  البرنامج  run
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  await CacheHelper.init();
  // دي عشان اخليه اول ميفتح في البدايه خالص يفتح dark
 // bool? isDark = CacheHelper.getBoolean(key: 'isDark');


  BlocOverrides.runZoned(
        () {
          runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );

}

class MyApp extends StatelessWidget {
   const MyApp({Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => NewsCubit()
      ..changeAppMode()
      ..getBusiness()
      ..getSports()
      ..getScience()
      ..getHealth()
      ..getEntertainment()
      ..getTechnology(),


    child:  BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,

              theme: ThemeData(
                primarySwatch: Colors.green,
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor: Colors.white,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  //دا بخليه false  عشان اعرف اتحكم في statusBar
                  backwardsCompatibility: false,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    //لون ال statusBar
                    statusBarColor: Colors.white,
                    // لون ايكونات ال statusBar
                    statusBarIconBrightness: Brightness.dark,
                  ),
                ),
                scaffoldBackgroundColor: Colors.white,
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

              ),

              darkTheme: ThemeData(
                primarySwatch: Colors.green,
                scaffoldBackgroundColor: HexColor('333739'),
                appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  backgroundColor: Colors.transparent ,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  //دا بخليه false  عشان اعرف اتحكم في statusBar
                  backwardsCompatibility: false,
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    //لون ال statusBar
                    statusBarColor:  Colors.transparent,
                    // لون ايكونات ال statusBar
                    statusBarIconBrightness: Brightness.light,
                  ),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey,
                  backgroundColor: Colors.transparent,
                ),
                textTheme: const TextTheme(
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),

              themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark :ThemeMode.light,
              home: MyAppPage());
        },
    ));
  }
}




