import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blood_plus/models/request.dart';

class Donations with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<Request> currentDonationRequests = [];
  List<Request> _donationsHistory = [];

  Donations() {
    getRequests();
  }

  void getRequests() {
    _firestore
        .collection('requests')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) {
      List<Request> res = [];
      event.docs.forEach((element) {
        res.add(Request(
            id: element.id,
            age: element["age"],
            name: element["name"],
            date: element["date"].toString(),
            uid: element["uid"],
            bloodGroup: element["bloodGroup"],
            area: element["area"]));
        if (res.length == event.size) {
          currentDonationRequests = res;
          notifyListeners();
        }
      });
    });
  }

  Future<void> uploadRequest(
    String name,
    String bloodGroup,
    DateTime requiredDate,
    DateTime dob,
    String pincode,
    int age,
    int units,
    String area,
    bool isCritical,
  ) async {
    try {
      final String uid = firebaseAuth.currentUser.uid;
      print('User ID $uid');
      // await _firestore
      //     .collection("usersData")
      //     .doc(uid)
      //     .collection("my_requests")
      //     .doc()
      var ref = _firestore.collection('requests').doc();
      await ref.set({
        "age": age,
        "name": name,
        "dob": dob,
        "date": requiredDate,
        "uid": uid,
        "units": units,
        "pincode": pincode,
        "bloodGroup": bloodGroup,
        "isCritical": isCritical,
        "area": area,
      });
    } catch (ex) {
      print(ex);
    }
  }

  //= [
  //   Request(
  //     id: 'r1',
  //     uid: 'u1',
  //     name: 'Richard',
  //     age: 18,
  //     area: 'Trichy',
  //     bloodGroup: "A+",
  //     date: "12-04-2021",
  //   ),
  //   Request(
  //     id: 'r2',
  //     uid: 'u2',
  //     name: 'Robin',
  //     age: 22,
  //     bloodGroup: "B+",
  //     area: 'Thirunelveli',
  //     date: "15-04-2021",
  //   ),
  //   Request(
  //     id: 'r3',
  //     uid: 'u3',
  //     name: 'Raveen',
  //     age: 43,
  //     bloodGroup: "AB+",
  //     area: 'Tuticorin',
  //     date: "08-04-2021",
  //   ),
  //   Request(
  //     id: 'r4',
  //     uid: 'u4',
  //     name: 'Ravichandran',
  //     age: 36,
  //     bloodGroup: "B+",
  //     area: 'Erode',
  //     date: "10-04-2021",
  //   ),
  //   Request(
  //     id: 'r5',
  //     uid: 'u5',
  //     name: 'Pravin',
  //     age: 15,
  //     bloodGroup: "O+",
  //     area: 'Salem',
  //     date: "07-04-2021",
  //   ),
  //   Request(
  //     id: 'r6',
  //     uid: 'u6',
  //     name: 'Premnath',
  //     age: 62,
  //     bloodGroup: "A+",
  //     area: 'Coimbatore',
  //     date: "11-04-2021",
  //   ),
  // ];
  // List<Request> get currentDonationRequests {
  //   return [..._currentDonationRequests];
  // }

  // = [
  //   Request(
  //     id: 'r3',
  //     uid: 'u3',
  //     name: 'Raveen',
  //     age: 43,
  //     bloodGroup: "AB+",
  //     area: 'Tuticorin',
  //     date: "08-04-2020",
  //   ),
  //   Request(
  //     id: 'r4',
  //     uid: 'u4',
  //     name: 'Ravichandran',
  //     age: 36,
  //     bloodGroup: "B+",
  //     area: 'Erode',
  //     date: "12-12-2020",
  //   ),
  // ];
  Future<void> getDonationHistory() async {
    try {
      final String uid = firebaseAuth.currentUser.uid;
      await _firestore
          .collection("usersData")
          .doc(uid)
          .collection("donations_history")
          .get()
          .then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((doc) {
          _donationsHistory.add(Request(
              id: doc.id,
              age: doc["age"],
              name: doc["name"],
              date: doc["date"],
              uid: doc["uid"],
              bloodGroup: doc["bloodGroup"],
              area: doc["area"]));
        });
      });
    } catch (ex) {
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  List<Request> get donationsHistory {
    getDonationHistory();
    return [..._donationsHistory];
  }
}
