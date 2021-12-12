import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/search/search.dart';
import 'package:news_app/widget.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MyAppPage extends StatelessWidget {
  MyAppPage({Key? key}) : super(key: key);

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (BuildContext context, NewsStates state) {},
        builder: (BuildContext context, NewsStates state) {
          NewsCubit cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              title: Text(
                cubit.titles[cubit.page],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: (){
                    navigateTo(context, SearchScreen());
                  },
                  icon: const Icon(
                    Icons.search,
                    size: 30.0,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                  onPressed: (){
                    NewsCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(
                    Icons.dark_mode,
                    size: 30.0,
                  ),
                ),
              ],
            ),
            body: Container(
              child: cubit.screens.elementAt(cubit.page),
              decoration: BoxDecoration(
                  color: Colors.greenAccent.withOpacity(0.4),
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0))),

            ),




            bottomNavigationBar: CurvedNavigationBar(
                height: 60.0,
                key: _bottomNavigationKey,
                index: cubit.page,
                items: const <Widget>[
                  Icon(
                    Icons.business,
                    color: Colors.black,
                    size: 22,
                  ),
                  Icon(
                    Icons.sports,
                    color: Colors.black,
                    size: 22,
                  ),
                  Icon(
                    Icons.science,
                    color: Colors.black,
                    size: 22,
                  ),
                  Icon(
                    Icons.health_and_safety,
                    color: Colors.black,
                    size: 22,
                  ),
                  Icon(
                    Icons.airplay_sharp,
                    color: Colors.black,
                    size: 22,
                  ),
                  Icon(
                    Icons.build,
                    color: Colors.black,
                    size: 22,
                  ),
                ],
                backgroundColor: Colors.greenAccent.withOpacity(0.4),
                letIndexChange: (index) => true,
                onTap: (index) => cubit.changeIndex(index)),
          );
        },
      );
  }
}
