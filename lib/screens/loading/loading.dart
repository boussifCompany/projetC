import 'package:clothis/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: primaryColor,
        child: SafeArea(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.all(24.0),
              child: SizedBox(
                  height: 90.0,
                  width: 90.0,
                  child: SvgPicture.asset('assets/logo_green.svg'))),
          Expanded(
              child: Center(
                  child: SizedBox(
                      height: 60.0,
                      width: 60.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 6.0,
                        backgroundColor: Colors.white,
                        valueColor:
                            new AlwaysStoppedAnimation<Color>(primaryColor),
                      ))))
        ])));
  }
}
