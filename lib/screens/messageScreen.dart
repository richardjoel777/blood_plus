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
  void test() async {
    var t_messages = [];
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    var snapshot = await firestore
        .collection("chats")
        .doc("2HT4jC0Q0UiMNADbErZB")
        .collection("messages")
        .get();
    snapshot.docs.forEach((element) {
      t_messages.add(element.data());
      print(element.data()['message']);
    });
    setState(() {
      messages = t_messages;
      print(messages[0]['message']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 200, 33),
        appBar: AppBar(
          title: Text("Messages"),
        ),
        body: Column(
          children: [
            ElevatedButton(
              child: Text("Click me"),
              onPressed: () => this.test(),
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
                : Text("Nothing")
          ],
        ));
  }
}
