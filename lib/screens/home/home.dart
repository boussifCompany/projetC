import 'package:clothis/models/wardrobe_model.dart';
import 'package:clothis/screens/addCloth/add_cloth.dart';
import 'package:clothis/screens/home/components/homepage.dart';
import 'package:clothis/screens/home/components/wardrobe.dart';
import 'package:clothis/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final WardrobeModel wardrobe;

  Home(this.wardrobe);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  WardrobeModel _wardrobe;

  static List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Homepage(),
      Wardrobe(widget.wardrobe),
    ];
  }

  void _onItemTapped(int _index) {
    setState(() {
      _selectedIndex = _index;
    });
  }

  void _addCloth(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AddCloth();
    }));
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
      floatingActionButton: (_selectedIndex == 1)
          ? FloatingActionButton(
              onPressed: () => _addCloth(context),
              child: Icon(Icons.add),
              backgroundColor: primaryColor,
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.dns), label: 'Wardrobe')
        ],
      ),
    );
  }
}
