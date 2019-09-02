import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LandingPage extends StatelessWidget {

  Future<void> _signInAnonymously() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
    } catch (e) {
      print(e); // TODO: show dialog with error
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          FirebaseUser user = snapshot.data;
          if (user == null) {
            _signInAnonymously();
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          print (user.toString());
          return MyHomePage();
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}