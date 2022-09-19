import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_chat_ui/screens/home_screen.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat UI',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor:  Color(0xFFFEF9EB),
      ),
      home: HomeScreen(),
    );
  }
}
