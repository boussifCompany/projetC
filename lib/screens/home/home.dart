import 'package:clothis/screens/home/components/homepage.dart';
import 'package:clothis/services/get_current_user.dart';
import 'package:clothis/styles/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Homepage(),
    Text('Wardrobe'),
  ];

  void _onItemTapped(int _index) {
    setState(() {
      _selectedIndex = _index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Text(
            'Home',
            style: TextStyle(color: Colors.black, fontSize: 20),
          )),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedIndex,
      selectedItemColor: primaryColor,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.dns),
            label: 'Wardrobe'
        )
      ],
    ),);
  }
}
