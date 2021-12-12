// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/cache_helper.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/screens/business.dart';
import 'package:news_app/screens/entertainment.dart';
import 'package:news_app/screens/health.dart';
import 'package:news_app/screens/science.dart';
import 'package:news_app/screens/sports.dart';
import 'package:news_app/screens/technology.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              business = value.data['articles'],
              print(business[0]),
              emit(NewsGetBusinessSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              sports = value.data['articles'],
              print(sports[0]),
              emit(NewsGetSportsSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              science = value.data['articles'],
              print(science[0]),
              emit(NewsGetScienceSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];
  void getHealth() {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'health',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              health = value.data['articles'],
              print(health[0]),
              emit(NewsGetHealthSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> technology = [];
  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'technology',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              technology = value.data['articles'],
              print(technology[0]),
              emit(NewsGetTechnologySuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];
  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'entertainment',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    )
        .then((value) => {
              //print(value.data['articles']),
              entertainment = value.data['articles'],
              print(entertainment[0]),
              emit(NewsGetEntertainmentSuccessState()),
            })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetEntertainmentErrorState(error.toString()));
    });
  }


  List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        'apiKey': 'da2217f76a4b4a499b2d4a56efedd6e5',
      },
    ).then((value) => {
      //print(value.data['articles']),
      search = value.data['articles'],
      print(search[0]),
      emit(NewsGetSearchSuccessState()),
    })
        .catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  List<String> titles = [
    'Business',
    'Sports',
    'Science',
    'Health',
    'Entertainment',
    'Technology',
  ];

  List<Widget> screens = [
    const Business(),
    const Sports(),
    const Science(),
    const Health(),
    const Entertainment(),
    const Technology(),
  ];

  int page = 0;
  void changeIndex(value) {
    page = value;
    emit(NewsChangePageState());
  }

  bool isDark = false;
  void changeAppMode() {

      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) =>
      {
        emit(NewsChangeAppModeState()),
      }
          );
    }
  }

