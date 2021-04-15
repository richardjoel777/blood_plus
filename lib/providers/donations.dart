import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:blood_plus/models/request.dart';
import 'package:intl/intl.dart';

class Donations with ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  List<Request> _currentDonationRequests = [];
  List<Request> myRequests = [];
  List<Request> donationsHistory = [];
  List<Request> successfulDonations = [];
  var acceptedRequestIds = [];

  Donations() {
    getAcceptedRequests();
    getRequests();
  }

  List<Request> get currentDonationRequests {
    return [..._currentDonationRequests];
  }

  Future<void> deleteRequest(String id) async {
    try {
      await _firestore
          .collection('requests')
          .doc(id)
          .update({'status': 'removed'});
      Fluttertoast.showToast(msg: "Your request is successfully removed!");
    } catch (e) {
      Fluttertoast.showToast(
          msg: "Something's wrong. Check your internet connection");
      print("Error happened deleting the request " + e.toString());
    }
  }

  void getAcceptedRequests() {
    _firestore
        .collection('usersData')
        .doc(firebaseAuth.currentUser.uid)
        .snapshots()
        .listen((event) {
      acceptedRequestIds = event.data()['accepted'];
    });
  }

  void getRequests() {
    _firestore
        .collection('requests')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) {
      int i = 0;
      List<Request> res = [];
      List<Request> resMy = [];
      List<Request> resAcc = [];
      List<Request> resSucc = [];

      event.docs.forEach((element) {
        i++;
        Request request = Request(
            id: element.id,
            age: element["age"],
            name: element["name"],
            date: DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(
                element["date"].seconds * 1000)),
            uid: element["uid"],
            bloodGroup: element["bloodGroup"],
            area: element["area"]);
        if (acceptedRequestIds.contains(element.id)) {
          resAcc.add(request);
        }
        try {
          if (element['status'] == 'removed') {
            resSucc.add(request);
          }
        } catch (e) {
          if (element['uid'] == firebaseAuth.currentUser.uid) {
            resMy.add(request);
          } else if (!acceptedRequestIds.contains(element.id)) {
            res.add(request);
          }
        }
        if (i == event.size) {
          _currentDonationRequests = res;
          successfulDonations = resSucc;
          myRequests = resMy;
          donationsHistory = resAcc;
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
      Fluttertoast.showToast(
          msg: "Something's wrong. Check your internet connection");
      print("Error happened while uploading request" + ex.toString());
    }
  }
}
