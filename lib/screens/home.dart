import 'package:flutter/material.dart';
import 'package:recipeapp/screens/kings_landing.dart';
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

  String _selectedRoute = '/home';

  _onSelectItem(String route) {
    setState(() => _selectedRoute = route);
    Navigator.of(context).pop(); // close the drawer
  }

  _getDrawerItemWidget(String route) {
    switch (route) {
      case '/search':
        return SearchPage();
      case '/favorites':
        return FavoritePage();
      case '/cart':
        return CartPage();
      case '/home':
        return HomePage();
      default:
        return HomePage();
    }
  }


  Widget build(BuildContext context) {

    return Scaffold (
      appBar: AppBar(title: Text('Cook-Ez')),
      body:_getDrawerItemWidget(_selectedRoute),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Cook-Ez'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: new Icon(Icons.fastfood),
              title: Text('Recipes'),
              onTap: () {
                _onSelectItem('/home');
              },
            ),
            ListTile(
              leading: new Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                _onSelectItem('/search');
              },
            ),
            ListTile(
              leading: new Icon(Icons.favorite),
              title: Text('Favorites'),
              onTap: () {
                _onSelectItem('/favorites');
              },
            ),
            ListTile(
              leading: new Icon(Icons.shopping_cart),
              title: Text('Groceries Cart'),
              onTap: () {
                _onSelectItem('/cart');
              },
            )
          ],
        ),
      ),
    );
  }

//  int _selectedPage = 0;
//
//  final _pageOptions = [HomePage(), SearchPage(), FavoritePage(), CartPage()];
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//      resizeToAvoidBottomPadding: false,
//      resizeToAvoidBottomInset: false,
//      body: _pageOptions[_selectedPage],
//      bottomNavigationBar: BottomNavigationBar(
//          currentIndex: _selectedPage,
//          onTap: (int pageIndex) {
//            setState(() {
//              _selectedPage = pageIndex;
//            });
//          }, // this will be set when a new tab is tapped
//          items: [
//            BottomNavigationBarItem(
//              icon: new Icon(
//                Icons.home,
//                color: Colors.green,
//                size: 25.0,
//              ),
//              title: new Text('Home', style: Styles.iconText,),
//            ),
//            BottomNavigationBarItem(
//              icon: new Icon(
//                Icons.search,
//                color: Colors.green,
//                size: 25.0,
//              ),
//              title: new Text('Search',style: Styles.iconText,),
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.favorite,
//                  color: Colors.green,
//                  size: 25.0,),
//                title: Text('Favorites',style: Styles.iconText,),
//            ),
//            BottomNavigationBarItem(
//                icon: Icon(
//                  Icons.shopping_cart,
//                  color: Colors.green,
//                  size: 25.0,),
//                title: Text('View Cart', style: Styles.iconText,),
//            )
//          ]),
//    );
//  }
}