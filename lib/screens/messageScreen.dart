import 'dart:async';

import 'package:blood_plus/widgets/messageBubble.dart';
import 'package:blood_plus/widgets/send_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static const routeName = "/MessageScreen";
  @override
  State<StatefulWidget> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var messages = [];
  bool isFirst = true;

  void loadMessages(String key) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    firestore
        .collection("chats")
        .doc(key)
        .collection("messages")
        .orderBy('timestamp')
        .snapshots()
        .listen((event) {
      var tMessages = [];
      event.docs.forEach((element) {
        tMessages.add(element.data());
        if (tMessages.length == event.size) {
          setState(() {
            messages = tMessages;
          });
        }
      });
    });
  }

  void sendMessage(String key, String message) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var uid = FirebaseAuth.instance.currentUser.uid;
    await firestore
        .collection("chats")
        .doc(key)
        .collection("messages")
        .doc()
        .set({'message': message, 'sender': uid, 'timestamp': Timestamp.now()});
    await firestore
        .collection('usersData')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection('connections')
        .doc(key)
        .update({'lastTime': Timestamp.now(), 'lastMessage': message});
  }

  TextEditingController msgFieldController = TextEditingController();
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final appBar = AppBar(
      title: Text(argument['name'] ?? "Missing Name"),
    );

    if (isFirst) {
      this.loadMessages(argument['key']);
      isFirst = false;
    }
    Timer(
        Duration(milliseconds: 1000),
        () => scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              duration: Duration(microseconds: 100),
              curve: Curves.fastOutSlowIn,
            ));

    void handleSendMessage() {
      msgFieldController.text = msgFieldController.text.trim();
      if (msgFieldController.text.isEmpty) {
        return;
      }
      sendMessage(argument['key'], msgFieldController.text);
      msgFieldController.clear();
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }

    return Scaffold(
      appBar: appBar,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          messages.length > 0
              ? Expanded(
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: messages.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return MessageBubble(message: messages[index]);
                      }),
                )
              : Text(""),
          SendMessage(
              msgFieldController: msgFieldController,
              handleSendMessage: handleSendMessage),
        ],
      ),
    );
  }
}
