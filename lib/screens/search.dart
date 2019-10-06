import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/searchCard.dart';
import '../styles.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/providers/user_data.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<UserData>(context).user;
    print(user.toString());
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
          child: SearchCard('SearchCard', 'assets/images/plates/plate1.png'),
        )
      ],
    );
  }
}
