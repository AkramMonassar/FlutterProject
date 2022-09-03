import 'package:flutter/material.dart';

class MetaData {
  String? id;
  String? name;
  bool? private;
  MetaData();

  factory MetaData.fromJson(Map<String, dynamic> json) {
    MetaData m = MetaData();
    m.id = json['id'];
    m.name = json['name'];
    m.private = json['private'];

    print("Name from MetaData.fromJson :${json['name']}");

    return m;
  }
}

// class UserMessage {
//  String? message;
//  UserMessage();
//
//  factory UserMessage.fromJson(Map<String, dynamic> json) {
//   UserMessage u = UserMessage();
//   u.message = json['en'];
//
//   print("message from UserMessage.fromJson :${json['en']}");
//
//   return u;
//  }
// }
