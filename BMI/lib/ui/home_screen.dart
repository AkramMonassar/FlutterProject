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

  String _finalResult = "";

  String _weightPre = "";
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
        DataTable(columns: const [
          DataColumn(
              label: Text(
            'BMI',
            style: TextStyle(fontSize: 15),
          )),
          DataColumn(label: Text('Reading',style: TextStyle(fontSize: 15),)),
          DataColumn(label: Text('Weight Pre',style: TextStyle(fontSize: 15),))
        ], rows: [
          DataRow(cells: [
            DataCell(Text(
              _finalResult,
              style: TextStyle(fontSize: 15),
            )),
            DataCell(Text(
              _resultReading,
              style: TextStyle(fontSize: 15),
            )),
            DataCell(
              Text(
                _weightPre,
                style: TextStyle(fontSize: 15),
              ),
            )
          ])
        ])
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
        result = weightByKilo /
            (heightbyMeter * heightbyMeter); // Our BMI//Do the reading
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
      } else {
        result = 0.0;
      }
    });
    _finalResult = "${result.toStringAsFixed(1)}";

    if(heightbyMeter>=1.90){
      _weightPre="73 to 93kg";
    }else if(heightbyMeter>=1.88){
      _weightPre="71 to 88kg";
    }else if(heightbyMeter>=1.86){
      _weightPre="86 to 96kg";
    }else if(heightbyMeter>=1.84){
      _weightPre="67 to 84kg";
    }else if(heightbyMeter>=1.82){
      _weightPre="66 to 82kg";
    }else if(heightbyMeter>=1.80){
      _weightPre="65 to 80kg";
    }else if(heightbyMeter>=1.76){
      _weightPre="62 to 77kg";
    }else if(heightbyMeter>=1.74){
      _weightPre="60 to 75kg";
    }else if(heightbyMeter>=1.72){
      _weightPre="59 to 74kg";
    }else if(heightbyMeter>=1.70){
      _weightPre="58 to 73kg";
    }else if(heightbyMeter>=1.68){
      _weightPre="56 to 71kg";
    }else if(heightbyMeter>=1.66){
      _weightPre="55 to 69kg";
    }else if(heightbyMeter>=1.64){
      _weightPre="54 to 67kg";
    }else if(heightbyMeter>=1.62){
      _weightPre="53 to 56kg";
    }else if(heightbyMeter>=1.60){
      _weightPre="52 to 56kg";
    }else if(heightbyMeter>=1.56){
      _weightPre="51 to 64kg";
    }else if(heightbyMeter>=1.50){
      _weightPre="50 to 58kg";
    }else if(heightbyMeter>=1.42){
      _weightPre="39 to 40kg";
    }else if(heightbyMeter>=1.38){
      _weightPre="31";
    }else if(heightbyMeter>=1.33){
      _weightPre="28";
    }else if(heightbyMeter>=1.28){
      _weightPre="25";
    }else if(heightbyMeter>=1.21){
      _weightPre="22";
    }else if(heightbyMeter>=1.15){
      _weightPre="19";
    }else if(heightbyMeter>=1.7){
      _weightPre="17";
    }else if(heightbyMeter>=1.3){
      _weightPre="15";
    }else if(heightbyMeter>=0.93){
      _weightPre="14";
    }else if(heightbyMeter>=0.85){
      _weightPre="12";
    }else {
      _weightPre="very small";
    }
  }
}
