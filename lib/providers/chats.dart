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
        .snapshots()
        .listen((event) {
      var t_connections = [];
      event.docs.forEach((element) {
        t_connections.add({
          ...element.data(),
          ...{'key': element.id}
        });
        if (t_connections.length == event.size) {
          connections = t_connections;
          notifyListeners();
        }
      });
    });
  }
}
