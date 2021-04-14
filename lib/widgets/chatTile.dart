import 'package:blood_plus/screens/messageScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
    @required this.connection,
  }) : super(key: key);

  final connection;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: GestureDetector(
                child: ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.blueGrey,
              ),
              title: Text(
                connection['name'],
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    ),
              ),
              subtitle: Text(connection['lastMessage'] ?? '',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      )),
              trailing: Text(
                  connection['lastTime'].toDate().toString().substring(0, 19) ??
                      '',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      )),
              onTap: () {
                Navigator.pushNamed(context, MessageScreen.routeName,
                    arguments: connection);
              },
            ))),
        Divider(),
      ],
    );
  }
}
