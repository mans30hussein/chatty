import 'package:chatty/const/colorConsr.dart';
import 'package:flutter/material.dart';

import '../widgets/textFormField.dart';

class LogIn extends StatelessWidget {
   LogIn({super.key});
late String password ;
late String email ;
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
            onTap: (){
              Navigator.of(context).pushNamed('homeScreen');
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text('LogIn', style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'pacifico'
                ),),
              ),
            ),
          ),
        ),
                
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Add acount ?' , style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed('register') ;
                        },
                        child: Text(' Register', style: TextStyle(
                          color: Colors.greenAccent,
                          fontSize: 20,
                        ),),
                      )
                    ],
                  ),
                )
              ]),
        ]

      ),
    );
  }
}

