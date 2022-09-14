import 'package:flutter/material.dart';
import 'package:bmi/ui/widget/card_bmi.dart';
import 'package:bmi/data/information_bmi.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  int age = 0;
  double heightbyMeter = 0.0;
  double weightByKilo = 0.0;
  double inches = 0.0;
  double result = 0.0;

  String _resultReading = '';

  String _finalResult="";
  @override
  Widget build(BuildContext context) {
    print('Begin build');
    return SingleChildScrollView(
        child: Column(
      children: [
        Center(
          child: Image.asset('images/bmi.png'),
        ),
        Card(
          color: const Color.fromARGB(255, 226, 226, 236),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.person_outline),
                      labelText: 'Age',
                      hintText: 'e.g: 34'),
                  controller: _ageController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.insert_chart),
                      labelText: 'Height in meters ',
                      hintText: 'e.g: 6.5'),
                  controller: _heightController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.line_weight_sharp),
                      labelText: 'Weight in kilo',
                      hintText: 'e.g: 180 '),
                  controller: _weightController,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(250, 222, 52, 118),
                      minimumSize: const Size(150, 50),
                      textStyle: const TextStyle(fontSize: 25)),
                  onPressed: _calculteBmi,
                  child: const Text('Calculate'),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _finalResult,
            style: const TextStyle(
                color: Color.fromARGB(200, 53, 150, 199),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        Text(_resultReading,
            style: const TextStyle(
                color: Color.fromARGB(250, 222, 52, 118), fontSize: 25))
      ],
    ));
  }

  _calculteBmi() {
    setState(() {
      age = int.parse(_ageController.text);
      heightbyMeter = double.parse(_heightController.text);

      weightByKilo = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          (_heightController.text.isNotEmpty || inches > 0) &&
          (_weightController.text.isNotEmpty || weightByKilo > 0)) {
        result = weightByKilo / (heightbyMeter * heightbyMeter) ; // Our BMI//Do the reading
        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 18.5 &&
            result < 25) {
          _resultReading = "Great Shape!"; // Normal
          print(_resultReading);
        } else if (double.parse(result.toStringAsFixed(1)) >= 25.0 &&
            result < 30) {
          _resultReading = "Overweight";
        } else if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
        }
      }else{
        result=0.0;
      }
    });
    _finalResult="Your BMI: ${result.toStringAsFixed(1)}";
  }
}
