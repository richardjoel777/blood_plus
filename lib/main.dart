import './screens/bloodItemScreen.dart';

import './screens/tabsScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                color: Color.fromRGBO(255,255,255, 1),
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
              headline1: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              )
              )),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        BloodItemScreen.routeName: (ctx) => BloodItemScreen(),
      },
    );
  }
}