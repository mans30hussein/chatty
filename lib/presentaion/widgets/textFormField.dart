import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CusteMTextFormField extends StatelessWidget {
  CusteMTextFormField({
    required this.onTab,
    this.obsecureText,
    this.prefixIcon,
    this.lableText,
    this.onClick,
    this.onChange,
  });
  final String? lableText;
  Function() onTab;
  final void Function(String?)? onClick;
  final bool? obsecureText;
  final Icon? prefixIcon;
  Function(String)? onChange;

  String? _errorMessage(String str){
    switch(lableText){
      case 'Enter Name' : return 'Name is Empty' ;
      case 'Enter Email' : return 'Email is Empty' ;
      case 'Enter Password' : return 'password is Empty' ;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if(value!.isEmpty){
            return _errorMessage(lableText!) ;
          }
        },
        onSaved: onClick,
        onChanged: onChange,
        obscureText:lableText == 'Enter Password' ? true : false ,
        keyboardType: TextInputType.name,
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        onTap: onTab,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: Colors.white,

          labelText: lableText,
          labelStyle: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          //filled: true,
          //fillColor: Colors.grey.shade400,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
