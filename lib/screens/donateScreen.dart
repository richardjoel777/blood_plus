import 'dart:convert';

import 'package:blood_plus/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:blood_plus/providers/donations.dart';
import '../widgets/donation_request_item.dart';

class DonateScreen extends StatefulWidget {
  @override
  _DonateScreenState createState() => _DonateScreenState();
}

class _DonateScreenState extends State<DonateScreen> {
  Geolocator geolocator = Geolocator();
  bool isAreaFilter = false;
  Future<void> getRequestsData(List requests, List loaded) async {
    print("hi");
    print(requests.length);
    final currentUserData = Provider.of<CurrentUser>(context, listen: false);
    final String uPinCode = currentUserData.userData["pincode"];
    print(uPinCode);
    final uUrl = Uri.parse(
        'https://nominatim.openstreetmap.org/search/$uPinCode?format=json');
    var uRes = await http.get(uUrl);
    var uResData = jsonDecode(uRes.body);
    print(uResData);
    Provider.of<Donations>(context, listen: false).clearLoadedrequests();
    requests.forEach((r) async {
      print(r.area);
      var url = Uri.parse(
          'https://nominatim.openstreetmap.org/search/${r.pincode}?format=json');
      print(r.pincode);
      var res = await http.get(url);
      var resData = jsonDecode(res.body);
      print(uResData[0]["lat"]);
      print(uResData[0]["lon"]);
      print(resData[0]["lat"]);
      print(resData[0]["lon"]);
      var distance = (await geolocator.distanceBetween(
              double.parse(uResData[0]["lat"]),
              double.parse(uResData[0]["lon"]),
              double.parse(resData[0]["lat"]),
              double.parse(resData[0]["lon"])) /
          1000);
      print(distance);
      if (distance <= 50) {
        Provider.of<Donations>(context, listen: false).addLoadedRequest(r);
      }
      print(loaded.length);
    });
  }

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
          Align(
            alignment: Alignment.topRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Show requests from 50km radius',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 14, color: Colors.black),
                ),
                Switch(
                    value: isAreaFilter,
                    onChanged: (value) async {
                      setState(() {
                        isAreaFilter = value;
                      });
                      if (isAreaFilter) {
                        await getRequestsData(
                            donationRequestsData.currentDonationRequests,
                            donationRequestsData.loadedRequests);
                      }
                    }),
              ],
            ),
          ),
          Container(
              // padding: EdgeInsets.all(15),
              height: 559,
              margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: donationRequestsData.currentDonationRequests.length > 0
                  ? ListView.builder(
                      itemBuilder: (context, index) {
                        return ChangeNotifierProvider.value(
                          value: !isAreaFilter
                              ? donationRequestsData
                                  .currentDonationRequests[index]
                              : donationRequestsData.loadedRequests[index],
                          child: DonationRequestItem(),
                        );
                      },
                      itemCount: !isAreaFilter
                          ? donationRequestsData.currentDonationRequests.length
                          : donationRequestsData.loadedRequests.length)
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
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                        ],
                      ),
                    )),
        ],
      ),
    );
  }
}
