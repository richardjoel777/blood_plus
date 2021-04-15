import 'package:blood_plus/models/request.dart';
import 'package:blood_plus/providers/donations.dart';
import 'package:blood_plus/screens/chatScreen.dart';
import 'package:blood_plus/utils/chat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonationRequestItem extends StatelessWidget {
  const DonationRequestItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = Provider.of<Request>(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Card(
        elevation: 5,
        child: Container(
          height: 160,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: Text(request.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.black)),
                      fit: BoxFit.fitWidth,
                    ),
                    Text(request.bloodGroup,
                        style: Theme.of(context).textTheme.headline1),
                    Text('${request.age}',
                        style: Theme.of(context).textTheme.headline1),
                    Text(request.date,
                        style: Theme.of(context).textTheme.headline1),
                    FittedBox(
                      child: Text(request.area,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .copyWith(fontSize: 14)),
                      fit: BoxFit.fitWidth,
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        print("initiating chat");
                        await initiateChat(
                            request.id, request.uid, request.name);
                        print("initiated chat");
                        Navigator.of(context)
                            .pushNamed(ChatScreen.routeName, arguments: true);
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Text("Accept")),
                  // ElevatedButton(
                  //     onPressed: () {}, child: Text("Decline (shant exist)")),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
