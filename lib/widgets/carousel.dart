import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';

class Carousel extends StatelessWidget {

  //TODO change this to get model and relevant recipe data
  Carousel(this.count, this.direction);

  /// Recipe Name
  final int count;
  //Short description
  final Axis direction;


  Widget _generateItem() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RecipeCard(
          'Recipe Name',
          'Description of the recipe item goes here',
          'assets/images/avocado.jpg'),
    );
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
    return DecoratedBox(
        decoration: BoxDecoration(color: Color(0xffffffff)),
        child: ListView.builder(
          itemCount: count,
          scrollDirection: this.direction,
          itemBuilder: (context, index) {
            return _generateItem();
          },
        )

    );
  }
}
