// ignore_for_file: use_build_context_synchronously

import 'package:chatty/models/messagesModel.dart';
import 'package:chatty/presentaion/screens/chatScreen.dart';
import 'package:chatty/presentaion/screens/register.dart';
import 'package:chatty/presentaion/widgets/loginBotton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../const/constants.dart';
import '../widgets/FirebaseAuth.dart';
import '../../helper/showSnackBar.dart';
import '../widgets/textFormField.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key, });
  static String id = 'LogIn';
 
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
   String? password;
  String? email;
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey();
  // / var messageId = Message();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Form(
          key: _formKey,
          child: ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                'Chatty',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              CusteMTextFormField(
                onTab: () {},
                onChange: (value) {
                  email = value!;
                },
                prefixIcon: const Icon(Icons.email),
                lableText: 'Enter Email',
                obsecureText: false,
              ),
              CusteMTextFormField(
                onTab: () {},
                onChange: (value) {
                  password = value!;
                },
                prefixIcon: const Icon(Icons.lock),
                lableText: 'Enter Password',
                obsecureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () async {
                    await checkLogin(context);
                  },
                  child: LoginBotton(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Add acount ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(RegisterScreen.id);
                      },
                      child: const Text(
                        ' Register',
                        style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }

  Future<void> checkLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      isLoading = true;
      setState(() {});
      try {
        await userLogin();
        Navigator.of(context).pushNamed(HomeScreen.id , arguments: email );
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          showSnackBar(context, 'user not found');
        } else if (ex.code == 'wrong-password') {
          showSnackBar(context, 'wrong password');
        }
      } catch (ex) {
        print(ex);
        showSnackBar(context, 'there was an error');
      }

      isLoading = false;
      setState(() {});
    } else {}
  }
}
