import 'package:chatty/news/componant/build_item.dart';
import 'package:chatty/news/componant/devidor.dart';
import 'package:chatty/news/cubit/news_cubit.dart';
import 'package:chatty/news/cubit/news_state.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildArticalWidget extends StatelessWidget {
  BuildArticalWidget( this.cubit ,);
  int currentIndex = 0;
  var cubit ;

  @override
  Widget build(BuildContext context) {
    cubit = NewsCubit(currentIndex).get(context);
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        /// var index = 0;
        // Map<String, dynamic> articals = {};

        return ConditionalBuilder(
            condition: state is! GetLoadingState,
            builder: (context) => ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      BuildTaskItem(cubit.business[index]),
                  separatorBuilder: (BuildContext context, index) =>
                      MyDevider(),
                  itemCount: 10,
                ),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrange,
                  ),
                ));
      },
    );
  }
}
