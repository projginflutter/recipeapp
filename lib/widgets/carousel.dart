import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

import '../recipeDetail.dart';

class Carousel extends StatelessWidget {
  //TODO change this to get model and relevant recipe data
  Carousel(this.count, this.direction, this.imgPath, this.foodName);

  /// Recipe Name
  final int count;
  //Short description
  final Axis direction;
  final String imgPath;
  final String foodName;

  Widget _generateItem(BuildContext context, String recipeName,
      String recipeDesc, String imgThumbnailPath, String indexContr) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: imgPath + '/plate' + indexContr + '.png',
                  foodName: foodName + indexContr))));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RecipeCard(recipeName, recipeDesc, imgThumbnailPath),
        ));

    //TODO Get Data from provider based on criteria in the state
    /*FutureBuilder<Set>(
          future: prefs.preferredCategories,
          builder: (context, snapshot) {
            final data = snapshot.data ?? Set<>();
            return RecipeCard(, , data.contains(category));
          }),*/
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DecoratedBox(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: ListView.builder(
          itemCount: count,
          scrollDirection: this.direction,
          itemBuilder: (context, index) {
            return _generateItem(
                context,
                'Recipe Name',
                'Desc of the recipe',
                imgPath + '/plate' + (index + 1).toString() + '.png',
                (index + 1).toString());
          },
        ));
  }
}
