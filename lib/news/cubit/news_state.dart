import 'package:flutter/material.dart';

class NewsState {}

class IntialNewsState extends NewsState {}

class BottomNavState extends NewsState {}

class GetLoadingState extends NewsState {}

class GetBusinessSuccessState extends NewsState {}

class GetErrorBusinessState extends NewsState {
  String error;
  GetErrorBusinessState(this.error);
}

class GetSportsSuccessState extends NewsState {}

class GetErrorSportsState extends NewsState {
  String error;
  GetErrorSportsState(this.error);
}

class GetScienceSuccessState extends NewsState {}

class GetErrorScienceState extends NewsState {
  String error;
  GetErrorScienceState(this.error);
}

class ChangeAppModeState extends NewsState {
}
// class AppDarkModeState extends NewsState {
//   ThemeData _themeData = ThemeData.dark();
// }
class GetSearchSuccessState extends NewsState {}

class GetErrorSearchState extends NewsState {
  String error;
  GetErrorSearchState(this.error);
}
