import 'package:blood_plus/screens/messageScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/ChatScreen";
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var connections = [];
  void test() async {
    var tConnections = [];
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var snapshot = await firestore
        .collection("usersData")
        .doc(_auth.currentUser.uid)
        .collection("connections")
        .get();
    snapshot.docs.forEach((element) {
      tConnections.add({
        ...element.data(),
        ...{'key': element.id}
      });
      print(element.data()['name']);
    });
    setState(() {
      connections = tConnections;
      print(connections[0]['name']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          child: Text("Refresh"),
          onPressed: () => this.test(),
        ),
        connections.length > 0
            ? Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: connections.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          height: 40,
                          child: GestureDetector(
                            child: Text(connections[index]['name']),
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MessageScreen.routeName,
                                  arguments: connections[index]);
                            },
                          ));
                    }))
            : Text("Nothing")
      ],
    );
  }
}
