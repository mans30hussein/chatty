import 'package:flutter/services.dart';

import '../const/constants.dart';

class Message {
  final String message;
  final String id;
 
  Message(this.message, this.id );

  factory Message.fromJson(jsonData) {
    return Message(jsonData[kMessage], jsonData[Kid]);
  }
}
