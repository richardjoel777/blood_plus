import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> initiateChat(String other_uid, String other_name) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DocumentReference _userRef =
      _firestore.collection('usersData').doc(_auth.currentUser.uid);
  DocumentReference _connectionRef = _userRef.collection('connections').doc();
  try {
    var accepted = [];
    var snapshot = await _userRef.get();
    accepted = snapshot.data()['accepted'];

    if (accepted != null && accepted.contains(other_uid)) {
      Fluttertoast.showToast(msg: "You already accepted this request");
      return;
    }

    WriteBatch batch = _firestore.batch();
    batch.set(_connectionRef, {'name': other_name});
    batch.set(
        _firestore
            .collection('usersData')
            .doc(other_uid)
            .collection('connections')
            .doc(_connectionRef.id),
        {'name': _auth.currentUser.displayName ?? "Name not available"});
    batch.update(_userRef, {
      'accepted': FieldValue.arrayUnion([other_uid])
    });
    await batch.commit();
  } catch (e) {
    print("Error happened initiating the chat" + e.toString());
  }
}
