import 'package:blood_plus/providers/auth.dart';
import 'package:blood_plus/providers/bloods.dart';
import 'package:blood_plus/providers/donations.dart';
import 'package:blood_plus/providers/user.dart';
import 'package:blood_plus/screens/chatScreen.dart';
import 'package:blood_plus/screens/loginScreen.dart';
import 'package:blood_plus/screens/messageScreen.dart';
import 'package:blood_plus/screens/registerScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/profileScreen.dart';
import './screens/bloodItemScreen.dart';
import './screens/tabsScreen.dart';
import './screens/donation_history_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (ctx) => Bloods(),
          ),
          ChangeNotifierProvider(
            create: (ctx) => Donations(),
          ),
          ChangeNotifierProvider(create: (ctx) => AuthProvider()),
          ChangeNotifierProvider(create: (ctx) => CurrentUser()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primarySwatch: Colors.red,
              accentColor: Colors.yellowAccent,
              canvasColor: Color.fromRGBO(255, 2254, 229, 1),
              fontFamily: 'Raleway',
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(20, 51, 51, 1),
                  ),
                  headline6: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ),
                  headline1: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontFamily: 'RobotoCondensed',
                    fontWeight: FontWeight.bold,
                  ))),
          initialRoute: FirebaseAuth.instance.currentUser == null
              ? LoginScreen.routeName
              : '/',
          routes: {
            '/': (ctx) => TabsScreen(),
            DonationHistoryScreen.routeName: (ctx) => DonationHistoryScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            BloodItemScreen.routeName: (ctx) => BloodItemScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            ChatScreen.routeName: (ctx) => ChatScreen(),
            MessageScreen.routeName: (ctx) => MessageScreen(),
          },
        ));
  }
}
