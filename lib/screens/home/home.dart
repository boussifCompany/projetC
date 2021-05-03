import 'package:clothis/models/cloth_model.dart';
import 'package:clothis/models/outfit_model.dart';
import 'package:clothis/models/wardrobe_model.dart';
import 'package:clothis/screens/addCloth/add_cloth.dart';
import 'package:clothis/screens/auth/auth.dart';
import 'package:clothis/screens/home/components/homepage.dart';
import 'package:clothis/screens/home/components/wardrobe.dart';
import 'package:clothis/screens/outfitPage/outfit_page.dart';
import 'package:clothis/styles/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  var mainContext;

  static List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _widgetOptions = <Widget>[
      Homepage(retrieveTemp, showOutfit, widget.wardrobe),
      Wardrobe(widget.wardrobe),
    ];
  }

  void _onItemTapped(int _index) {
    setState(() {
      _selectedIndex = _index;
    });
  }

  void retrieveTemp(temp){
    // print(temp);
    // print(widget.wardrobe.generateOutfit(18));
  }

  void retrieveCloth(ClothModel cloth){
    widget.wardrobe.addCloth(cloth);
  }

  void _addCloth(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AddCloth(retrieveCloth);
    }));
  }

  void showOutfit(OutfitModel outfit){
    Navigator.of(mainContext).push(MaterialPageRoute(builder: (_){
      return OutfitPage(outfit);
    }));
  }

  Future<Auth> logout(context) async{
    await FirebaseAuth.instance.signOut();

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Auth();
    }));
  }

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.black),
              tooltip: 'Logout',
              onPressed:() => logout(context),
            )
          ],
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
