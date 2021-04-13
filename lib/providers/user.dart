import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CurrentUser with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var userData = {};

  void loadUserData() {
    _firestore
        .collection('usersData')
        .doc(firebaseAuth.currentUser.uid)
        .snapshots()
        .listen((event) {
      userData = event.data();
      notifyListeners();
    });
  }
}
