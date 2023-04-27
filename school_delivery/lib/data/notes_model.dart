import 'package:flutter/material.dart';

class Notes {
  int?  id;
  String? textNote;
  DateTime? dateTime;
  TimeOfDay? timeOfDay;
  // supervisor or studentGuardian
  String? writer;
  int? studentGuardianId;
  int? supervisorId;

  Notes({this.id, this.textNote, this.dateTime, this.timeOfDay,this.writer,this.studentGuardianId,this.supervisorId});
}