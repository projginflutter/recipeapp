import 'package:flutter/material.dart';
import 'package:recipeapp/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipeapp/providers/user_data.dart';
import 'package:provider/provider.dart';


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
          Provider.of<UserData>(context).setUser(user);
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