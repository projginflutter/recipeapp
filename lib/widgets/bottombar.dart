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
            backgroundColor: Colors.transparent,
            icon: new Icon(
              Icons.home,
              color: Colors.green,
            ),
            title: new Text(
              'Home',
              style: TextStyle(
                color: Colors.green,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.search, color: Colors.green),
            title: new Text(
                'Search',
            style: TextStyle(
              color: Colors.green,
              fontStyle: FontStyle.normal,
            ),),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.green),
              title: Text('Favorites',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                ),
              )),
//          BottomNavigationBarItem(
//            icon: new Stack(
//              children: <Widget>[
//                new Icon(Icons.notifications),
//                new Positioned(
//                  right: 0,
//                  child: new Container(
//                    padding: EdgeInsets.all(1),
//                    decoration: new BoxDecoration(
//                      color: Colors.red,
//                      borderRadius: BorderRadius.circular(6),
//                    ),
//                    constraints: BoxConstraints(
//                      minWidth: 12,
//                      minHeight: 12,
//                    ),
//                    child: new Text(
//                      '$_counter',
//                      style: new TextStyle(
//                        color: Colors.white,
//                        fontSize: 8,
//                      ),
//                      textAlign: TextAlign.center,
//                    ),
//                  ),
//                )
//              ],
//            ),
//            title: Text('Notifications'),
//          ),

          BottomNavigationBarItem(

              icon: Icon(
                  Icons.shopping_cart, color: Colors.green),
              title: Text('View Cart',
                style: TextStyle(
                  color: Colors.green,
                  fontStyle: FontStyle.normal,

                ),
              ))

        ]);
  }
}


