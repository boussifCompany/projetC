import 'package:clothis/screens/home/components/weather.dart';
import 'package:clothis/screens/home/home.dart';
import 'package:flutter/cupertino.dart';

class Homepage extends StatefulWidget {
  var callback;

  Homepage(this.callback);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  void retrieveTemp(temp){
    widget.callback(temp);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Weather(retrieveTemp)],
    );
  }
}
