import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //FirebaseAuth instance
  //Constuctor to initalize the FirebaseAuth instance

  //Using Stream to listen to Authentication State
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  UserData _userFromFirebaseuser(User user) {
    return user != null ? UserData(user.uid) : null;
  }

  Future signInEmail(String email, String password) async {
    try {
      UserCredential result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // print(result);
      var user = result.user;
      return _userFromFirebaseuser(user);
    } catch (ex) {
      Fluttertoast.showToast(msg: ex.message);
    }
  }

  Future registerUserData(
    String uid,
    String name,
    String email,
    String bloodGroup,
    String phone,
    String address,
    String pincode,
    DateTime dob,
    bool isNewDonor,
    DateTime lastDonatedDate,
  ) {
    var registeredUser = _firestore.collection("usersData").doc(uid).set({
      'name': name,
      'email': email,
      'bloodGroup': bloodGroup,
      'phone': phone,
      'address': address,
      'pincode': pincode,
      'dob': dob,
      'isNewDonor': isNewDonor,
      'lastDonatedDate': lastDonatedDate,
    });
    registeredUser
        .then((value) => Fluttertoast.showToast(msg: "User added Successfully"))
        .catchError((ex) => Fluttertoast.showToast(msg: ex.message));
    return null;
  }

  Future signUpEmail(String email, String password) async {
    try {
      UserCredential result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      print(result);
      User user = result.user;
      return _userFromFirebaseuser(user);
    } catch (ex) {
      Fluttertoast.showToast(msg: "Error " + ex.message.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
