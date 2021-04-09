import '../screens/registerScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 35.0,
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
                  "Login",
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
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 1.0,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                            ),
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 10.0)),
                        style: TextStyle(fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor, onPrimary: Colors.white, shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0),
                        ),),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              "Login",
                              style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 24),
                            ),
                          ),
                        ),
                        onPressed: () {
                          print("login Clicked");
                        },
                      )
                    ],
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                    onPressed: () {
                       Navigator.of(context).pushNamed(RegisterScreen.routeName);
                    },
                    child: Text("Don't have an account? signup here!",
                    style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: "Raleway"),
                            ),)
              ],
            ),
          ),
        ));
  }
}
