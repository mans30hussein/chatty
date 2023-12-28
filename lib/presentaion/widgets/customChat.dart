// import 'package:chatty/models/message.dart';
import 'package:chatty/models/messagesModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//package:chatty/models/messagesModel.dart'.
import 'package:chatty/models/messagesModel.dart';
import '../../const/colorConsr.dart';

class CustomChat extends StatelessWidget {
  CustomChat({
    super.key,
    required this.message,
  });
  final Message message;
  

  @override
  Widget build(BuildContext context) {
    
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: const BoxDecoration(
            color: MyColor.kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(40),
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomChatFriend extends StatelessWidget {
  CustomChatFriend({
    super.key,
    required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: const BoxDecoration(
            color: MyColor.kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            message.message,
            style: const TextStyle(
              color: Colors.teal,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
