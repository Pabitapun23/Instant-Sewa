import 'package:flutter/material.dart';

class Message {
String title;
String body;
Message.fromJson(Map<String,dynamic> jsonMap):
      title =  jsonMap['title'],
      body =  jsonMap['body'];
}