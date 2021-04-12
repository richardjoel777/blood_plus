import 'package:blood_plus/models/request.dart';
import 'package:flutter/cupertino.dart';

class Donations with ChangeNotifier {
  List<Request> _currentDonationRequests = [
    Request(
      id: 'r1',
      name: 'Richard',
      age: 18,
      area: 'Trichy',
      bloodGroup: "A+",
      date: "12-04-2021",
    ),
    Request(
      id: 'r2',
      name: 'Robin',
      age: 22,
      bloodGroup: "B+",
      area: 'Thirunelveli',
      date: "15-04-2021",
    ),
    Request(
      id: 'r3',
      name: 'Raveen',
      age: 43,
      bloodGroup: "AB+",
      area: 'Tuticorin',
      date: "08-04-2021",
    ),
    Request(
      id: 'r4',
      name: 'Ravichandran',
      age: 36,
      bloodGroup: "B+",
      area: 'Erode',
      date: "10-04-2021",
    ),
    Request(
      id: 'r5',
      name: 'Pravin',
      age: 15,
      bloodGroup: "O+",
      area: 'Salem',
      date: "07-04-2021",
    ),
    Request(
      id: 'r6',
      name: 'Premnath',
      age: 62,
      bloodGroup: "A+",
      area: 'Coimbatore',
      date: "11-04-2021",
    ),
  ];
  List<Request> get currentDonationRequests {
    return [..._currentDonationRequests];
  }

  List<Request> _donationHistory = [
    Request(
      id: 'r3',
      name: 'Raveen',
      age: 43,
      bloodGroup: "AB+",
      area: 'Tuticorin',
      date: "08-04-2020",
    ),
    Request(
      id: 'r4',
      name: 'Ravichandran',
      age: 36,
      bloodGroup: "B+",
      area: 'Erode',
      date: "12-12-2020",
    ),
  ];
  List<Request> get donationHistory {
    return [..._donationHistory];
  }
}
