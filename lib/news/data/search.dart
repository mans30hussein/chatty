import 'package:chatty/news/componant/build_artical.dart';
import 'package:chatty/news/componant/navigation.dart';
import 'package:chatty/news/cubit/news_cubit.dart';
import 'package:chatty/presentaion/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  // = NewsCubit.;
  static String id = 'SearchScreen';

  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;
    var value;
    return BlocProvider(
      create: (context) =>
          NewsCubit(currentIndex).get(context)..getSearch(value),
      child: BlocConsumer(
        listener: (context, state) {},
        builder: (context, state) {
          var currentIndex = 0;
          //var value;
          var cubit = NewsCubit(currentIndex).get(context)..search;
          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                CusteMTextFormField(
                  onChange: (value) {
                    NewsCubit(currentIndex).get(context).getSearch(value);
                  },
                  onTab: () {},
                  lableText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                BuildArticalWidget(cubit),
              ],
            ),
          );
        },
      ),
    );
  }
}
