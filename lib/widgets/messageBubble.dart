// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    Key key,
    @required this.message,
  }) : super(key: key);

  final message;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment:
            message['sender'] == FirebaseAuth.instance.currentUser.uid
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
        //this will determine if the message should be displayed left or right
        children: [
          Flexible(
            //Wrapping the container with flexible widget
            child: Container(
                padding: EdgeInsets.all(8.0),
                margin: EdgeInsets.all(4.0),
                constraints: BoxConstraints(maxWidth: 350),
                decoration: BoxDecoration(
                    color: message['sender'] ==
                            FirebaseAuth.instance.currentUser.uid
                        ? Colors.red[200]
                        : Colors.blue[200],
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                        //We only want to wrap the text message with flexible widget
                        child: Container(
                            child: Text(
                      message['message'],
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w400),
                    ))),
                    SizedBox(
                      width: 8.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 6.0),
                      child: Text(
                        DateFormat.jm().format(
                            DateTime.fromMillisecondsSinceEpoch(
                                message["timestamp"].seconds * 1000)),
                        style: TextStyle(fontSize: 10.0, color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                  ],
                )),
          )
        ]);
  }
}
