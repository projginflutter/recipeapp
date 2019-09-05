import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:provider/provider.dart';
import 'package:recipeapp/screens/recipedetail.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carousel extends StatefulWidget {
  /// Recipe Name
  final int count;
  //Short description
  final Axis direction;
  final String imgPath;
  final String foodName;

  Carousel(this.count, this.direction, this.imgPath, this.foodName);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  Widget _generateItem(BuildContext context, String recipeName,
      String recipeDesc, String imgThumbnailPath, String indexContr) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => DetailsPage(
                  heroTag: widget.imgPath + '/plate' + indexContr + '.png',
                  foodName: widget.foodName + indexContr))));
        },
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: RecipeCard(recipeName, recipeDesc, imgThumbnailPath)
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
    Stream<QuerySnapshot> snapshots = Provider.of<Recipes>(context).getRecipeStream();
    // TODO: implement build
    return DecoratedBox(
        decoration: BoxDecoration(color: Colors.transparent),
        child: StreamBuilder(
            stream: snapshots,
            builder: (context, snapshot) {
              switch(snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    //child:PlatformProgressIndicator(),
                  );
                default:
                  return ListView.builder(
                    reverse: true,
                    itemCount: snapshot.data.documents.length,
                    scrollDirection: widget.direction,
                    itemBuilder: (context, index) {
                      List rev = snapshot.data.documents.reversed.toList();
                      DocumentSnapshot document = rev[index];
                      return _generateItem(
                          context,
                          document['name'],
                          document['shortDescription'],
                          document['imageAssetPath'],
                          (index + 1).toString());
                    },
                  );
              }

            }
        ));
  }
}
