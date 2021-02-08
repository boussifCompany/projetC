import 'package:clothis/models/FormMode.dart';
import 'package:clothis/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/auth_form.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  FormMode _formMode = FormMode.LOGIN;
  final FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential user;
  bool error = false;
  String errorMsg = "";
  var _ctx = null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Retrieve the data entered in the form
  void retrieveData(String email, String password) {
    if (_formMode == FormMode.LOGIN) {
      login(email, password);
    } else if (_formMode == FormMode.SIGNUP) {
      signup(email, password);
    }
  }

  void goHome() {
    if (user != null) {
      Navigator.of(_ctx).push(MaterialPageRoute(builder: (_) {
        return Home();
      }));
    }
  }

  // Create a new user in the database
  void signup(String email, String password) async {
    try {
      user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error = true;
      if (e.code == 'weak-password') {
        errorMsg = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        errorMsg = 'The account already exists for that email.';
      }
    } catch (e) {
      print(e);
    } finally {
      if (error) {
        setState(() {
          error = error;
          errorMsg = errorMsg;
        });
      }

      goHome();
    }
  }

  // log with the database
  void login(String email, String password) async {
    try {
      user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      error = true;
      if (e.code == 'user-not-found') {
        errorMsg = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMsg = 'Wrong password provided for that user.';
      }
    } finally {
      if (error) {
        setState(() {
          error = error;
          errorMsg = errorMsg;
        });
      }
      goHome();
    }
  }

  // Switch between login and sinup mode
  void switchFormMode() {
    setState(() {
      _formMode =
          (_formMode == FormMode.LOGIN) ? FormMode.SIGNUP : FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Center(
                        child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: SizedBox(
                                height: 90.0,
                                width: 90.0,
                                child: SvgPicture.asset('assets/logo.svg')))),
                    ((error)
                        ? Container(
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  new BoxShadow(
                                      color: Colors.black12,
                                      offset: new Offset(0, 0),
                                      blurRadius: 10)
                                ]),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 10),
                                child: Text(
                                  errorMsg,
                                  style: TextStyle(color: Colors.white),
                                )))
                        : Container()),
                    AuthForm(_formMode, retrieveData),
                    RaisedButton(
                        child: Text((_formMode == FormMode.LOGIN)
                            ? "Sign Up"
                            : "Login"),
                        textColor: Colors.black,
                        color: Colors.white,
                        onPressed: () => switchFormMode())
                  ],
                ))));
  }
}
