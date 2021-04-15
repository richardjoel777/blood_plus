import 'package:blood_plus/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/donations.dart';

class DonationHistoryScreen extends StatelessWidget {
  static const routeName = "/donate-history";
  @override
  Widget build(BuildContext context) {
    final donationsData = Provider.of<Donations>(context);
    return Scaffold(
      drawer: MainDrawer(),
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
            margin: EdgeInsets.symmetric(vertical: 15),
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
                : Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 200,
                              child: Image.asset(
                                'assets/images/empty.png',
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Text("Your History is Empty",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                          SizedBox(
                            height: 35,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, '/', (route) => false);
                            },
                            child: Text('Go Home'),
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.white),
                          )
                        ],
                      ),
                    ),
          ),
        ],
      ),
    );
  }
}
