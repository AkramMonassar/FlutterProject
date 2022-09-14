import 'package:flutter/material.dart';
import 'package:bmi/ui/home_screen.dart';
void main() {
  runApp(MaterialApp(
    home: SafeArea(child: MayApp()),
  ));
}

class MayApp extends StatefulWidget {
  @override
  State<MayApp> createState() => _MayAppState();
}

class _MayAppState extends State<MayApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(250, 222, 52, 118),
        title: const Center(
            child: Text(
              'BMI',
              style: TextStyle(fontSize: 30),
            )),
      ),
      body: HomeScreen(),
      );
  }
}
