import 'package:blood_plus/screens/chatScreen.dart';
import 'package:flutter/material.dart';

import '../screens/donateScreen.dart';
import '../screens/requestScreen.dart';
import '../widgets/main_drawer.dart';
import './homeScreen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  int _selectedPageIndex = 0;
  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
        'title': "Home",
      },
      {
        'page': RequestsScreen(),
        'title': "Request",
      },
      {
        'page': DonateScreen(),
        'title': "Donate",
      },
      {
        'page': ChatScreen(),
        'title': "Chat",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pages[_selectedPageIndex]['title'],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: _pages[_selectedPageIndex]['page'],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.request_page), label: "Request"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Donate"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
        ],
      ),
    );
  }
}
