import 'package:clothis/screens/home/components/weather.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Weather()],
    );
  }
}
