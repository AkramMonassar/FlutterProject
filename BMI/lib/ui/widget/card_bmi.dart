import 'package:bmi/data/information_bmi.dart';
import 'package:flutter/material.dart';

class CardBmi extends StatefulWidget {
  @override
  State<CardBmi> createState() => _CardBmiState();
}

class _CardBmiState extends State<CardBmi> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  int? age;
  double? height;
  double? weight;
  double? inches;
  double? result=0.0;
  Information? information;
  @override
  Widget build(BuildContext context) {
    information = Information();
    return Card(
      color: Color.fromARGB(255, 226, 226, 236),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  labelText: 'Age',
                  hintText: 'e.g: 34'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: TextFormField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.insert_chart),
                  labelText: 'Height of Feet',
                  hintText: 'e.g: 6.5'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: TextFormField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  icon: Icon(Icons.line_weight_sharp),
                  labelText: 'Weight in lib',
                  hintText: 'e.g: 180 '),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: const Color.fromARGB(250, 222, 52, 118),
                  minimumSize: const Size(150, 50),
                  textStyle: const TextStyle(fontSize: 25)),
              onPressed: calculteBmi(),
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }

  calculteBmi() {
    age = int.parse(_ageController.text);
    height = double.parse(_heightController.text);
    inches = height! * 12;
    weight = double.parse(_weightController.text);


    if ((_ageController.text.isNotEmpty || age! > 0) &&
        (_heightController.text.isNotEmpty || inches! > 0) &&
        (_weightController.text.isNotEmpty || weight! > 0)) {
      result=weight!/(inches!*inches!)*703; // Our BMI
    }else
      {
        result=0;
      }

  }
}
