import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/screens/recipes_list.dart';
import 'package:recipeapp/screens/favorites.dart';
import 'package:recipeapp/screens/search.dart';
import 'package:recipeapp/screens/view_cart.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return Platform.isAndroid? MaterialPageRoute(builder: (context) => HomePage()): CupertinoPageRoute(builder: (context) => HomePage());
    case 'search':
      return MaterialPageRoute(builder: (context) => SearchPage());
    default:
      return MaterialPageRoute(builder: (context) => HomePage());
  }
}