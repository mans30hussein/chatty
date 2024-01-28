import 'package:chatty/const/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200,
        width: 200,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
         image: DecorationImage(
          fit: BoxFit.contain,
          image: AssetImage(kLogo),
          )
          ),
      ),
    );
  }
}