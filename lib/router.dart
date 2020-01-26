import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/screens/kings_landing.dart';
import 'package:recipeapp/screens/favorites.dart';
import 'package:recipeapp/screens/recipes_list.dart';
import 'package:recipeapp/screens/search.dart';
import 'package:recipeapp/screens/view_cart.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return Platform.isAndroid ? MaterialPageRoute(
            builder: (context) => LandingPage()) : CupertinoPageRoute(
            builder: (context) => LandingPage());
      case '/search':
        return MaterialPageRoute(builder: (context) => SearchPage());
      case '/favorites':
        return MaterialPageRoute(builder: (context) => FavoritePage());
      case '/cart':
        return MaterialPageRoute(builder: (context) => CartPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}