// import 'package:blood_plus/models/request.dart';

import '../dummy_data.dart';
import 'package:flutter/material.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  final List _bloodRequests = BLOOD_REQUESTS;
  final List _donationHistory = DONATION_HISTORY;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5,),
        Text("BLOOD REQUESTS", style:Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.black)),
        Container(
          // padding: EdgeInsets.all(15),
          height: 300,
          margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: _bloodRequests.length>1 ? ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: 150,
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
                                  child: Text(_bloodRequests[index].name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.black)),
                                  fit: BoxFit.fitWidth,
                                ),
                                Text(_bloodRequests[index].bloodGroup,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                Text(_bloodRequests[index].date,
                                    style:
                                        Theme.of(context).textTheme.headline1),
                                FittedBox(
                                  child: Text(_bloodRequests[index].area,
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
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.green),
                                  child: Text("Accept")),
                              ElevatedButton(
                                  onPressed: () {}, child: Text("Decline")),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: _bloodRequests.length) : Column(
              children: [
                Text("No Requests for Now", style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.black, fontSize: 16,)),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 100,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
              ) 
        ),
        SizedBox(height: 4,),
        Text("YOUR DONATIONS HISTORY", style:Theme.of(context)
                                          .textTheme
                                          .headline6
                                          .copyWith(color: Colors.black)),
        Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 200,
            child: _donationHistory.length > 0 ? ListView.builder(
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
                              _donationHistory[index].bloodGroup,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                        title: Text(
                          _donationHistory[index].name,
                          style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
                        ),
                        trailing: Text(_donationHistory[index].date,
                        style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                );
              },
              itemCount: _donationHistory.length,
            ) : 
             Center(child: Text("No History yet. make it now :)", style:Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Colors.black, fontSize: 16,))),
            ),
        // Container(
        //   // padding: EdgeInsets.all(15),
        //   height: 250,
        //   margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        //   child: ListView.builder(
        //       itemBuilder: (context, index) {
        //         return Container(
        //           margin: EdgeInsets.only(
        //             bottom: 10,
        //           ),
        //           child: Card(
        //             elevation: 5,
        //             child: Container(
        //               height: 150,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisAlignment: MainAxisAlignment.center,
        //                 children: [
        //                   FittedBox(
        //                     child: Text(_donationHistory[index].name,
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .headline6
        //                             .copyWith(color: Colors.black)),
        //                     fit: BoxFit.fitWidth,
        //                   ),
        //                   Text(_donationHistory[index].bloodGroup,
        //                       style: Theme.of(context).textTheme.headline1),
        //                   Text(_donationHistory[index].date,
        //                       style: Theme.of(context).textTheme.headline1),
        //                   FittedBox(
        //                     child: Text(_donationHistory[index].area,
        //                         style: Theme.of(context)
        //                             .textTheme
        //                             .headline1
        //                             .copyWith(fontSize: 14)),
        //                     fit: BoxFit.fitWidth,
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         );
        //       },
        //   itemCount: _donationHistory.length),
        // ),
      ],
    );
  }
}
