import 'package:blood_plus/providers/chats.dart';
import 'package:blood_plus/widgets/chatTile.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
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
                        SizedBox(height: 40,),
                        Text("No Messages for Now",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  ),
        ],
      ),
    );
  }
}
