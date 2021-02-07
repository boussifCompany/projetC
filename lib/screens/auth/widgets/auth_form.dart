import 'package:clothis/styles/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FormMode.dart';

class AuthForm extends StatefulWidget {
  FormMode formMode;
  final callback;

  AuthForm(this.formMode, this.callback);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
  }

  // If the data are correct we save form and send data to the parent widget
  void validateForm(){
    final form = _formkey.currentState;
    if(form.validate()){
      form.save();
      widget.callback(email, password);
    }
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
                    value.isEmpty ? 'Email can\'t be empty' : null,
                onSaved: (value) => email = value.trim(),
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
              onSaved: (value) => password = value.trim(),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: RaisedButton(
                onPressed: validateForm,
                color: primaryColor,
                textColor: Colors.white,
                child: Text(
                  (widget.formMode == FormMode.LOGIN) ? "Login" : "Sign Up",
                )),
          )
        ],
      ),
    );
  }
}
