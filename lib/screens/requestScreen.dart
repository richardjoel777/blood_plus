import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class RequestsScreen extends StatefulWidget {
  @override
  _RequestsScreenState createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController addressTextEditingController =
      new TextEditingController();
  TextEditingController pinCodeTextEditingController =
      new TextEditingController();
  DateTime _selectedDOB;
  TextEditingController unitsTextEditingController = new TextEditingController();
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
            lastDate: DateTime(2022)
    )
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
    return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  "Request Blood",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black, fontSize: 24),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1.0,
                      ),
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
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          Text(
                            _selectedDOB == null
                                ? "DOB : "
                                : 'Picked Date: ${DateFormat.yMd().format(_selectedDOB)}',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: _presentDOBDatePicker,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Blood Group : ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
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
                        height: 1.0,
                      ),
                      TextField(
                        controller: unitsTextEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Units",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextField(
                        controller: addressTextEditingController,
                        decoration: InputDecoration(
                            labelText: "Address",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      TextField(
                        controller: pinCodeTextEditingController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Pin Code",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            _selectedRequiredDate == null
                                ? "Required Date : "
                                : 'Picked Date: ${DateFormat.yMd().format(_selectedRequiredDate)}',
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Theme.of(context).primaryColor),
                            onPressed: _presentRequiredDatePicker,
                            child: Text(
                              "Choose Date",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Is Critical?",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(
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
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          onPrimary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                        ),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Request Blood",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (nameTextEditingController.text.length < 4) {
                            showErrorMessage(
                                "Name should be atleast 4 characters");
                          } else if (_selectedDOB == null) {
                            showErrorMessage("DOB is mandatory");
                          } else if (bloodgroup == null) {
                            showErrorMessage("Blood Group is mandatory");
                          } 
                          else if (unitsTextEditingController
                              .text.isEmpty || int.parse(unitsTextEditingController.text) <= 0 || int.parse(unitsTextEditingController.text) >=3) {
                            showErrorMessage("Enter valid Units");
                          }
                           else if (addressTextEditingController.text.length <
                              25) {
                            showErrorMessage(
                                "Address should be atleast 25 characters");
                          } else if (pinCodeTextEditingController
                              .text.isEmpty) {
                            showErrorMessage("Pin Code is mandatory");
                          }
                          else if (_selectedRequiredDate == null) {
                            showErrorMessage("Required Date is mandatory");
                          }
                          
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
