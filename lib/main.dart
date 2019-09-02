import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/viewmodel/recipes.dart';
import 'package:recipeapp/services/recipe_service.dart';
import 'package:recipeapp/screens/kings_landing.dart';

void main() => runApp(MyAppFactory());

class MyAppFactory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) {
          RecipeService _service = new RecipeService('recipes');
          return Recipes(service: _service);
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}


