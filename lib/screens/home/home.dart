import 'package:clothis/models/cloth_model.dart';
import 'package:clothis/models/outfit_model.dart';
import 'package:clothis/models/wardrobe_model.dart';
import 'package:clothis/models/weather_model.dart';
import 'package:clothis/screens/addCloth/add_cloth.dart';
import 'package:clothis/screens/auth/auth.dart';
import 'package:clothis/screens/home/components/homepage.dart';
import 'package:clothis/screens/home/components/wardrobe.dart';
import 'package:clothis/screens/outfitPage/outfit_page.dart';
import 'package:clothis/styles/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clothis/services/fetch_weather.dart';

class Home extends StatefulWidget {
  final WardrobeModel wardrobe;

  Home(this.wardrobe);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  var outfits = [];
  var mainContext;
  static List<Widget> _widgetOptions;
  var titles = ["Home", "Wardrobe"];

  @override
  void initState() {
    super.initState();
    _widgetOptions = [
      Homepage(showOutfit, widget.wardrobe, null, []),
      Wardrobe(widget.wardrobe)
    ];
    getWeather();
  }

  void getWeather() async {
    WeatherModel weather = await fetchWeather();
    setState(() {
      for (var i = 0; i < 3; i++) {
        var outfit = widget.wardrobe.generateOutfit(weather.temp);
        if (outfit != null) {
          outfits.add(outfit);
        }
      }
      _widgetOptions = [
        Homepage(showOutfit, widget.wardrobe, weather, outfits),
        Wardrobe(widget.wardrobe)
      ];
    });
  }

  void _onItemTapped(int _index) {
    setState(() {
      _selectedIndex = _index;
    });
  }

  void retrieveCloth(ClothModel cloth) {
    widget.wardrobe.addCloth(cloth);
  }

  void _addCloth(context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return AddCloth(retrieveCloth);
    }));
  }

  void showOutfit(OutfitModel outfit) {
    Navigator.of(mainContext).push(MaterialPageRoute(builder: (_) {
      return OutfitPage(outfit);
    }));
  }

  Future<Auth> logout(context) async {
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
              icon: const Icon(Icons.logout, color: Colors.black),
              tooltip: 'Logout',
              onPressed: () => logout(context),
            )
          ],
          backgroundColor: Colors.white,
          title: Text(
            titles[_selectedIndex],
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
