import 'package:chatty/news/cubit/news_cubit.dart';
import 'package:chatty/news/cubit/news_state.dart';
import 'package:chatty/news/data/doi_helper.dart';
import 'package:chatty/news/data/search.dart';
import 'package:chatty/news/data/shared_preference.dart';
import 'package:chatty/news/screens/news_app.dart';
import 'package:chatty/presentaion/widgets/FirebaseAuth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'firebase_options.dart';
import 'package:chatty/presentaion/screens/chatScreen.dart';
import 'package:chatty/presentaion/screens/logIn.dart';
import 'package:chatty/presentaion/screens/register.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await initNotification();
  DioHelper.init();
  CashHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  // int? currentIndex;
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print(
            '***************************************** User is currently signed out!');
      } else {
        print(
            '******************************************** User is signed in!');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentIndex = 0;

    return MultiBlocProvider(

      // create: (context) => NewsCubit(currentIndex),

      providers: [
        BlocProvider(create: (context) => NewsCubit(currentIndex),),
        BlocProvider(create: (_) => NewsCubit(currentIndex)..getBusiness(),),
         BlocProvider(create: (_) => NewsCubit(currentIndex)..search,
        
)
      ],
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            ////////////////////////// Theme Mode //////////////////////////////////////////
            // themeMode: ThemeMode.dark,
            themeMode: NewsCubit(currentIndex).get(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            ///////////////////////////// dark theme //////////////////////////////////////////
            darkTheme: ThemeData(
                primarySwatch: Colors.deepOrange,
                scaffoldBackgroundColor: HexColor('333739'),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.ellipsis,
                )),
                iconTheme: const IconThemeData(color: Colors.white),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    backgroundColor: HexColor('333739'),
                    unselectedIconTheme: const IconThemeData(
                      color: Colors.white,
                    ),
                    elevation: 35,
                    selectedLabelStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                appBarTheme: AppBarTheme(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    centerTitle: true,
                    titleTextStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light,
                    ))),
            /////////////////////////////// light theme ///////////////////////////////////////////
            theme: ThemeData(
                primarySwatch: Colors.deepOrange,
                iconTheme: const IconThemeData(color: Colors.black),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Colors.deepOrange,
                    //backgroundColor: Color.fromARGB(255, 246, 250, 246),
                    elevation: 35,
                    selectedLabelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                scaffoldBackgroundColor: Colors.white,
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.deepOrange,
                ),
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    //]centerTitle: true,
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark,
                    ))),
            home: NewsApp(),
            initialRoute: NewsApp.id,
            routes: {
              //   LoginPage.id: (context) => LoginPage(),
              //   RegisterPage.id: (context) => RegisterPage(),
              //  ChatPage.id : (context) => ChatPage(),
              SearchScreen.id : (context) => SearchScreen(),
              LogIn.id: (context) => LogIn(),
              RegisterScreen.id: (context) => RegisterScreen(),
              HomeScreen.id: (context) => HomeScreen(),
              // NewsApp.id: (context) => NewsApp(),
            },
          );
        },
      ),
    );
  }
}
