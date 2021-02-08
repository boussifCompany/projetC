import 'package:firebase_auth/firebase_auth.dart';

User getCurrentUser(){
  final FirebaseAuth auth = FirebaseAuth.instance;
  return auth.currentUser;
}
