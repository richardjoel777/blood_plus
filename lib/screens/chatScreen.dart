import 'package:blood_plus/screens/messageScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
    var t_connections = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var snapshot = await firestore
        .collection("users")
        .doc("userOneId")
        .collection("connections")
        .get();
    snapshot.docs.forEach((element) {
      t_connections.add(element.data());
      print(element.data()['name']);
    });
    setState(() {
      connections = t_connections;
      print(connections[0]['name']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            ElevatedButton(
              child: Text("Click me"),
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
                                      context, MessageScreen.routeName);
                                },
                              ));
                        }))
                : Text("Nothing")
          ],
        );
  }
}
