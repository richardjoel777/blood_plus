import 'package:blood_plus/models/request.dart';
import 'package:flutter/material.dart';

import './models/blood_eligibility.dart';

const DUMMY_BLOOD = [
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
      borrow: [
        "All Blood Types"
      ],
      donate: ["AB+",],
      color: Colors.pink),
  BloodEligibility(
      id: 'bid5',
      blood: 'O-',
      borrow: [
        "O-",
      ],
      donate: ["All Blood Types"],
      color: Colors.yellow), 
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


const BLOOD_REQUESTS = [
  Request(
    id: 'r1',
    name: 'Richard',
    area: 'Trichy',
    bloodGroup: "A+",
    date: "12-04-2021",
  ),
   Request(
    id: 'r2',
    name: 'Robin',
    bloodGroup: "B+",
    area: 'Thirunelveli',
    date: "15-04-2021",
  ),
   Request(
    id: 'r3',
    name: 'Raveen',
    bloodGroup: "AB+",
    area: 'Tuticorin',
    date: "08-04-2021",
  ),
   Request(
    id: 'r4',
    name: 'Ravichandran',
    bloodGroup: "B+",
    area: 'Erode',
    date: "10-04-2021",
  ),
   Request(
    id: 'r5',
    name: 'Pravin',
    bloodGroup: "O+",
    area: 'Salem',
    date: "07-04-2021",
  ),
   Request(
    id: 'r6',
    name: 'Premnath',
    bloodGroup: "A+",
    area: 'Coimbatore',
    date: "11-04-2021",
  ),
];

const DONATION_HISTORY = [
 Request(
    id: 'r3',
    name: 'Raveen',
    bloodGroup: "AB+",
    area: 'Tuticorin',
    date: "08-04-2020",
  ),
   Request(
    id: 'r4',
    name: 'Ravichandran',
    bloodGroup: "B+",
    area: 'Erode',
    date: "12-12-2020",
  ),
];