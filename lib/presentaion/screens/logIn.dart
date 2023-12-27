import 'package:chatty/const/colorConsr.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../widgets/FirebaseAuth.dart';
import '../widgets/showSnackBar.dart';
import '../widgets/textFormField.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
   String? password;
   String? email;
   bool isLoading = false ;
   GlobalKey<FormState>  _formKey = GlobalKey();

  // final = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

      inAsyncCall: isLoading,
      child: Scaffold(

        backgroundColor: MyColor.kPrimaryColor,
        body: Form(
          key:_formKey,
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
                    if(_formKey.currentState!.validate()){
                      try {
                        isLoading = true ;
                        setState(() {

                        });
                        UserCredential credential = await userLogin();
                        Navigator.of(context).pushNamed('homeScreen' , arguments: email );
                        print(credential.user!.uid);
                      } on FirebaseAuthException catch (e) {
                        print(e.message.toString());
                        if (e.code == 'user-not-found') {
                          showSnackBar(context,'No user found for that email');
                        } else if (e.code == 'wrong-password') {
                          showSnackBar(context,'Wrong password provided for that user.');

                        }
                      } catch (e) {
                        print('An error occurred: $e');
                      }
                      isLoading = false ;
                      setState(() {

                      });
                      //showSnackBar(context , 'Login Success !');
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
                        'LogIn',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'pacifico',
                        ),
                      ),
                    ),
                  ),
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
                        Navigator.of(context).pushNamed('register');
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




}
