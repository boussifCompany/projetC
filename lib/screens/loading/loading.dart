import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          // Once complete we show the login buttons
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Connect to the database");
          }

          //  Else we show a loading widget
          return Text("Loading...");
        });
  }
}
