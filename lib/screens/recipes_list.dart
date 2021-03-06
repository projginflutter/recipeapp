import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/providers/recipes.dart';
import '../styles.dart';
import 'package:recipeapp/widgets/carousel.dart';

class HomePage extends StatelessWidget {

  Widget _generateCarousals(String homeSection) {
    String name = getNameFromSection(homeSection);
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(name, style: Styles.carousalTitle),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: Carousel(
              6, Axis.horizontal, 'assets/images/plates', 'Avacado recipe',homeSection),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    //Provider.of<Recipes>(context).addRecipe();

    return Stack(
      children: <Widget>[
        Container(
            padding: EdgeInsets.fromLTRB(5.0, 15.0, 15.0, 10.0),
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: <Widget>[
                _generateCarousals("Recently Added"),
                _generateCarousals("Favorites"),
                _generateCarousals("Trending in your area"),
              ],
            )),
//        Positioned(
//          right: 0,
//          bottom: 0,
//          child: FloatingActionButton(
//              child: Text('+'),
//              onPressed: () {
//                //Provider.of<Recipes>(context).addRecipe();
//              },
//          ),
//        ),
      ],
    );
  }

  String getNameFromSection(String homeSection) {
    return homeSection;
  }
}
