import 'package:blood_plus/providers/donations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRequestItem extends StatelessWidget {
  final String id;
  final String name;
  final String date;
  final String bloodGroup;
  MyRequestItem(
      {@required this.name,
      @required this.id,
      @required this.bloodGroup,
      @required this.date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 60,
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          child: FittedBox(
            child: Text(bloodGroup, style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(color: Colors.white),),
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      title: Text(name, style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Colors.black, fontSize: 16)),
      subtitle: Text(date, style: Theme.of(context).textTheme.headline1,),
      trailing: TextButton(
        child: Icon(Icons.delete),
        onPressed: () {
          return showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                    title: Text('Are You Sure?', style: TextStyle(color: Colors.black),),
                    // titleTextStyle: TextStyle(color: Colors.black,),
                    content: Text('Do You want to remove it from the list?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Text('No')),
                      TextButton(
                          onPressed: () async {
                            await Provider.of<Donations>(context, listen: false)
                                .deleteRequest(id);
                            Navigator.of(ctx).pop();
                          },
                          child: Text('Yes'))
                    ],
                  ));
        },
      ),
    );
  }
}
