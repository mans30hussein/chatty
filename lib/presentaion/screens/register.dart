import 'package:chatty/const/colorConsr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data/services/authentication.dart';
import '../widgets/textFormField.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key ,required this.password, required this.email , required this.username });
   String username ;
   String email ;
   String password ;
 final auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.kPrimaryColor,
      body:  ListView(
          children:[
            Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Text('Chatty', style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),),
                  SizedBox(height: 70,),
                  CusteMTextFormField(
                    onTab: (){},
                    onClick: (value) {
                     username = value! ;

                    },
                    prefixIcon: Icon(Icons.account_box),
                    lableText: 'Enters Name' ,
                    obsecureText: false,
                  ),
                  CusteMTextFormField(
                    onTab: (){},
                    onClick: (value) {
                      email = value! ;

                    },
                    prefixIcon: Icon(Icons.email),

                    lableText: 'Enter email' ,
                    obsecureText: false,
                  ),
                  CusteMTextFormField(
                    onTab: (){},
                    onClick: (value) {
                      password = value! ;
                    },
                    prefixIcon: Icon(Icons.lock),

                    lableText: 'Entre password' ,
                    obsecureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: GestureDetector(
                      onTap: () async{
                        try {
                          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                            email: email,
                            password: password,
                          );


                          print(credential.user!.uid);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
                        Navigator.of(context).pushNamed('homeScreen');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: double.infinity,
                        height: 60,
                        child: const Center(
                          child: Text('Register', style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontFamily: 'pacifico'
                          ),),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(16),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Text('Add acount ?' , style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20,
                  //       ),),
                  //       InkWell(
                  //         onTap: () async {
                  //
                  //          print('succeeded') ;
                  //
                  //         },
                  //         child: Text(' LogIn', style: TextStyle(
                  //           color: Colors.greenAccent,
                  //           fontSize: 20,
                  //         ),),
                  //       )
                  //     ],
                  //   ),
                  // )
                ]),
          ]

      ),
    );
  }
}

