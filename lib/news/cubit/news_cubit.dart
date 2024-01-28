import 'package:chatty/news/cubit/news_state.dart';
import 'package:chatty/news/data/doi_helper.dart';
import 'package:chatty/news/data/shared_preference.dart';
import 'package:chatty/news/screens/business_screen.dart';
import 'package:chatty/news/screens/science_screen.dart';
import 'package:chatty/news/screens/setting_screen.dart';
import 'package:chatty/news/screens/sports_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsState> {
  var currentIndex = 0;

  NewsCubit(this.currentIndex) : super(BottomNavState());
  NewsCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottonItem = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',

      //backgroundColor:Colors.blue,
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];
  List<Widget> screens = [
    businessScreen(),
    ScienceScreen(),
    SportScreen(),
    SettingScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(BottomNavState());
    if (index == 0) {
      getBusiness();
      emit(GetBusinessSuccessState());
    } else if (index == 1) {
      getScience();
      emit(GetSportsSuccessState());
    } else {
      getSports();
      emit(GetScienceSuccessState());
    }
  }

//////////////////////////// Business  ///////////////////////////////////////////
  List<dynamic> business = [];
  void getBusiness() {
    emit(GetLoadingState());
    if (business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey': 'a0f4d6a4e5b249648a155ede8e40655a'
        },
      ).then((value) {
        emit(GetBusinessSuccessState());
        business = value.data["articles"];
        print(value.data["articles"][0]['title']);
        print(business.length);
      }).catchError((error) {
        emit(GetErrorBusinessState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetBusinessSuccessState());
    }
  }

//////////////////////////// Sperts ///////////////////////////////////////////
  List<dynamic> sports = [];
  void getSports() {
    emit(GetLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey': 'a0f4d6a4e5b249648a155ede8e40655a'
        },
      ).then((value) {
        emit(GetSportsSuccessState());
        business = value.data["articles"];
        print(value.data["articles"][0]['title']);
        print(business.length);
      }).catchError((error) {
        emit(GetErrorSportsState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetSportsSuccessState());
    }
  }

//////////////////////////// Science ///////////////////////////////////////////
  List<dynamic> science = [];
  void getScience() {
    emit(GetLoadingState());
    if (science.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey': 'a0f4d6a4e5b249648a155ede8e40655a'
        },
      ).then((value) {
        emit(GetScienceSuccessState());
        business = value.data["articles"];
        print(value.data["articles"][0]['title']);
        print(business.length);
      }).catchError((error) {
        emit(GetErrorScienceState(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetScienceSuccessState());
    }
  }
  ///////////////////////////////// Search /////////////////////////////////////////////

  List<dynamic> search = [];
  
  void getSearch(String value) {
    emit(GetLoadingState());
  
      DioHelper.getData(
        url: 'v2/everything',
        query: {'q': '$value', 'apiKey': 'a0f4d6a4e5b249648a155ede8e40655a'},
      ).then((value) {
        emit(GetSearchSuccessState());
        search = value.data["articles"];
        // print(value.data["articles"][0]['title']);
        // print(business.length);
      }).catchError((error) {
        emit(GetErrorSearchState(error.toString()));
        print(error.toString());
      });
    
  }

  bool isdark = false;

  void changeAppMode() {
    isdark = !isdark;
    //CashHelper.setData('isDark',)
    emit(ChangeAppModeState());
  }
}
