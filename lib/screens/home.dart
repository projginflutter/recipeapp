import 'package:flutter/material.dart';
import 'package:recipeapp/screens/recipes_list.dart';
import 'package:recipeapp/screens/favorites.dart';
import 'package:recipeapp/screens/search.dart';
import 'package:recipeapp/screens/view_cart.dart';
import 'package:recipeapp/styles.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
                size: 25.0,
              ),
              title: new Text('Home', style: Styles.iconText,),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.search,
                color: Colors.green,
                size: 25.0,
              ),
              title: new Text('Search',style: Styles.iconText,),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.green,
                  size: 25.0,),
                title: Text('Favorites',style: Styles.iconText,),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.green,
                  size: 25.0,),
                title: Text('View Cart', style: Styles.iconText,),
            )
          ]),
    );
  }
}