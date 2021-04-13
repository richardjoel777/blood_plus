import 'package:blood_plus/providers/chats.dart';
import 'package:blood_plus/screens/messageScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  static const routeName = "/ChatScreen";
  @override
  State<StatefulWidget> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    Connections conn = Provider.of<Connections>(context);
    var connections = conn.connections;
    return Column(
      children: [
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
