import 'package:chatty/news/componant/navigation.dart';
import 'package:chatty/news/cubit/news_cubit.dart';

import 'package:chatty/news/cubit/news_state.dart';
import 'package:chatty/news/data/doi_helper.dart';
import 'package:chatty/news/data/search.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/news_cubit.dart';

class NewsApp extends StatelessWidget {
  NewsApp({super.key});
  static String id = 'NewsApp';

  @override
  Widget build(context) {
    try {
      int currentIndex = 0;
      return BlocProvider(
        create: (context) => NewsCubit(currentIndex)..getBusiness(),
        child: BlocConsumer<NewsCubit, NewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = NewsCubit(currentIndex).get(context);
            return Scaffold(
              appBar: AppBar(
                title: const Text("News App"),
                actions: [
                  IconButton(
                    onPressed: () {
                      navigateTo(context,SearchScreen());
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 32,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.brightness_4_outlined,
                      size: 32,
                    ),
                    onPressed: () {
                     // var currentIndex = 0;
                      cubit.changeAppMode();
                     // NewsCubit(currentIndex).get(context).changeAppMode();
                    },
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: cubit.currentIndex,
                items: cubit.bottonItem,
                onTap: (index) {
                  cubit.changeBottomNavBar(index);
                },
              ),
              body: cubit.screens[cubit.currentIndex],
              // floatingActionButton: FloatingActionButton(
              //   onPressed: () {
        
              //   },
              //   child: Icon(
              //     Icons.add,
              //   ),
              // ),
            );
          },
        ),
      );
    } catch (e) {
      print("Error $e");
      return const CircularProgressIndicator();
    }
  }
}
