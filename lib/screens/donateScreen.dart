import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:blood_plus/providers/donations.dart';
import '../widgets/donation_request_item.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  @override
  Widget build(BuildContext context) {
    final donationRequestsData = Provider.of<Donations>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.red[100]),
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              // padding: EdgeInsets.all(15),
              height: 559,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: donationRequestsData.currentDonationRequests.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value:
                              donationRequestsData.currentDonationRequests[index],
                          child: DonationRequestItem(),
                        );
                      },
                      itemCount:
                          donationRequestsData.currentDonationRequests.length)
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
                          Text("No Requests for You now",
                              style:
                                  Theme.of(context).textTheme.headline1.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal
                                      )),               
                        ],
                      ),
                    )),
        ],
      ),
    );
  }
}
