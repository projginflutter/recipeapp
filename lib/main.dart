import 'package:flutter/material.dart';
import 'package:recipeapp/widgets/carousel.dart';
import 'package:recipeapp/widgets/foodTray.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

void main() => runApp(MyAppFactory());

class MyAppFactory extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
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
  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 35.0, 15.0, 10.0),
              child: Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(25.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                      hintText: 'Search here for recipes',
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(5.0, 75.0, 15.0, 10.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                        height: 250,
                        child: FoodTray("Newly Added Recipes",
                            Carousel(10, Axis.horizontal)));
                  },
                ))
          ],
        ));
  }
}
