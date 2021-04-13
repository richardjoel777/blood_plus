import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<void> initiateChat(String other_uid, String other_name) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DocumentReference _ref = _firestore
      .collection('usersData')
      .doc(_auth.currentUser.uid)
      .collection('connections')
      .doc();
  try {
    WriteBatch batch = _firestore.batch();
    batch.set(_ref, {'name': other_name});
    batch.set(
        _firestore
            .collection('usersData')
            .doc(other_uid)
            .collection('connections')
            .doc(_ref.id),
        {'name': _auth.currentUser.displayName ?? "Name not available"});
    await batch.commit();
  } catch (e) {
    print("Error happened initiating the chat");
  }
}
