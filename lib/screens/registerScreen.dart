import 'package:blood_plus/models/user.dart';
import 'package:blood_plus/providers/auth.dart';
// import 'package:blood_plus/services/auth.dart';
import 'package:provider/provider.dart';

import '../screens/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/RegisterScreen';
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameTextEditingController = new TextEditingController();
  TextEditingController emailTextEditingController =
      new TextEditingController();
  TextEditingController phoneTextEditingController =
      new TextEditingController();
  TextEditingController passwordTextEditingController =
      new TextEditingController();
  TextEditingController addressTextEditingController =
      new TextEditingController();
  TextEditingController pinCodeTextEditingController =
      new TextEditingController();
  bool isnewDonor = true;
  DateTime _selectedDOB;
  DateTime _selectedDonatedDate;
  String bloodgroup;
  void _presentDOBDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDOB = pickedDate;
      });
    });
  }

  void _presentDonatedDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1930),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDonatedDate = pickedDate;
      });
    });
  }

  showErrorMessage(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 25.0,
                ),
                Image(
                  image: AssetImage("assets/images/logo.png"),
                  width: 290.0,
                  height: 200.0,
                  alignment: Alignment.center,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "Register",
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
                      TextField(
                        controller: emailTextEditingController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
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
                              'AB',
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
                        controller: phoneTextEditingController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            labelText: "Phone",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 1.0,
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
                      TextField(
                        controller: passwordTextEditingController,
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                                fontSize: 14.0, fontFamily: 'RobotoCondensed'),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Row(
                        children: [
                          Text(
                            "New to Donate?",
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
                              value: isnewDonor,
                              focusColor: Theme.of(context).primaryColor,
                              onChanged: (value) {
                                setState(() {
                                  isnewDonor = value;
                                  if (value == true) {
                                    _selectedDonatedDate = null;
                                  }
                                });
                              }),
                        ],
                      ),
                      if (!isnewDonor)
                        Row(
                          children: [
                            Text(
                              _selectedDonatedDate == null
                                  ? "Last Donated Date : "
                                  : 'Picked Date: ${DateFormat.yMd().format(_selectedDonatedDate)}',
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
                              onPressed: _presentDonatedDatePicker,
                              child: Text(
                                "Choose Date",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
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
                              "Create Account",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (nameTextEditingController.text.length < 4) {
                            showErrorMessage(
                                "Name should be atleast 4 characters");
                          } else if (_selectedDOB == null) {
                            showErrorMessage("DOB is mandatory");
                          } else if (!emailTextEditingController.text
                              .contains("@")) {
                            showErrorMessage("Email is not valid");
                          } else if (bloodgroup == ' ') {
                            showErrorMessage("Blood Group is mandatory");
                          } else if (phoneTextEditingController.text.length <
                              10) {
                            showErrorMessage(
                                "Phone no. should be atleast 10 characters");
                          } else if (addressTextEditingController.text.length <
                              25) {
                            showErrorMessage(
                                "Address should be atleast 25 characters");
                          } else if (pinCodeTextEditingController
                              .text.isEmpty) {
                            showErrorMessage("Pin Code is mandatory");
                          } else if (passwordTextEditingController.text.length <
                              7) {
                            showErrorMessage(
                                "Password should be atleast 7 characters");
                          } else if (!isnewDonor &&
                              _selectedDonatedDate == null) {
                            showErrorMessage("Last Donated date is mandatory");
                          } else {
                            UserData result = await _auth.signUpEmail(
                                emailTextEditingController.text,
                                passwordTextEditingController.text,
                                nameTextEditingController.text);
                            if (result == null) {
                              print("Something went wrong");
                            } else {
                              await _auth.registerUserData(
                                  result.uid,
                                  nameTextEditingController.text,
                                  emailTextEditingController.text,
                                  bloodgroup,
                                  phoneTextEditingController.text,
                                  addressTextEditingController.text,
                                  pinCodeTextEditingController.text,
                                  _selectedDOB,
                                  isnewDonor,
                                  _selectedDonatedDate);
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  '/', (route) => false);
                            }
                          }
                        },
                      )
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text(
                    "Have an account? Login here!",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Raleway"),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
