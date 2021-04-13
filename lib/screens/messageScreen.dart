import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  static const routeName = "/MessageScreen";
  @override
  State<StatefulWidget> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  var messages = [];
  void loadMessages(String key) async {
    var tMessages = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var snapshot = await firestore
        .collection("chats")
        .doc(key)
        .collection("messages")
        .get();
    snapshot.docs.forEach((element) {
      tMessages.add(element.data());
      print(element.data()['message']);
    });
    setState(() {
      messages = tMessages;
      print(messages[0]['message']);
    });
  }

  void sendMessage(String key) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    await firestore
        .collection("chats")
        .doc(key)
        .collection("messages")
        .doc()
        .set({'message': "a new message"});
    loadMessages(key);
  }

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 200, 33),
        appBar: AppBar(
          title: Text("Messages"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("Click me"),
              onPressed: () => this.loadMessages(argument['key']),
            ),
            messages.length > 0
                ? Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 40,
                              child: GestureDetector(
                                child: Text(messages[index]['message']),
                                onTap: () {},
                              ));
                        }))
                : Text("Nothing"),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Type your message here",
                        suffix: IconButton(
                          onPressed: () {
                            sendMessage(argument['key']);
                          },
                          icon: Icon(Icons.send),
                        )),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
