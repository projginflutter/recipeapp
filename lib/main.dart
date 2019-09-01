import 'package:flutter/material.dart';
import 'package:recipeapp/widgets/bottomBar.dart';
import 'package:recipeapp/widgets/home.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/provider_bootstrap.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/viewmodel/Recipes.dart';
import 'package:recipeapp/services/recipe_service.dart';


void main() => runApp(MyAppFactory());

class MyAppFactory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(builder: (_) {
        RecipeService _service = new RecipeService('recipes');
        return Recipes(service: _service);
      }),],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: HomePage(),
      bottomNavigationBar: BottomBar(),
    );
  }
}
