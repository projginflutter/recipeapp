import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

import '../styles.dart';
import 'carousel.dart';

class FoodTray extends StatelessWidget {
  FoodTray(this.name, this.carousel);

  final String name;
  //Short description
  final Carousel carousel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(name, style: Styles.headlineText),
            ],
          ),
        ),
        SizedBox(
          height: 250,
          child: carousel,
        ),
      ],
    );
  }
}
