import 'package:blood_plus/screens/messageScreen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    Key key,
    @required this.connection,
  }) : super(key: key);

  final connection;

  @override
  _ChatTileState createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  String checkDate() {
    DateTime checkedTime = DateTime.fromMillisecondsSinceEpoch(
        widget.connection["lastTime"].seconds * 1000);
    print(DateFormat.jm().format(checkedTime));
    DateTime currentTime = DateTime.now();

    if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month) &&
        (currentTime.day == checkedTime.day)) {
      return DateFormat.jm().format(checkedTime);
    } else if ((currentTime.year == checkedTime.year) &&
        (currentTime.month == checkedTime.month)) {
      if ((currentTime.day - checkedTime.day) == 1) {
        return "YESTERDAY";
      } else if ((currentTime.day - checkedTime.day) == -1) {
        return "TOMORROW";
      } 
    }
    return DateFormat.MMMd().format(checkedTime);
  }

  @override
  Widget build(BuildContext context) {
    var message = widget.connection;
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
                widget.connection['name'],
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: Colors.black,
                      fontSize: 18,
                    ),
              ),
              subtitle: Text(message != null ? '${message["lastMessage"]}' : '',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                      )),
              trailing: Text(message != null ? '${checkDate()}' : '',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 13,
                      )),
              onTap: () {
                Navigator.pushNamed(context, MessageScreen.routeName,
                    arguments: widget.connection);
              },
            ))),
        Divider(),
      ],
    );
  }
}
