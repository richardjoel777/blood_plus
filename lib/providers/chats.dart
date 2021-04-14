import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Connections with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var connections = [];

  Connections() {
    loadConnections();
  }

  void loadConnections() {
    _firestore
        .collection('usersData')
        .doc(firebaseAuth.currentUser.uid)
        .collection('connections')
        .orderBy('lastTime', descending: true)
        .snapshots()
        .listen((event) {
      var tConnections = [];
      event.docs.forEach((element) {
        tConnections.add({
          ...element.data(),
          ...{'key': element.id}
        });
        if (tConnections.length == event.size) {
          connections = tConnections;
          notifyListeners();
        }
      });
    });
  }
}
