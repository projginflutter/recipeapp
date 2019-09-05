import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserData extends ChangeNotifier {

  FirebaseUser _user;

  FirebaseUser get user => _user;

  void setUser(FirebaseUser value) {
    _user = value;
    //notifyListeners();
  }

}
