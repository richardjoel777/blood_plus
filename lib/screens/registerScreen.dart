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
  TextEditingController nameTextEditingController;
  TextEditingController emailTextEditingController;
  TextEditingController phoneTextEditingController;
  TextEditingController passwordTextEditingController;
  TextEditingController addressTextEditingController;
  TextEditingController pinCodeTextEditingController;
  bool isnewDonor = true;
  DateTime _selectedDOB;
  DateTime _selectedDonatedDate;
  String bloodgroup;

  @override
  initState() {
    nameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    phoneTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    addressTextEditingController = TextEditingController();
    pinCodeTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  dispose() {
    nameTextEditingController.dispose();
    emailTextEditingController.dispose();
    phoneTextEditingController.dispose();
    passwordTextEditingController.dispose();
    addressTextEditingController.dispose();
    pinCodeTextEditingController.dispose();
    super.dispose();
  }

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
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: _height * 0.05),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Register",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.red.shade800, fontSize: 32),
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  Flexible(
                    child: Image(
                      image: AssetImage("assets/images/logo.png"),
                      fit: BoxFit.contain,
                      height: _height * 0.1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: _height * 0.05),
              Container(
                //padding: EdgeInsets.all(20.0),
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
                      height: 5,
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
                          textAlign: TextAlign.right,
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
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
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
                      height: 5.0,
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
                      height: 5.0,
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
                      height: 5.0,
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
                      height: 5,
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
                      height: 5,
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
                          style: Theme.of(context).textTheme.headline1.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Switch(
                            value: isnewDonor,
                            focusColor: Colors.red,
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
                  ],
                ),
              ),
              SizedBox(height: _height * 0.1),
              InkWell(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.red,
                  ),
                  child: Text(
                    "Sign Up",
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
                  } else if (!emailTextEditingController.text.contains("@")) {
                    showErrorMessage("Email is not valid");
                  } else if (bloodgroup == ' ') {
                    showErrorMessage("Blood Group is mandatory");
                  } else if (phoneTextEditingController.text.length < 10) {
                    showErrorMessage(
                        "Phone no. should be atleast 10 characters");
                  } else if (addressTextEditingController.text.length < 25) {
                    showErrorMessage("Address should be atleast 25 characters");
                  } else if (pinCodeTextEditingController.text.isEmpty) {
                    showErrorMessage("Pin Code is mandatory");
                  } else if (passwordTextEditingController.text.length < 7) {
                    showErrorMessage("Password should be atleast 7 characters");
                  } else if (!isnewDonor && _selectedDonatedDate == null) {
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
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil('/', (route) => false);
                    }
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  TextButton(
                    child: Text(
                      "LogIn",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName, (route) => false);
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
