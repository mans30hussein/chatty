import 'package:chatty/news/componant/build_artical.dart';

import 'package:chatty/news/cubit/news_cubit.dart';

import 'package:flutter/material.dart';


class businessScreen extends StatelessWidget {
  businessScreen({super.key});
// Map<String ,dynamic> articals;
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    var cubit = NewsCubit(currentIndex).get(context);
    return BuildArticalWidget(cubit.business);
  }
}
