import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget{
  final String? _message;

  ErrorMessageWidget({String? message}):_message=message;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Text(_message!),
        ),
      ),
    );
  }

}