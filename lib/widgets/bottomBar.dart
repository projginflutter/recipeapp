import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        currentIndex: 0, // this will be set when a new tab is tapped
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
        ]);
  }
}
