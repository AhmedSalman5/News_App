

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/widget.dart';

// لينك ال Api للبحث
//https://newsapi.org/v2/everything?q=apple&apiKey=6fc46fe75d5249e3ba13dca9f6ea3624

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {

        var list = NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (String? value){
                    if(value!.isEmpty){
                      return 'search must be not empty';
                    }
                    return null;
                  },
                  onChanged: (value){
                     NewsCubit.get(context).getSearch(value);
                  },
                  decoration: const InputDecoration(
                    label: Text('Search'),

                    prefix: Icon(Icons.search),

                  ),
                  ),
                ),
              Expanded(child: articleBuilder(list,isSearch: true,))
            ],
          ),
        );
      },

    );
  }
}
