import 'package:clothis/screens/auth/widgets/FormMode.dart';
import 'package:clothis/screens/auth/widgets/auth_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  FormMode _formMode = FormMode.LOGIN;

/*  void goTo(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return Home();
    }));
  }*/

  void switchFormMode() {
    setState(() {
      _formMode =
          (_formMode == FormMode.LOGIN) ? FormMode.SIGNUP : FormMode.LOGIN;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            AuthForm(_formMode),
            RaisedButton(
                child: Text((_formMode == FormMode.LOGIN) ?  "Signin" : "Login"),
                textColor: Colors.black,
                color: Colors.white,
                onPressed: () => switchFormMode())
          ],
        )
      )
    ));
  }
}
