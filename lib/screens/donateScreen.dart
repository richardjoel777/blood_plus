import 'package:blood_plus/models/request.dart';
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
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Text("BLOOD REQUESTS",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.black)),
        Container(
            // padding: EdgeInsets.all(15),
            height: 559,
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: donationRequestsData.currentDonationRequests.length >= 1
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
                        Text("No Requests for Now",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      color: Colors.black,
                                      fontSize: 16,
                                    )),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 200,
                            child: Image.asset(
                              'assets/images/waiting.png',
                              fit: BoxFit.cover,
                            )),
                      ],
                    ),
                  )),
      ],
    );
  }
}
