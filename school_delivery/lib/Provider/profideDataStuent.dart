import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_delivery/data/students_Guardians_model.dart';

import '../data/alert_model.dart';
import '../data/notes_model.dart';
import '../data/preparations_model.dart';

class ProviderDataStudent extends ChangeNotifier{
  // student infor
  List studentsGListObject = [];
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('StudentsG');


  final user = FirebaseAuth.instance.currentUser!;
  bool? isChecked=false;

  Future getStudentsDetailsList() async {
    collectionReference =
        FirebaseFirestore.instance.collection('StudentsG');

    final snapshot = await collectionReference.get();
    studentsGListObject = snapshot.docs;

    notifyListeners();
  }

  // from use select
  StudentsGuardians? _selectedItem;

  List get data => studentsGListObject;

  set data(List newData) {
    studentsGListObject = newData;
    notifyListeners();
  }

  void updateData(bool isCheck) {
    // final index = studentsGListObject.indexWhere((item) => item.name == data.fullName);
    // print('------ UpdateData :${data.fullName}');
    // if (index != -1) {
    //   studentsGListObject[index] = data;
    //   notifyListeners();
    // }
    isChecked=isCheck;
    notifyListeners();

  }

  // void resetSelection() {
  //   _selectedItem = null;
  //   studentsGListObject.forEach((item) => item.selected = false);
  //   notifyListeners();
  // }

  void selectItem(StudentsGuardians item) {
    _selectedItem = item;
    studentsGListObject.forEach((model) => model.selected = (model == item));
    notifyListeners();
  }

  bool isItemSelected(StudentsGuardians item) {
    return item == _selectedItem;
  }


  // praparion

  List preparingListObject = [];
  CollectionReference collectionReferencePreparing =
  FirebaseFirestore.instance.collection('Preparations');



  List<Preparations>  preparationList=[];

  Future preparingDetailsList() async {
    collectionReference =
        FirebaseFirestore.instance.collection('Preparations');

    final snapshot = await collectionReference.get();
    preparingListObject = snapshot.docs;

    notifyListeners();
  }
  // bool doneChangeGo(){
  //   isGo=!isGo!;
  //   return isGo!;
  // }


  // provider Alert Manager

  CollectionReference _alertsCollection =
  FirebaseFirestore.instance.collection('alerts');

  List<Alert> _alerts = [];

  List<Alert> get alerts => _alerts;

  StreamSubscription<QuerySnapshot>? _subscription;

  AlertsManager() {
    _subscription = _alertsCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      _alerts = querySnapshot.docs.map((doc) => Alert.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Future<void> addAlert(String message) async {
    await _alertsCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void clearAlerts() {
    _alertsCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  // @override
  // void dispose() {
  //   _subscription?.cancel();
  //   super.dispose();
  // }


  // provider note Manager

  CollectionReference _notesCollection =
  FirebaseFirestore.instance.collection('notesSupervisor');

  List<NotesSupervisor> _notes = [];

  List<NotesSupervisor> get notes => _notes;

  StreamSubscription<QuerySnapshot>? _subscription2;

  NoteManager() {
    _subscription2 = _notesCollection
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      _notes = querySnapshot.docs.map((doc) => NotesSupervisor.fromSnapshot(doc)).toList();
      notifyListeners();
    });
  }

  Future<void> addNote(String message) async {
    await _notesCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void clearNote() {
    _alertsCollection.get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });
  }

  @override
  void dispose() {
    _subscription2?.cancel();
    _subscription?.cancel();
    super.dispose();
  }

}