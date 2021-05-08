import 'package:blood_plus/providers/auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../screens/registerScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final _auth = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: Column(
          children: [
            Spacer(),
            Expanded(
              flex: 6,
              child: Image(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Text(
              "Login",
              style: TextStyle(
                  color: Colors.red.shade800,
                  fontSize: 32,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextField(
                    obscureText: true,
                    controller: password,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
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
                  "Login",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 24),
                ),
              ),
              onTap: () async {
                dynamic result =
                    await _auth.signInEmail(email.text, password.text);
                if (result == null) {
                  Fluttertoast.showToast(msg: "Something went wrong");
                } else {
                  Fluttertoast.showToast(msg: "Logged in successfully");
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RegisterScreen.routeName, (route) => false);
                  },
                ),
              ],
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
