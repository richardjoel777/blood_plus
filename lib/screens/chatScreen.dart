import 'package:blood_plus/providers/chats.dart';
import 'package:blood_plus/widgets/chatTile.dart';
import 'package:blood_plus/widgets/main_drawer.dart';
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
    bool isFromDonate = ModalRoute.of(context).settings.arguments as bool;
    if (isFromDonate == null) {
      setState(() {
        isFromDonate = false;
      });
    }
    var connections = conn.connections;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MainDrawer(),
      appBar: isFromDonate
          ? AppBar(
              title: Text("Chat"),
            )
          : null,
      body: Column(
        children: [
          connections.length > 0
              ? Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: connections.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            ChatTile(connection: connections[index]),
                          ],
                        );
                      }))
              : Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                          height: 200,
                          child: Image.asset(
                            'assets/images/empty.png',
                            fit: BoxFit.cover,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text("No Messages Yet..",
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 16, fontWeight: FontWeight.normal)),
                      SizedBox(
                        height: 35,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/', (route) => false);
                        },
                        child: Text('Go Home'),
                        style:
                            ElevatedButton.styleFrom(onPrimary: Colors.white),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
