import 'package:blood_plus/models/request.dart';
import 'package:blood_plus/providers/donations.dart';
import 'package:blood_plus/widgets/main_drawer.dart';
import 'package:blood_plus/widgets/myRequestItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyRequestsScreen extends StatelessWidget {
  static const routeName = '/my-requests';
  @override
  Widget build(BuildContext context) {
    final List<Request> myrequests = Provider.of<Donations>(context).myRequests;
    return Scaffold(
        backgroundColor: Colors.white,
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('My Requests'),
        ),
        body: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              height: 590,
              child: myrequests.length > 0
                  ? ListView.builder(
                      itemCount: myrequests.length,
                      itemBuilder: (ctx, index) => Column(
                        children: [
                          MyRequestItem(
                              name: myrequests[index].name,
                              id: myrequests[index].id,
                              bloodGroup: myrequests[index].bloodGroup,
                              date: myrequests[index].date),
                          Divider(),    
                        ],
                      ))
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
                          Text("No Active Requests from You",
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
                    )),
        ]));
  }
}
