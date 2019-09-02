import 'package:flutter/material.dart';
import 'package:recipeapp/screens/recipes_list.dart';
import 'package:recipeapp/screens/favorites.dart';
import 'package:recipeapp/screens/search.dart';
import 'package:recipeapp/screens/view_cart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FirebaseAuth _auth = FirebaseAuth.instance;

  int _selectedPage = 0;

  final _pageOptions = [HomePage(), SearchPage(), FavoritePage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: _pageOptions[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int pageIndex) {
            setState(() {
              _selectedPage = pageIndex;
            });
          }, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.home,
                color: Colors.green,
              ),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.search, color: Colors.green),
              title: new Text('Search'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.green),
                title: Text('Favorites')),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.green),
                title: Text('View Cart'))
          ]),
    );
  }
}