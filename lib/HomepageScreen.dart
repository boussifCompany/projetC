import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_project/widgets/new_clothe.dart';
import 'package:startup_project/widgets/wardrobe_widget.dart';

import 'Weather.dart';

class HomepageScreen extends StatefulWidget {
  @override
  _HomepageScreenState createState() => _HomepageScreenState();
}

class _HomepageScreenState extends State<HomepageScreen> {
  int _selectedIndex = 0;
  // final WardrobeStorage storage = new WardrobeStorage();

  List<Widget> _titleOptions = <Widget>[
    Text("project C"),
    Text("Wardrobe"),
  ];
  
  List<Widget> _widgetOptions = <Widget>[
    WeatherWidget(),
    WardrobeWidget(),
  ];


  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titleOptions.elementAt(_selectedIndex),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.dns_outlined), label: 'Wardrobe'),
        ],
        // selectedItemColor: Colors.red,
      ),
      floatingActionButton: (_selectedIndex == 1) ?
      FloatingActionButton(
          onPressed: (){
            showModalBottomSheet(
              backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                isScrollControlled: true,
                context: context,
                builder: (context) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: NewClotheScreen(),
                )
            );
          },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ): null,
    );
  }
}
