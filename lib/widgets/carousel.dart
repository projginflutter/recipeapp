import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipeapp/widgets/recipe_card.dart';
import 'package:recipeapp/providers/user_data.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:recipeapp/screens/recipedetail.dart';
import 'package:recipeapp/screens/view_detail.dart';
import 'package:recipeapp/model/recipe.dart';
import 'package:recipeapp/providers/recipes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Carousel extends StatefulWidget {
  /// Recipe Name
  final int count;
  //Short description
  final Axis direction;
  final String imgPath;
  final String foodName;
  final String filter;
  List<dynamic> favIds;
  bool isRefreshed=false;

  Carousel(this.count, this.direction, this.imgPath, this.foodName,this.filter);

  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  void initState() {
    //tbd
  }

  Widget _generateItem(BuildContext context, bool isFav, int documentId, String recipeName,
      String recipeDesc, String imgThumbnailPath, Recipe recipe) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push((MaterialPageRoute(
              builder: (context) => ViewRecipe(
                recipe: recipe,
              ))));
        },
        child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: RecipeCard(documentId, recipeName, recipeDesc, imgThumbnailPath, isFav)
        ));

    //TODO Get Data from provider based on criteria in the state
    /*FutureBuilder<Set>(
          future: prefs.preferredCategories,
          builder: (context, snapshot) {
            final data = snapshot.data ?? Set<>();
            return RecipeCard(, , data.contains(category));
          }),*/
  }
  void updateFavorite() async {
    List<dynamic> favIds = await Provider.of<UserData>(context).favorites;
    widget.favIds = favIds;
    if (!widget.isRefreshed)
      setState(() {
        widget.isRefreshed=true;
      });
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
                default: {
                  List rev = [];
                  updateFavorite();
                  if (widget.filter != null && 'Favorites'.compareTo(widget.filter)==0) {
                    if (widget.favIds != null) {
                      rev = snapshot.data.documents.where((d) => widget.favIds.contains(d['id'])).toList();
                    }
                  } else {
                    rev = snapshot.data.documents.toList();
                  }
                  return ListView.builder(
                    reverse: false,
                    itemCount: rev.length,
                    scrollDirection: widget.direction,
                    itemBuilder: (context, index) {
                        DocumentSnapshot document = rev[index];
                        Map<String,dynamic> recMap = new Map<String,dynamic>.from(document.data);
                        recMap.forEach((a,b) {
                          if ('ingredients'==a || 'steps'==a) {
                            List c = new List();
                            (b as List).forEach((e) {
                              e = new Map<String,dynamic>.from(e);
                              c.add(e);
                            });
                            recMap[a] = c;
                          }
                        });
                        Recipe recipe = Recipe.fromJson(recMap);
                        bool isFav = (null != widget.favIds && widget.favIds.contains(document['id'])) ? true:false;
                        return _generateItem(
                            context,
                            isFav,
                            document['id'],
                            document['name'],
                            document['shortDescription'],
                            document['imageAssetPath'],
                            recipe,
                        );
                      }
                  );
                }
              }
            }
        ));
  }
}
