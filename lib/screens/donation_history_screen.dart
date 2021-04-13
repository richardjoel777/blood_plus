import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/donations.dart';

class DonationHistoryScreen extends StatelessWidget {
  static const routeName = "/donate-history";
  @override
  Widget build(BuildContext context) {
    final donationsData = Provider.of<Donations>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text(
        'Donation History',
        style: Theme.of(context).textTheme.headline6,
      )),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text("YOUR DONATIONS HISTORY",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.black)),
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 590,
            child: donationsData.donationsHistory.length > 0
                ? ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ListTile(
                              leading: CircleAvatar(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    donationsData.donationsHistory[index].bloodGroup,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                              title: Text(
                                donationsData.donationsHistory[index].name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(color: Colors.black),
                              ),
                              trailing: Text(
                                donationsData.donationsHistory[index].date,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                    itemCount: donationsData.donationsHistory.length,
                  )
                : Center(
                    child: Text("No History yet. make it now :)",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              color: Colors.black,
                              fontSize: 16,
                            ))),
          ),
        ],
      ),
    );
  }
}
