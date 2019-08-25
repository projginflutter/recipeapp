import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

import 'carousel.dart';

class FoodTray extends StatelessWidget {
  FoodTray(this.name, this.carousel);

  final String name;
  //Short description
  final Carousel carousel;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        Container(
          child: Text(name,
              style: TextStyle(
                  fontSize: 35.0,
                  fontFamily: 'Timesroman',
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          child: carousel,
        )
      ],
    );
  }
}
