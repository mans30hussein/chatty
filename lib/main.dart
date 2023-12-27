import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:chatty/presentaion/screens/homeScreen.dart';
import 'package:chatty/presentaion/screens/logIn.dart';
import 'package:chatty/presentaion/screens/register.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('***************************************** User is currently signed out!');
      } else {
        print('******************************************** User is signed in!');
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser == null ? LogIn() : HomeScreen(),
      routes: {
      'register' : (context){
        return RegisterScreen(

        ) ;
      },
        'homeScreen' : (context){
          return HomeScreen() ;
        },
        'loginScreen' : (context){
          return LogIn() ;
        },
      },
    );
  }
}
