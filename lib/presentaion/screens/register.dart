import 'package:chatty/const/colorConsr.dart';
import 'package:chatty/presentaion/screens/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../data/services/authentication.dart';
import '../widgets/FirebaseAuth.dart';
import '../widgets/showSnackBar.dart';
import '../widgets/textFormField.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key, this.password, this.email, this.username});
  String? username;
  String? email;
  String? password;
static String id = 'RegisterScreen';
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final auth = Auth();

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: MyColor.kPrimaryColor,
        body: Form(
          key: _formKey,
          child: ListView(children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                height: 150,
              ),
              Text(
                'Chatty',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              CusteMTextFormField(
                onTab: () {},
                onChange: (value) {
                  var username = value!;
                },
                prefixIcon: Icon(Icons.account_box),
                lableText: 'Enter Name',
                obsecureText: false,
              ),
              CusteMTextFormField(
                onTab: () {},
                onChange: (value) {
                  email = value!;
                },
                prefixIcon: Icon(Icons.email),
                lableText: 'Enter Email',
                obsecureText: false,
              ),
              CusteMTextFormField(
                onTab: () {},
                onChange: (value) {
                  password = value!;
                },
                prefixIcon: Icon(Icons.lock),
                lableText: 'Enter Password',
                obsecureText: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        isLoading = true ;
                        setState(() {});
                        UserCredential user = await userRegister();
                        Navigator.of(context).pushNamed(LogIn.id);
                        print(user.user!.uid);
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showSnackBar(
                              context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showSnackBar(context,
                              'The account already exists for that email.');
                        } else {
                          showSnackBar(context, 'register completed.');
                        }
                      } catch (e) {
                        print(e.toString());
                      }
                      isLoading = false ;
                      setState(() {

                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: double.infinity,
                    height: 60,
                    child: const Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontFamily: 'pacifico'),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text(
              //         'Add acount ?',
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 20,
              //         ),
              //       ),
              //       InkWell(
              //         onTap: () {
              //           Navigator.pop(context);
              //         },
              //         child: Text(
              //           ' LogIn',
              //           style: TextStyle(
              //             color: Colors.greenAccent,
              //             fontSize: 20,
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // )
            ]),
          ]),
        ),
      ),
    );
  }
}
