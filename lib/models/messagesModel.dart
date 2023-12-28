import 'package:chatty/const/colorConsr.dart';
import 'package:flutter/services.dart';

class Message {
  final String message;
  final String id;
  Message(this.message , this.id);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[MyColor.kMessage] , jsonData[MyColor.Kid]);
  }
}
