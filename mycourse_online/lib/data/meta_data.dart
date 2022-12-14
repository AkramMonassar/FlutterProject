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

