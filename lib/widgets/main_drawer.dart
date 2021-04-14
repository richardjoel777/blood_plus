import 'package:blood_plus/screens/loginScreen.dart';
import 'package:blood_plus/screens/my_requests.dart';
import 'package:provider/provider.dart';
import 'package:blood_plus/providers/auth.dart';
import 'package:blood_plus/screens/donation_history_screen.dart';
import 'package:flutter/material.dart';
import '../screens/profileScreen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColor,
            child: Text(
              'Blood+',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile(
            'Home',
            Icons.home,
            () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
            },
          ),
          buildListTile(
            'My Profile',
            Icons.person,
            () {
              Navigator.of(context).pushNamedAndRemoveUntil(ProfileScreen.routeName, (route) => false);
            },
          ),
          buildListTile(
            'Donation History',
            Icons.history,
            () {
              Navigator.of(context).pushNamedAndRemoveUntil(DonationHistoryScreen.routeName, (route) => false);
            },
          ),
          buildListTile('My Requests', Icons.request_page, () {
            Navigator.pushNamedAndRemoveUntil(
                context, MyRequestsScreen.routeName, (route) => false);
          }),
          buildListTile('Logout', Icons.logout, () {
            _auth.signOut();
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.routeName, (route) => false);
          })
        ],
      ),
    );
  }
}
