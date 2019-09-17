import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:recipeapp/providers/user_data.dart';
import 'package:recipeapp/services/db_service.dart';
import 'package:recipeapp/screens/kings_landing.dart';

void main() => runApp(MyAppFactory());

class MyAppFactory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(builder: (_) {
          DbService _service = new DbService('recipes');
          return Recipes(service: _service);
        }),
        ChangeNotifierProvider(builder: (_) {
          DbService _service = new DbService('users');
          return UserData(service: _service);
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}


