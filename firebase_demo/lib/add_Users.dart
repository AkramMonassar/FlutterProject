import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/data/user_response.dart';
import 'package:firebase_demo/readData.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'data/user_model.dart';

class AddUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AddUser();
  }

// Read from Firebase
}

class _AddUser extends State<AddUser> {
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController(text: "01-01-1990");
  DateTime? dateOfBirth;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextField(
              controller: controllerName,
              decoration: decoration('Name'),
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              controller: controllerAge,
              decoration: decoration('Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 24,
            ),
            TextField(
              showCursor: true,
              readOnly: true,
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1940),
                        lastDate: DateTime.now())
                    .then((date) {
                  //code to handle date
                  dateOfBirth = date;
                  // update Edit text

                  if (date == null) {
                    setState(() {
                      controllerDate.text = "";
                      print('date is null');
                    });
                  } else {
                    setState(() {
                      print('date in else ');
                      final DateFormat formatter = DateFormat('yyyy-MM-dd');
                      final String formatted = formatter.format(date);
                      controllerDate.text = formatted;
                      print('dateofbirth.txt ${controllerDate.text}');
                    });
                  }

                  print('Date in today:$dateOfBirth');
                });
              },
              controller: controllerDate,
              decoration: _getTextFieldWithCalendarIconDecoration(),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.blue,
              height: 50,
              onPressed: () {
                setState((){
                  final user = UserModel(
                    name: controllerName.text,
                    age: int.parse(controllerAge.text),
                    birthday: DateTime.parse(controllerDate.text),
                    // birthday: DateTime(2001,7,28)
                  );
                  UserResponse.createUser(user);
                  // Navigator.pop(context);
                });

              },
              child: const Text(
                'Create',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              color: Colors.blue,
              height: 50,
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReadDatafromFirbase()),
                );
              },
              child: const Text(
                'Back User Page',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _getTextFieldWithCalendarIconDecoration() {
    return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
        ),
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor)),
      suffixIcon: Icon(
        Icons.date_range,
        color: Theme.of(context).primaryColor,
      ),
      hintText: '01-01-2022',
    );
  }

  InputDecoration decoration(String label) =>
      InputDecoration(labelText: label, border: const OutlineInputBorder());
}
