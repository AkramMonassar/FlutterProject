import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../data/alert_model.dart';


class AlertsManager extends ChangeNotifier {
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

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}