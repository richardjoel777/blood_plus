import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future<void> initiateChat(String otherUid, String otherName) async {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  DocumentReference _userRef =
      _firestore.collection('usersData').doc(_auth.currentUser.uid);
  DocumentReference _connectionRef = _userRef.collection('connections').doc();
  try {
    var accepted = [];
    var snapshot = await _userRef.get();
    accepted = snapshot.data()['accepted'];

    if (accepted != null && accepted.contains(otherUid)) {
      Fluttertoast.showToast(msg: "You already accepted this request");
      return;
    }

    WriteBatch batch = _firestore.batch();
    batch.set(_connectionRef, {'name': otherName});
    batch.set(
        _firestore
            .collection('usersData')
            .doc(otherUid)
            .collection('connections')
            .doc(_connectionRef.id),
        {
          'name': _auth.currentUser.displayName ?? "Name not available",
          'lastTime': Timestamp.now()
        });
    batch.update(_userRef, {
      'accepted': FieldValue.arrayUnion([otherUid])
    });

    batch.set(
        _firestore
            .collection('chats')
            .doc(_connectionRef.id)
            .collection('messages')
            .doc(),
        {
          "message": "You've been connected",
          'sender': 'Admin',
          'timestamp': Timestamp.now()
        });
    await batch.commit();
  } catch (e) {
    print("Error happened initiating the chat" + e.toString());
  }
}
