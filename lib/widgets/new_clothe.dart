import 'package:flutter/cupertino.dart';
import 'package:startup_project/widgets/new_clothe_form.dart';

class NewClotheScreen extends StatefulWidget {
  @override
  _NewClotheScreenState createState() => _NewClotheScreenState();
}

class _NewClotheScreenState extends State<NewClotheScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(
                  bottom: 8.0, top: 24, left: 16, right: 16
                ),
              child: Text(
                  "New Clothe",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            NewClotheForm(),
          ],
        ),
      ),
    );
  }
}
