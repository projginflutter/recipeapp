import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeapp/services/db_service.dart';
import 'package:recipeapp/model/user.dart';

class UserData extends ChangeNotifier {

  FirebaseUser _user;

  FirebaseUser get user => _user;

  List<int> _favorites;

  Future<List<dynamic>> get favorites async  {
    List favIds= [];
    QuerySnapshot qs =  await _service.getDocumentById(_user.uid);
    List<DocumentSnapshot> docs =  qs.documents;
    DocumentSnapshot ds = docs.first;
    favIds = ds.data['favorites'];
    return favIds;
  }

  DbService _service;

  UserData({
    @required DbService service,
  }) : _service = service;


  void setUser(FirebaseUser value) {
    _user = value;
    //notifyListeners();
  }

  void addUser () {
    User user = User(
        id: _user.uid,
        name: _user.displayName,
        phone: _user.email,
        favorites: [
          4,
          7,
        ]
    );
    print(user.toJson());
    _service.addDocument(user.toJson());
  }
}
