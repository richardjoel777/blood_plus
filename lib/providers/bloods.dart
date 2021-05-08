import 'package:flutter/material.dart';

import 'package:blood_plus/models/blood_eligibility.dart';

class Bloods with ChangeNotifier {
  List<BloodEligibility> _bloods = [
    BloodEligibility(
        id: 'bid1',
        blood: 'O+',
        borrow: [
          'O+',
          "O-",
          "A+",
          "A-",
        ],
        donate: [
          "A+",
          "AB+",
        ],
        color: Colors.pink),
    BloodEligibility(
        id: 'bid2',
        blood: 'B+',
        borrow: [
          'O+',
          "O-",
          "B+",
          "B-",
        ],
        donate: [
          "B+",
          "AB+",
        ],
        color: Colors.purple),
    BloodEligibility(
        id: 'bid3',
        blood: 'O+',
        borrow: [
          'O+',
          "O-",
        ],
        donate: ["O+", "A+", "B+", "AB+"],
        color: Colors.green),
    BloodEligibility(
        id: 'bid4',
        blood: 'AB+',
        borrow: ["All Blood Types"],
        donate: [
          "AB+",
        ],
        color: Colors.pink),
    BloodEligibility(
        id: 'bid5',
        blood: 'O-',
        borrow: [
          "O-",
        ],
        donate: ["All Blood Types"],
        color: Colors.deepPurple),
    BloodEligibility(
        id: 'bid6',
        blood: 'A-',
        borrow: [
          'A-',
          "O-",
        ],
        donate: ["A-", "A+", "AB-", "AB+"],
        color: Colors.blue),
    BloodEligibility(
        id: 'bid7',
        blood: 'B-',
        borrow: [
          'B-',
          "O-",
        ],
        donate: ["B-", "B+", "AB-", "AB+"],
        color: Colors.blueGrey),
    BloodEligibility(
        id: 'bid8',
        blood: 'AB-',
        borrow: [
          'AB-',
          "A-",
          "B-",
          "O-",
        ],
        donate: ["AB-", "AB+"],
        color: Colors.orange),
  ];

  List<BloodEligibility> get bloods {
    return [..._bloods];
  }
}
