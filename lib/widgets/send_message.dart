import 'package:flutter/material.dart';
class SendMessage extends StatelessWidget {
  const SendMessage({
    Key key,
    @required this.msgFieldController,
    @required this.handleSendMessage,
  }) : super(key: key);

  final TextEditingController msgFieldController;
  final Function handleSendMessage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60,
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: msgFieldController,
                    decoration: InputDecoration(
                        hintText: "Write message...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: handleSendMessage,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 18,
                  ),
                  backgroundColor: Colors.red,
                  elevation: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
