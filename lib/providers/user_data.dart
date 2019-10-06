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
    if (docs.length > 0) {
      favIds = docs.first.data['favorites'];
      print (favIds);
    }
    return favIds;
  }

  DbService _service;

  UserData({
    @required DbService service,
  }) : _service = service;


  void setUser(FirebaseUser value) {
    _user = value;
    addUser();
    //notifyListeners();
  }

  void addFavorite (int id) async {
    QuerySnapshot qs =  await _service.getDocumentById(_user.uid);
    List<DocumentSnapshot> docs =  qs.documents;
    if (docs.length > 0) {
      List updatedList;
      String docId = docs.first.documentID;
      List favIds = docs.first.data['favorites'];
      Map fData = docs.first.data;
      print("The document ID is " + docId);
      if (null != favIds) {
        updatedList = List.from(favIds);
        if (!favIds.contains(id))
          updatedList.add(id);
      } else {
        updatedList = new List();
      }
      fData['favorites'] = updatedList;
      _service.updateDocument(fData,docId);
      //notifyListeners();
    }

  }

  void removeFavorite (int id) async {
    QuerySnapshot qs =  await _service.getDocumentById(_user.uid);
    List<DocumentSnapshot> docs =  qs.documents;
    if (docs.length > 0) {
      List updatedList;
      String docId = docs.first.documentID;
      List favIds = docs.first.data['favorites'];
      Map fData = docs.first.data;
      print("The document ID (remove) is " + docId);
      if (null != favIds) {
        updatedList = List.from(favIds);
        if (!favIds.contains(id))
          updatedList.remove(id);
      } else {
        updatedList = new List();
      }
      if (favIds.contains(id))
        updatedList.remove(id);
      fData['favorites'] = updatedList;
      _service.updateDocument(fData,docId).whenComplete(() {
        //notifyListeners();
      });

    }

  }

  void addUser () async {
    QuerySnapshot qs =  await _service.getDocumentById(_user.uid);
    List<DocumentSnapshot> docs =  qs.documents;
    if (docs.length > 0) {
      print('User has already logged in');
    } else {
      User user = User(
        id: _user.uid,
        name: _user.displayName,
        phone: _user.email,
//        favorites: [
//          4,
//          7,
//        ]
      );
      print(user.toJson());
      _service.addDocument(user.toJson());

    }

  }
}
