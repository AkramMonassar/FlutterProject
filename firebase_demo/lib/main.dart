import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:firebase_demo/data/user_model.dart';
import 'package:firebase_demo/get_name.dart';
import 'package:firebase_demo/readData.dart';
import 'package:firebase_demo/add_Users.dart';
import 'package:firebase_demo/widgets/textDate.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ReadDatafromFirbase(),
      )
      );
}
//
// class MainPage extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return AddUser();
//   }
// }






