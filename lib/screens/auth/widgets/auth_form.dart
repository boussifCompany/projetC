import 'package:clothis/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormMode.dart';

class AuthForm extends StatefulWidget {
  FormMode formMode;

  AuthForm(this.formMode);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: TextFormField(
                maxLines: 1,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  icon: Icon(Icons.mail, color: Colors.black),
                ),
                validator: (value) =>
                    value.isEmpty ? 'Email can\'t b empty' : null,
                onSaved: null,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: TextFormField(
              maxLines: 1,
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
              validator: (value) =>
                  value.isEmpty ? 'Password can\'t be empty' : null,
              onSaved: (value) => {print(value)},
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: RaisedButton(
                onPressed: () {},
                color: primaryColor,
                textColor: Colors.white,
                child: Text(
                  (widget.formMode == FormMode.LOGIN) ? "Login" : "Signin",
                )),
          )
        ],
      ),
    );
  }
}
