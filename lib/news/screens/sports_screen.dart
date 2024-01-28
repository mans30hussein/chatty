import 'package:chatty/news/componant/build_artical.dart';
import 'package:chatty/news/cubit/news_cubit.dart';
import 'package:flutter/material.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    var cubit = NewsCubit(currentIndex).get(context);
    return BuildArticalWidget(cubit.sports);
  }
}