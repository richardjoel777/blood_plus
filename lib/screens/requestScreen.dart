import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:blood_plus/providers/donations.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController areaTextEditingController = new TextEditingController();
  TextEditingController pinCodeTextEditingController =
      new TextEditingController();
  DateTime _selectedDOB;
  TextEditingController unitsTextEditingController =
      new TextEditingController();
  TextEditingController ageTextEditingController = new TextEditingController();
  DateTime _selectedRequiredDate;
  String bloodgroup;
  bool isCritical = false;
  void _presentDOBDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime(2003),
            firstDate: DateTime(1930),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDOB = pickedDate;
      });
    });
  }

  void _presentRequiredDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime(2022))
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedRequiredDate = pickedDate;
      });
    });
  }

  showErrorMessage(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  @override
  Widget build(BuildContext context) {
    final donationRequestsData = Provider.of<Donations>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Column(
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            "Request Blood",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: Colors.red, fontSize: 32),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          Container(
            child: Column(
              children: [
                TextField(
                  controller: nameTextEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Name",
                      labelStyle: TextStyle(
                          fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0)),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      _selectedDOB == null
                          ? "DOB : "
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedDOB)}',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: _presentDOBDatePicker,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: ageTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Age",
                      labelStyle: TextStyle(
                          fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Blood Group : ",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: bloodgroup != null ? bloodgroup : null,
                      items: <String>[
                        'A+',
                        'B+',
                        'AB+',
                        'O+',
                        'A-',
                        'B-',
                        'AB-',
                        'O-'
                      ].map((String v) {
                        return new DropdownMenuItem<String>(
                          value: v,
                          child: Text(v),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          bloodgroup = newValue;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                TextField(
                  controller: unitsTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Units",
                      labelStyle: TextStyle(
                          fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: areaTextEditingController,
                  decoration: InputDecoration(
                      labelText: "Area",
                      labelStyle: TextStyle(
                          fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: pinCodeTextEditingController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Pin Code",
                      labelStyle: TextStyle(
                          fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      _selectedRequiredDate == null
                          ? "Required Date : "
                          : 'Picked Date: ${DateFormat.yMd().format(_selectedRequiredDate)}',
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: _presentRequiredDatePicker,
                      child: Text(
                        "Choose Date",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Text(
                      "Is Critical?",
                      style: Theme.of(context).textTheme.headline1.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Switch(
                        value: isCritical,
                        focusColor: Theme.of(context).primaryColor,
                        onChanged: (value) {
                          setState(() {
                            isCritical = value;
                          });
                        }),
                  ],
                ),
              ],
            ),
          ),
          Spacer(),
          InkWell(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.red,
              ),
              child: Text(
                "Request Blood",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(fontSize: 24),
              ),
            ),
            onTap: () async {
              if (nameTextEditingController.text.length < 4) {
                showErrorMessage("Name should be atleast 4 characters");
              } else if (_selectedDOB == null) {
                showErrorMessage("DOB is mandatory");
              } else if (bloodgroup == null) {
                showErrorMessage("Blood Group is mandatory");
              } else if (unitsTextEditingController.text.isEmpty ||
                  int.parse(unitsTextEditingController.text) <= 0 ||
                  int.parse(unitsTextEditingController.text) >= 3) {
                showErrorMessage("Enter valid Units");
              } else if (areaTextEditingController.text.length < 8) {
                showErrorMessage("Area should be atleast 25 characters");
              } else if (pinCodeTextEditingController.text.isEmpty) {
                showErrorMessage("Pin Code is mandatory");
              } else if (ageTextEditingController.text.isEmpty) {
                showErrorMessage("Age is mandatory");
              } else if (_selectedRequiredDate == null) {
                showErrorMessage("Required Date is mandatory");
              } else {
                await donationRequestsData.uploadRequest(
                    nameTextEditingController.text,
                    bloodgroup,
                    _selectedRequiredDate,
                    _selectedDOB,
                    pinCodeTextEditingController.text,
                    int.parse(ageTextEditingController.text),
                    int.parse(unitsTextEditingController.text),
                    areaTextEditingController.text,
                    isCritical);
                Fluttertoast.showToast(
                    msg: "Your Request is successfully placed");
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (route) => false);
              }
            },
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }
}
