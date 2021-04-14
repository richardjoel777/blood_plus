// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.message,
  }) : super(key: key);

  final message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
      child: Align(
        alignment: (message['sender'] != FirebaseAuth.instance.currentUser.uid
            ? Alignment.topLeft
            : Alignment.topRight),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (message['sender'] != FirebaseAuth.instance.currentUser.uid
                ? Colors.grey.shade200
                : Colors.red[300]),
          ),
          padding: EdgeInsets.all(16), //TODO
          child: Text(
            message['message'] +
                "\n\n\t\t\t" +
                message['timestamp'].toDate().toString().substring(0, 19),
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
